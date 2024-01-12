#!/bin/bash

# 检查 yarn 是否已安装
if ! command -v yarn &> /dev/null
then
    echo "yarn could not be found, installing..."
    npm install -g yarn
fi

# 运行在 package.json 中定义的脚本
yarn 