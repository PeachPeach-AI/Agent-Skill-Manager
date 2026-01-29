# Agent Skill Manager

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows-0078D6.svg)](https://www.microsoft.com/windows)
[![Skills Count](https://img.shields.io/badge/Skills-30,000+-brightgreen.svg)](https://skills.sh)

[English](README.md) | [中文版](README_CN.md)

A professional, high-performance toolkit designed to discover, manage, and batch-install **every single** agent skill available on [skills.sh](https://skills.sh). 

By bypassing front-end limitations and extracting raw flight data, this manager gives you access to the full universe of 30,000+ skills, complete with a modern web explorer and automated installation engine.

---

## Key Features

- **Batch Scrape**: Unlock the entire database of 30,000+ skills by bypassing front-end limits and extracting raw flight data.
- **Batch Download**: Automated installation engine that processes your local database and installs skills in bulk using `npx skills add`.
- **Visual Explorer**: A high-performance, dark-themed web interface for searching and browsing the massive skill library with ease.

---

## Environment Setup

### 1. Prerequisites
- **OS**: Windows 10/11 (Optimized for PowerShell execution).
- **Node.js**: Required for `npx` commands.
- **Git**: Required for cloning skill repositories.
- **Global Proxy**: (Optional) Recommended if you experience network issues reaching GitHub.

### 2. Quick Start
1. **Clone the Repo**: `git clone <repository-url>`
2. **Deep Scrape**: Run `menu.bat` and choose **Option 1**. This fetches the 7.2MB flight data and builds your local cache.
3. **Explore**: Choose **Option 3** to open the Visual Explorer in your browser.
4. **Batch Pull**: Choose **Option 2** to automatically install skills listed in your local database.

---

## Project Structure

| File | Description |
| :--- | :--- |
| `menu.bat` | **Main Console**: The central entry point for all operations. |
| `index.html` | **Web Explorer**: High-performance UI for browsing 30k+ skills. |
| `collector.ps1` | **Scraper Engine**: High-concurrency background data collector. |
| `puller.ps1` | **Automation Engine**: Batch installer for agent skills. |
| `data.js` | **Data Cache**: Encrypted local storage for the skill universe. |

---

## Support the Project

If you find this toolkit helpful, consider supporting the development:

- **Donate**: Scan the QR code below to buy me a coffee.
- **Contact Author**: Scan the author's WeChat QR code. Please add a note "**skills**" for a quick approval.

<div align="center">
  <table style="border: none;">
    <tr>
      <td align="center" style="border: none;">
        <img src="zs.jpg" alt="Donate" width="200"><br>
        <b>Buy Me a Coffee</b>
      </td>
      <td align="center" style="border: none;">
        <img src="qr.jpg" alt="Author" width="200"><br>
        <b>Add Author (Note: skills)</b>
      </td>
    </tr>
  </table>
</div>

---

## Special Thanks

This project is supported and promoted by:

[![LLM Bill](https://img.shields.io/badge/Partner-llmbill.com-blue?style=for-the-badge)](https://llmbill.com)

**[LLM Bill - Your AI Life Partner](https://llmbill.com)**  
Explore the best AI lifestyle tools and curated services.

---

## License

Distributed under the **MIT License**.
