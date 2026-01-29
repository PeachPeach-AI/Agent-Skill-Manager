# Agent 技能管理器

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows-0078D6.svg)](https://www.microsoft.com/windows)
[![Skills Count](https://img.shields.io/badge/Skills-30,000+-brightgreen.svg)](https://skills.sh)

[English](README.md) | [中文版](README_CN.md)

这是一个专业、高性能的工具包，旨在发现、管理并批量安装来自 [skills.sh](https://skills.sh) 的**每一个** Agent 技能。

通过绕过前端限制并提取原始 Flight Data，该管理器让你可以访问包含 30,000+ 技能的完整数据库，并配备了现代化的 Web 探索器和自动化安装引擎。

---

## 核心功能

- **批量爬取**：绕过前端显示限制，直接提取 Flight Data 原生数据，一键获取 30,000+ 全量技能。
- **批量下载**：内置自动化安装引擎，读取本地数据库并行执行 `npx skills add` 批量安装指令。
- **可视化展示**：高性能 Web 交互界面，支持海量数据极速搜索与无限滚动浏览。

---

## 环境配置

### 1. 前提条件
- **操作系统**：Windows 10/11（针对 PowerShell 执行进行了优化）。
- **Node.js**：执行 `npx` 命令所必需。
- **Git**：克隆技能仓库所必需。
- **全局代理**：（可选）如果访问 GitHub 有网络问题，建议配置。

### 2. 快速开始
1. **克隆仓库**：`git clone <repository-url>`
2. **深度采集**：运行 `menu.bat` 并选择**选项 1**。这将获取 7.2MB 的 Flight Data 并构建本地缓存。
3. **探索技能**：选择**选项 3** 在浏览器中打开可视化探索器。
4. **批量拉取**：选择**选项 2** 自动安装本地数据库中列出的技能。

---

## 项目结构

| 文件 | 描述 |
| :--- | :--- |
| `menu.bat` | **主控制台**：所有操作的中心入口。 |
| `index.html` | **Web 探索器**：用于浏览 3万+ 技能的高性能 UI。 |
| `collector.ps1` | **采集引擎**：高并发后台数据采集器。 |
| `puller.ps1` | **自动化引擎**：Agent 技能批量安装器。 |
| `data.js` | **数据缓存**：技能数据库的加密本地存储。 |

---

## 赞助与联系

如果你觉得这个工具包对你有帮助，欢迎支持后续开发：

- **赞赏支持**：扫描下方赞赏码，请作者喝杯咖啡。
- **联系作者**：扫描下方二维码添加作者微信，备注“**skills**”即可快速通过。

<div align="center">
  <table style="border: none;">
    <tr>
      <td align="center" style="border: none;">
        <img src="zs.jpg" alt="赞赏码" width="200"><br>
        <b>赞赏一杯咖啡</b>
      </td>
      <td align="center" style="border: none;">
        <img src="qr.jpg" alt="作者微信" width="200"><br>
        <b>添加作者 (备注: skills)</b>
      </td>
    </tr>
  </table>
</div>

---

## 特别鸣谢

本项目由以下平台支持与推广：

[![LLM Bill](https://img.shields.io/badge/Partner-llmbill.com-blue?style=for-the-badge)](https://llmbill.com)

**[LLM Bill - 你的 AI 生活助手](https://llmbill.com)**  
探索最佳 AI 生活工具和精选服务。

---

## 开源协议

本项目采用 **MIT License**。
