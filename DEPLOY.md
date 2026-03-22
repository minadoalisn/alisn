# 广东艾里森光电网站部署指南

## 🚀 快速部署方案（推荐）

### 方案一：GitHub Pages 部署（最推荐）

#### 步骤1：准备GitHub账号
1. 访问 https://github.com 注册账号
2. 登录后创建新仓库
   - 仓库名建议：`ailison-guangdong`
   - 设置为 Public（公开）

#### 步骤2：上传网站文件
1. 将网站文件夹中的所有文件上传到仓库
2. 确保 `index.html` 在仓库根目录

#### 步骤3：开启GitHub Pages
1. 进入仓库的 `Settings`
2. 找到 `Pages` 选项
3. 在 `Build and deployment` 中：
   - Source 选择 `Deploy from a branch`
   - Branch 选择 `main` 或 `master`
   - 文件夹选择 `/ (root)`
4. 点击 `Save`
5. 等待1-2分钟，网站就上线了！

#### 步骤4：访问网站
- 地址格式：`https://你的用户名.github.io/ailison-guangdong/`

---

### 方案二：Netlify 部署（最简单）

#### 步骤1：注册Netlify
1. 访问 https://www.netlify.com
2. 使用GitHub账号注册登录

#### 步骤2：部署网站
1. 登录后直接把网站文件夹拖拽到页面上
2. 等待上传完成
3. 网站自动上线！

#### 步骤3：访问网站
- 地址格式：`https://随机名称.netlify.app`
- 可以在设置中修改站点名称

---

### 方案三：Gitee Pages 部署（国内最快）

#### 步骤1：注册Gitee
1. 访问 https://gitee.com 注册账号
2. 实名认证（国内需要）

#### 步骤2：创建仓库上传文件
1. 创建新仓库
2. 上传网站文件

#### 步骤3：开启Gitee Pages
1. 进入仓库的 `服务` → `Gitee Pages`
2. 选择部署分支
3. 点击 `启动`
4. 等待审核通过后即可访问

---

## 🌐 免费域名配置

### Freenom 免费域名注册

#### 步骤1：访问Freenom
1. 访问 https://www.freenom.com
2. 搜索你想要的域名（如 `ailison-guangdong.tk`）

#### 步骤2：选择域名
1. 选择一个免费域名（.tk, .ml, .ga, .cf, .gq）
2. 加入购物车
3. 选择使用期限（最多12个月，免费）

#### 步骤3：注册账号并结账
1. 注册Freenom账号
2. 完成结账（免费）

#### 步骤4：配置DNS
1. 进入 Freenom 的 `My Domains`
2. 找到你的域名，点击 `Manage Domain`
3. 进入 `Manage Freenom DNS`
4. 添加以下记录：

   **GitHub Pages 配置：**
   ```
   类型：A
   名称：（留空或@）
   地址：185.199.108.153
   地址：185.199.109.153
   地址：185.199.110.153
   地址：185.199.111.153
   ```

   **Netlify 配置：**
   ```
   类型：CNAME
   名称：www
   地址：你的站点.netlify.app
   ```

---

## 📝 各平台对比

| 平台 | 免费 | 国内速度 | 自定义域名 | HTTPS | 部署难度 |
|------|------|----------|------------|-------|----------|
| GitHub Pages | ✅ | ⭐⭐ | ✅ | ✅ | ⭐⭐ |
| Netlify | ✅ | ⭐⭐ | ✅ | ✅ | ⭐ |
| Vercel | ✅ | ⭐⭐ | ✅ | ✅ | ⭐ |
| Cloudflare Pages | ✅ | ⭐⭐⭐ | ✅ | ✅ | ⭐⭐ |
| Gitee Pages | ✅ | ⭐⭐⭐⭐⭐ | ✅ | ⚠️ | ⭐⭐ |

---

## 🎯 推荐组合

### 组合1：国际访问为主
- **托管**：GitHub Pages
- **域名**：Freenom 免费域名
- **优势**：稳定、全球CDN、完全免费

### 组合2：国内访问为主
- **托管**：Gitee Pages
- **域名**：Freenom 或使用 Gitee 自带域名
- **优势**：国内速度快

### 组合3：最简单方案
- **托管**：Netlify
- **域名**：使用 Netlify 自带域名
- **优势**：5分钟上线，无需配置

---

## 🔧 常见问题

### Q: 网站文件在哪里？
A: 在 `ailison-guangdong` 文件夹中，包含：
- index.html（主页）
- about.html（关于我们）
- services.html（主营业务）
- sitemap.xml（站点地图）
- robots.txt（爬虫规则）

### Q: 可以修改网站内容吗？
A: 可以！直接修改HTML文件后重新上传即可。

### Q: 需要花钱吗？
A: 完全免费！上述所有方案都不需要付费。

### Q: 国内访问慢怎么办？
A: 推荐使用 Gitee Pages 或 Cloudflare Pages。

---

## 📞 需要帮助？

如果在部署过程中遇到问题，可以：
1. 查看对应平台的官方文档
2. 搜索相关教程
3. 联系技术支持

---

**广东艾里森光电技术有限公司**
*用光影重构景区流量密码*
