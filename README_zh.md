# 发布 Skill 到 GitHub

🚀 用于将 Qoder skill 发布到 GitHub 仓库的 Qoder skill

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[[English](README.md)] [[中文](README_zh.md)]

## 概述 / Overview

这个 skill 提供了将 Qoder skill 发布到 GitHub 的完整工作流，包括：
- 自动化仓库创建
- Git 初始化和配置
- 发布前验证
- 一键发布脚本

This skill provides a complete workflow for publishing Qoder skills to GitHub, including:
- Automated repository creation
- Git initialization and configuration
- Pre-publish validation
- One-click publishing scripts

## 功能特性 / Features

- ✅ **发布前验证 / Pre-publish Validation**: 检查 skill 完整性和质量 / Check skill completeness and quality
- 🚀 **一键发布 / One-click Publishing**: 自动化仓库创建和推送 / Automated repository creation and push
- 📋 **检查清单 / Checklist**: 全面的发布检查清单 / Comprehensive publishing checklist
- 🔒 **安全检查 / Security Check**: 检测敏感信息 / Detect sensitive information

## 快速开始 / Quick Start

### 安装 / Installation

此 skill 已自动安装在 `~/.qoder/skills/publish-skill-to-github/`

This skill is automatically installed in `~/.qoder/skills/publish-skill-to-github/`

### 使用方法 / Usage

#### 方法 1: 使用 Skill / Using the Skill

只需请求 agent 发布 skill：
Simply ask the agent to publish a skill：

```
发布我的 skill "docker-compose-desensitizer" 到 GitHub
```

#### 方法 2: 使用脚本 / Using Scripts

**发布前验证 / Validate before publishing：**
```bash
bash scripts/validate-skill.sh ~/.qoder/skills/your-skill-name
```

**发布到 GitHub / Publish to GitHub：**
```bash
bash scripts/publish.sh your-skill-name your-github-username
```

## 使用示例 / Examples

### 示例 1: 验证 Skill / Validate a Skill

```bash
bash scripts/validate-skill.sh ~/.qoder/skills/docker-compose-desensitizer
```

**输出 / Output：**
```
================================
验证 Skill 发布准备
================================
Skill 路径: /home/user/.qoder/skills/docker-compose-desensitizer

[检查 1] Skill 目录...
✓ 目录存在
[检查 2] SKILL.md 文件...
✓ SKILL.md 存在
✓ 包含 YAML frontmatter
✓ Skill 名称: docker-compose-desensitizer
✓ 包含 description 字段
...

================================
验证结果
================================
✓ 所有检查通过！Skill 已准备好发布
```

### 示例 2: 发布到 GitHub / Publish to GitHub

```bash
bash scripts/publish.sh docker-compose-desensitizer JiangLongLiu
```

**输出 / Output：**
```
================================
发布 Skill 到 GitHub
================================
Skill 名称: docker-compose-desensitizer
GitHub 用户: JiangLongLiu
Skill 目录: /home/user/.qoder/skills/docker-compose-desensitizer

[1/8] 检查 skill 目录...
[2/8] 验证必要文件...
✓ 必要文件检查通过
[3/8] 创建 GitHub 仓库...
...
[7/8] 推送到 GitHub...
✓ 推送成功
[8/8] 验证发布...

================================
✓ 发布完成！
================================
仓库地址: https://github.com/JiangLongLiu/docker-compose-desensitizer
```

## 工作流 / Workflow

### 逐步流程 / Step-by-step Process

1. **验证 / Validation**: 运行验证脚本 / Run validation script
2. **准备 / Preparation**: 确保所有文件就绪 / Ensure all files are ready
3. **创建仓库 / Repository Creation**: 创建 GitHub 仓库 / Create GitHub repository
4. **Git 初始化 / Git Initialization**: 初始化和配置 Git / Initialize and configure Git
5. **提交 / Commit**: 添加和提交文件 / Add and commit files
6. **推送 / Push**: 推送到 GitHub / Push to GitHub
7. **验证 / Verification**: 验证发布成功 / Verify successful publish

## 文件结构 / Files

```
publish-skill-to-github/
├── SKILL.md              # 主要 skill 文档 / Main skill documentation
├── README.md             # 英文文档 / English documentation
├── README_zh.md          # 中文文档 / Chinese documentation（本文件 / This file）
├── CHECKLIST.md          # 发布检查清单 / Publishing checklist
├── .gitignore            # Git 忽略规则 / Git ignore rules
└── scripts/
    ├── validate-skill.sh # 发布前验证 / Pre-publish validation
    └── publish.sh        # 一键发布 / One-click publishing
```

## 最佳实践 / Best Practices

### 发布前 / Before Publishing

1. ✅ 运行验证脚本 / Run validation script
2. ✅ 检查敏感信息 / Check for sensitive information
3. ✅ 确保 README.md 完整 / Ensure README.md is complete
4. ✅ 添加适当的 LICENSE / Add appropriate LICENSE
5. ✅ 测试所有脚本 / Test all scripts

### 发布后 / After Publishing

1. ✅ 在 GitHub 上验证仓库 / Verify repository on GitHub
2. ✅ 添加仓库描述和主题 / Add repository description and topics
3. ✅ 在社交媒体分享 / Share on social media
4. ✅ 提交到 Qoder 社区 / Submit to Qoder community

## 故障排除 / Troubleshooting

### 常见问题 / Common Issues

**问题：验证失败 / Issue: Validation fails**

- 检查 SKILL.md 格式 / Check SKILL.md format
- 确保所有必需字段存在 / Ensure all required fields are present
- 运行验证脚本获取详细信息 / Run validation script for details

**问题：推送被拒绝 / Issue: Push rejected**

```bash
# 先拉取远程更改 / Pull remote changes first
git pull origin main --rebase
git push -u origin main
```

## 许可证 / License

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 支持 / Support

- 🐛 [报告问题 / Report Issues](https://github.com/JiangLongLiu/publish-skill-to-github/issues)
- 💡 [功能请求 / Feature Requests](https://github.com/JiangLongLiu/publish-skill-to-github/issues)

## ⭐ 支持我们 / Show Your Support

如果这个 skill 对您有帮助，请给它一个星标！🌟

If this skill helped you, please give it a star! 🌟

---

由 [JiangLongLiu](https://github.com/JiangLongLiu) 用 ❤️ 制作 / Made with ❤️ by [JiangLongLiu](https://github.com/JiangLongLiu)
