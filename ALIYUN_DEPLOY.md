# 阿里云服务器部署指南

## 🎯 为什么选择阿里云服务器？

✅ **国内访问速度快** - 中国大陆访问极速  
✅ **绑定企业域名** - 更专业的企业形象  
✅ **完全控制** - 服务器完全归你管理  
✅ **稳定可靠** - 阿里云99.99%可用性保证

---

## 📋 前置准备

### 1. 你需要有的阿里云资源

- ✅ 阿里云ECS服务器（推荐配置）
  - **配置**：1核2GB 或 2核4GB
  - **系统**：Ubuntu 20.04/22.04 或 CentOS 7/8
  - **带宽**：1Mbps起，建议3Mbps+
  - **地域**：华南1（深圳）或 华南2（河源）- 离江门近

- ✅ 阿里云域名（可选但推荐）
  - 推荐：`ailison-guangdong.com` 或 `ailison.cn`
  - 在阿里云注册域名，自动备案接入

### 2. 服务器登录信息准备

- 服务器公网IP地址
- SSH端口（默认22）
- 用户名（通常是 root）
- 密码或SSH密钥

---

## 🚀 部署步骤

### 步骤1：连接到服务器

#### Windows 用户：
1. 下载 Xshell 或 PuTTY
2. 输入服务器IP、端口、用户名、密码连接

#### Mac/Linux 用户：
```bash
ssh root@你的服务器IP
```

---

### 步骤2：安装 Nginx Web服务器

#### Ubuntu/Debian 系统：
```bash
# 更新系统
apt update && apt upgrade -y

# 安装 Nginx
apt install nginx -y

# 启动 Nginx
systemctl start nginx
systemctl enable nginx

# 检查状态
systemctl status nginx
```

#### CentOS/RHEL 系统：
```bash
# 更新系统
yum update -y

# 安装 Nginx
yum install nginx -y

# 启动 Nginx
systemctl start nginx
systemctl enable nginx

# 检查状态
systemctl status nginx
```

---

### 步骤3：配置防火墙

#### Ubuntu/Debian (UFW):
```bash
ufw allow 'Nginx Full'
ufw enable
```

#### CentOS/RHEL (firewalld):
```bash
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
```

#### 阿里云安全组（重要！）：
1. 登录阿里云控制台
2. 找到你的ECS实例
3. 点击 `安全组` → `配置规则`
4. 添加入方向规则：
   - **端口范围**：80/80, 443/443
   - **授权对象**：0.0.0.0/0

---

### 步骤4：上传网站文件

#### 方式A：使用 SCP/SFTP 工具（推荐）

1. 使用 FileZilla、WinSCP 或其他SFTP工具
2. 连接到服务器（IP、端口、用户名、密码）
3. 把本地 `ailison-guangdong` 文件夹中的所有文件上传到：
   - `/var/www/html/` （Nginx默认目录）

#### 方式B：使用 Git 从 GitHub 拉取（推荐用于自动更新）

```bash
# 安装 Git
apt install git -y  # Ubuntu
# 或
yum install git -y  # CentOS

# 进入网站目录
cd /var/www/html

# 克隆仓库
git clone https://github.com/minadoalisn/alisn.git .

# 注意最后的 "." 表示克隆到当前目录
```

---

### 步骤5：配置 Nginx

创建网站配置文件：

```bash
# 编辑配置文件
nano /etc/nginx/sites-available/ailison
```

复制以下内容：

```nginx
server {
    listen 80;
    listen [::]:80;

    server_name your-domain.com www.your-domain.com;  # 替换为你的域名

    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    # Gzip 压缩
    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_types text/plain text/css text/xml text/javascript application/javascript application/xml+rss application/json;
}
```

启用配置：

```bash
# 创建符号链接
ln -s /etc/nginx/sites-available/ailison /etc/nginx/sites-enabled/

# 测试配置
nginx -t

# 重启 Nginx
systemctl restart nginx
```

---

### 步骤6：配置 HTTPS（SSL证书）

使用 Let's Encrypt 免费证书：

```bash
# 安装 Certbot
apt install certbot python3-certbot-nginx -y  # Ubuntu
# 或
yum install certbot python3-certbot-nginx -y  # CentOS

# 获取并安装证书
certbot --nginx -d your-domain.com -d www.your-domain.com

# 按照提示输入邮箱并同意条款
```

Certbot 会自动配置 Nginx 并设置自动续期！

---

## 🔄 自动更新方案

### 方案一：使用 Git Webhook（全自动）

1. 在仓库设置中添加 Webhook
2. 服务器上配置接收 Webhook 的脚本
3. 每次推送到 GitHub，服务器自动拉取更新

### 方案二：定时拉取（简单）

```bash
# 创建更新脚本
nano /var/www/update-site.sh
```

内容：
```bash
#!/bin/bash
cd /var/www/html
git pull origin main
```

设置定时任务：
```bash
# 编辑 crontab
crontab -e

# 添加每小时自动拉取
0 * * * * /var/www/update-site.sh
```

---

## 📊 推荐服务器配置

### 入门版（性价比最高）
- **实例规格**：ecs.t6-c1m1.small（1核2GB）
- **系统盘**：40GB ESSD
- **带宽**：3Mbps
- **操作系统**：Ubuntu 22.04 LTS
- **预估费用**：约 ¥60-100/月

### 标准版（推荐）
- **实例规格**：ecs.t6-c1m2.large（1核4GB）
- **系统盘**：40GB ESSD
- **带宽**：5Mbps
- **操作系统**：Ubuntu 22.04 LTS
- **预估费用**：约 ¥120-180/月

---

## 🌐 域名配置

### 如果使用阿里云域名：
1. 在阿里云注册域名（推荐）
2. 域名实名认证
3. 域名备案（如果需要在中国内地访问）
4. 配置DNS解析：
   - 记录类型：A
   - 主机记录：@ 或 www
   - 记录值：你的服务器公网IP

---

## ⚠️ 重要提醒

1. **服务器安全**：
   - 修改默认SSH端口
   - 使用SSH密钥登录，禁用密码登录
   - 配置防火墙，只开放必要端口
   - 定期更新系统

2. **数据备份**：
   - 定期备份网站文件
   - 使用阿里云快照功能

3. **监控告警**：
   - 配置云监控
   - 设置CPU、内存、磁盘告警

---

## 🆘 需要帮助？

如果在部署过程中遇到问题：
1. 查看阿里云官方文档
2. 联系阿里云技术支持
3. 搜索相关教程

---

**广东艾里森光电技术有限公司**
*用光影重构景区流量密码*
