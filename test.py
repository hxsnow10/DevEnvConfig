#!/usr/bin/env python
# -*- encoding=utf8
# @author      : xiahong (xiahahaha01@gmail.com)
# @file        : test
# @created     : Tuesday Jan 07, 2025 09:06:52 CST

import argparse
import sys

# 递归计算斐波那契数列  
def fib(n):
    if n < 2:
        return n
    return fib(n-1) + fib(n-2)

def main():
    print(fib(10))
    return 0

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--input_path", default=None, type=str)
    parser.add_argument("--foo", action = "store_true")
    args = parser.parse_args()

    main()
