# Agent Skill Manager (Agent 技能全量管理器) 🚀

A professional automation toolkit to discover, manage, and batch-install ALL agent skills from [skills.sh](https://skills.sh).
一个专业的自动化工具包，用于发现、管理并批量安装来自 [skills.sh](https://skills.sh) 的**所有** Agent 技能。

---

## 🌟 Key Features (核心亮点)

- **30,000+ Skills Discovery**: Extract full flight data directly from the source, bypassing the 200-item limit.
  **全量发现**：直接提取后台 Flight Data，突破前端展示限制，一键获取 3 万+ 全量技能。
- **Modern Web Explorer**: Browse all skills via a high-performance web interface with **Infinite Scroll**.
  **现代化探索器**：内置基于 Web 的 3D 风格探索器，支持**无限滚动**，即使 3 万条数据也丝滑顺畅。
- **Anti-Scraping Protection**: Implemented Base64 link obfuscation and dynamic event handling to protect your data.
  **反爬保护**：集成 Base64 链接混淆与动态事件处理，有效阻断自动化爬虫批量采集。
- **Batch Installation**: Automated `npx skills add` with smart skip-logic for already installed skills.
  **批量安装**：全自动执行安装命令，具备智能去重逻辑，避免重复工作。

---

## 📋 Environment Setup (环境配置)

### 1. Basic Requirements (基础软件)
- **Windows OS**: Windows 10/11 recommended (for optimal PowerShell performance).
  **Windows 系统**：推荐 Win10/11。
- **Node.js**: **REQUIRED**. Ensure `node` and `npx` are in your PATH.
  **Node.js**：**必须安装**。确保 `npx` 命令可用。
- **Git**: **REQUIRED**. Used for cloning skill repositories.
  **Git**：**必须安装**。用于拉取 GitHub 仓库代码。

### 2. Network Environment (网络要求)
- **GitHub Access**: You must be able to reach `github.com` via terminal.
  **GitHub 访问**：确保你的命令行环境可以正常访问 GitHub（如有必要请配置代理）。

---

## 📖 Quick Start (操作指南)

### Step 1: Deep Scrape (深度采集)
Run `menu.bat` and choose **Option 1**. 
This downloads the 7.2MB background database and generates a local encrypted cache (`data.js`).
运行 `menu.bat` 选择选项 **1**。这将抓取后台 7.2MB 数据包并生成加密本地缓存 `data.js`。

### Step 2: Visual Explore (可视化探索)
Choose **Option 3** from the menu. 
This opens `index.html` in your browser. You can search, browse tens of thousands of skills, and click to visit their GitHub pages instantly.
选择选项 **3** 打开可视化首页。支持快速搜索、无限滚动，并可点击卡片直接跳转 GitHub。

### Step 3: Batch Pull (批量拉取)
Choose **Option 2**. The manager will read your CSV and install skills one by line.
选择选项 **2**。管理器将按列表自动批量执行安装命令。

---

## 📂 File Structure (目录结构)

- `menu.bat`: The Management Console (管理控制台).
- `index.html`: Modern Web Explorer (可视化探索首页).
- `collector.ps1`: Data Scraper (高并发采集引擎).
- `puller.ps1`: Command Executor (批量执行器).
- `data.js`: Encrypted local data cache (加密本地数据缓存).
- `skills_database.csv`: Local Registry (本地技能注册表).

---

## 🔗 Special Thanks (致谢)

Supported and Promoted by:
本项目由以下平台支持与推广：

👉 **[LLM Bill - Your AI Life Partner](https://llmbill.com)** 👈

Explore the best AI lifestyle tools and services at **llmbill.com**.

---

## ⚖️ License

MIT License. Developed by Antigravity AI for the community.
MIT 自由使用协议。由 Antigravity AI 为社区开发。
