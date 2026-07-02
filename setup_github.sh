#!/bin/bash
# ==============================================
# 功能：在服务器上生成 SSH 密钥并添加至 GitHub
# 用法：bash setup_github_ssh.sh
# 前置：需准备 GitHub 个人访问令牌（有 admin:public_key 权限）
# ==============================================

set -e

# 颜色输出
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}===== GitHub SSH 自动配置脚本 =====${NC}"

# ---------- 1. 生成 SSH 密钥（如不存在） ----------
SSH_DIR="$HOME/.ssh"
KEY_FILE="$SSH_DIR/id_ed25519"
PUB_FILE="$KEY_FILE.pub"

if [ -f "$KEY_FILE" ]; then
    echo -e "${YELLOW}⚠️  已存在私钥 $KEY_FILE，将复用（不再重新生成）${NC}"
else
    echo "🔑 生成新的 ED25519 密钥对..."
    mkdir -p "$SSH_DIR"
    chmod 700 "$SSH_DIR"
    ssh-keygen -t ed25519 -f "$KEY_FILE" -N "" -C "server-$(hostname)-$(date +%Y%m%d)"
    echo -e "${GREEN}✅ 密钥生成完成${NC}"
fi

# 显示公钥（方便手动添加）
echo -e "\n${YELLOW}📋 公钥内容如下（复制备用）：${NC}"
cat "$PUB_FILE"
echo ""

# ---------- 2. 获取 GitHub 个人访问令牌 ----------
read -sp "🔑 请输入你的 GitHub 个人访问令牌（需含 admin:public_key 权限）: " GITHUB_TOKEN
echo ""

if [ -z "$GITHUB_TOKEN" ]; then
    echo -e "${RED}❌ 未输入令牌，退出。${NC}"
    exit 1
fi

# ---------- 3. 通过 GitHub API 上传公钥 ----------
echo "📤 正在通过 API 上传公钥到 GitHub..."

PUB_KEY_CONTENT=$(cat "$PUB_FILE")
# 标题：主机名+日期，方便识别
TITLE="$(hostname)-$(date +%Y%m%d)"

RESPONSE=$(curl -s -X POST \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user/keys \
    -d "{\"title\":\"$TITLE\",\"key\":\"$PUB_KEY_CONTENT\"}")

# 检查是否成功（返回中包含 "id" 字段即成功）
if echo "$RESPONSE" | grep -q '"id":'; then
    echo -e "${GREEN}✅ 公钥成功添加到 GitHub！标题: $TITLE${NC}"
else
    echo -e "${RED}❌ 上传失败，响应信息：${NC}"
    echo "$RESPONSE"
    exit 1
fi

# ---------- 4. 配置 SSH 客户端永久使用该密钥（重要） ----------
echo "🔧 配置 SSH config 文件..."
mkdir -p ~/.ssh

sed -i '/^Host github.com$/,/^$/d' ~/.ssh/config
cat >> ~/.ssh/config << EOF

Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    StrictHostKeyChecking no
EOF
chmod 600 ~/.ssh/config
echo -e "${GREEN}✅ SSH 配置已固化，今后直接 git clone 即可${NC}"

# ---------- 5. 验证连接 ----------
echo -e "\n${GREEN}🔍 测试 SSH 连接 GitHub...${NC}"
ssh -T git@github.com 2>&1 | grep -q "successfully authenticated" && \
    echo -e "${GREEN}✅ 认证成功！${NC}" || \
    echo -e "${YELLOW}⚠️  请手动测试: ssh -T git@github.com${NC}"

# 设置提交者姓名和邮箱（与密钥认证无关，仅供代码提交时显示）
git config --global user.email "xiahahaha01@gmail.com"
git config --global user.name "xiahong"

echo -e "${GREEN}===== 全部完成 =====${NC}"

