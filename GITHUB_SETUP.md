# GitHub 自动访问配置指南

## 🎯 方案一：使用 Personal Access Token (PAT) - 推荐

### 步骤1：生成 GitHub Personal Access Token

1. 访问 GitHub Settings：https://github.com/settings/profile
2. 点击左侧菜单的 `Developer settings`
3. 点击 `Personal access tokens` → `Tokens (classic)`
4. 点击 `Generate new token` → `Generate new token (classic)`
5. 填写信息：
   - **Note**：`艾里森光电网站自动更新`
   - **Expiration**：选择 `No expiration`（或选择一个过期时间）
   - **Scopes**：勾选 `repo`（完整仓库访问权限）
6. 点击 `Generate token`
7. **重要！** 复制生成的token（格式类似：`ghp_xxxxxxxxxxxx`），只显示一次！

### 步骤2：配置 Git 使用 Token

#### 方式A：使用凭证管理器（推荐）

在命令行中运行：
```bash
cd C:\Users\35810\.openclaw\workspace\ailison-guangdong
git remote set-url origin https://你的Token@github.com/minadoalisn/alisn.git
```

例如：
```bash
git remote set-url origin https://ghp_xxxxxxxxxxxx@github.com/minadoalisn/alisn.git
```

#### 方式B：使用 Windows 凭证管理器

1. 下次推送时，GitHub会提示输入用户名和密码
2. 用户名：你的GitHub用户名
3. 密码：粘贴刚才生成的Token
4. 勾选"记住凭证"

---

## 🔐 方案二：使用 SSH 密钥（更安全）

### 步骤1：生成 SSH 密钥

1. 打开 Git Bash 或 PowerShell
2. 运行以下命令（替换你的邮箱）：
```bash
ssh-keygen -t ed25519 -C "slisnlight@163.com"
```
3. 按回车使用默认路径
4. 可以设置密码短语（也可以留空直接回车）

### 步骤2：添加 SSH 密钥到 GitHub

1. 复制公钥内容：
```bash
cat ~/.ssh/id_ed25519.pub
```
2. 访问：https://github.com/settings/keys
3. 点击 `New SSH key`
4. Title 填写：`艾里森光电网站`
5. Key 粘贴刚才复制的公钥
6. 点击 `Add SSH key`

### 步骤3：切换仓库使用 SSH

```bash
cd C:\Users\35810\.openclaw\workspace\ailison-guangdong
git remote set-url origin git@github.com:minadoalisn/alisn.git
```

---

## 🚀 配置完成后，以后如何更新网站？

### 方式一：使用命令行（快速）

```bash
cd C:\Users\35810\.openclaw\workspace\ailison-guangdong
git add .
git commit -m "更新网站内容"
git push
```

### 方式二：使用 GitHub Desktop（可视化）

1. 打开 GitHub Desktop
2. 它会自动检测文件变化
3. 填写提交信息
4. 点击 `Commit to main`
5. 点击 `Push origin`

---

## 📋 推荐配置步骤总结

1. **生成 PAT Token**（按照方案一步骤1）
2. **配置 Git**（按照方案一步骤2）
3. **测试推送**：修改一个文件测试是否能自动推送
4. **以后更新**：修改文件 → `git add .` → `git commit` → `git push`

---

## ⚠️ 安全提醒

- **不要**把 Token 提交到代码仓库中
- **不要**把 Token 分享给其他人
- 如果 Token 泄露，立即到 GitHub 删除并重新生成
- 定期检查你的 GitHub 安全日志

---

## 🆘 需要帮助？

如果在配置过程中遇到问题：
1. 查看 GitHub 官方文档：https://docs.github.com
2. 搜索相关错误信息
3. 联系技术支持

---

**广东艾里森光电技术有限公司**
*用光影重构景区流量密码*
