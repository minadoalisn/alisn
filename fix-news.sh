#!/bin/bash
cd /usr/share/nginx/html

# 修改news.html
file="news.html"
echo "Processing $file..."

# 修改邮箱地址
sed -i 's/slisnlight@163.com/alisnlight@163.com/g' $file

# 添加灯光设计工具入口
sed -i 's/<li><a href="news.html" class="active">新闻资讯<\/a><\/li>/<li><a href="news.html" class="active">新闻资讯<\/a><\/li><li><a href="light-designer.html" style="color: #FFD700; font-weight: bold;">🎨 灯光设计工具<\/a><\/li>/g' $file

echo "news.html processed!"
