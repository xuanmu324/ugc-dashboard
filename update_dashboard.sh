#!/bin/bash

# 加载nvm环境
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 设置路径
DASHBOARD_DIR="/Users/didi/dchat-workplace/ugc-dashboard"
SOURCE_FILE="/Users/didi/dchat-workplace/integrated_dashboard.html"
LOG_FILE="/Users/didi/dchat-workplace/ugc-dashboard/update.log"

# 记录开始时间
echo "=== $(date) 开始更新 ===" >> $LOG_FILE

# 复制最新的看板文件
cp $SOURCE_FILE $DASHBOARD_DIR/index.html

# 进入项目目录
cd $DASHBOARD_DIR

# Git提交并推送
git add index.html
git commit -m "自动更新: $(date '+%Y-%m-%d %H:%M')"
git push origin main

echo "=== $(date) 更新完成 ===" >> $LOG_FILE
