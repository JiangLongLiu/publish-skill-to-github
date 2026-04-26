# Publish Skill to GitHub

🚀 A Qoder skill for publishing Qoder skills to GitHub repositories

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview / 概述

This skill provides a complete workflow for publishing Qoder skills to GitHub, including:
- Automated repository creation
- Git initialization and configuration
- Pre-publish validation
- One-click publishing scripts

这个 skill 提供了将 Qoder skill 发布到 GitHub 的完整工作流，包括：
- 自动化仓库创建
- Git 初始化和配置
- 发布前验证
- 一键发布脚本

## Features / 功能特性

- ✅ **Pre-publish Validation / 发布前验证**: Check skill completeness and quality / 检查 skill 完整性和质量
- 🚀 **One-click Publishing / 一键发布**: Automated repository creation and push / 自动化仓库创建和推送
- 📋 **Checklist / 检查清单**: Comprehensive publishing checklist / 全面的发布检查清单
- 🔒 **Security Check / 安全检查**: Detect sensitive information / 检测敏感信息

## Quick Start / 快速开始

### Installation / 安装

This skill is automatically installed in `~/.qoder/skills/publish-skill-to-github/`

此 skill 已自动安装在 `~/.qoder/skills/publish-skill-to-github/`

### Usage / 使用方法

#### Method 1: Using the Skill / 使用 Skill

Simply ask the agent to publish a skill:
只需请求 agent 发布 skill：

```
Publish my skill "docker-compose-desensitizer" to GitHub
```

#### Method 2: Using Scripts / 使用脚本

**Validate before publishing / 发布前验证：**
```bash
bash scripts/validate-skill.sh ~/.qoder/skills/your-skill-name
```

**Publish to GitHub / 发布到 GitHub：**
```bash
bash scripts/publish.sh your-skill-name your-github-username
```

## Examples / 示例

### Example 1: Validate a Skill / 验证 Skill

```bash
bash scripts/validate-skill.sh ~/.qoder/skills/docker-compose-desensitizer
```

**Output / 输出：**
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

### Example 2: Publish to GitHub / 发布到 GitHub

```bash
bash scripts/publish.sh docker-compose-desensitizer JiangLongLiu
```

**Output / 输出：**
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

## Workflow / 工作流

### Step-by-step Process / 逐步流程

1. **Validation / 验证**: Run validation script / 运行验证脚本
2. **Preparation / 准备**: Ensure all files are ready / 确保所有文件就绪
3. **Repository Creation / 创建仓库**: Create GitHub repository / 创建 GitHub 仓库
4. **Git Initialization / Git 初始化**: Initialize and configure Git / 初始化和配置 Git
5. **Commit / 提交**: Add and commit files / 添加和提交文件
6. **Push / 推送**: Push to GitHub / 推送到 GitHub
7. **Verification / 验证**: Verify successful publish / 验证发布成功

## Files / 文件结构

```
publish-skill-to-github/
├── SKILL.md              # Main skill documentation / 主要 skill 文档
├── README.md             # This file / 本文件
├── CHECKLIST.md          # Publishing checklist / 发布检查清单
├── .gitignore            # Git ignore rules / Git 忽略规则
└── scripts/
    ├── validate-skill.sh # Pre-publish validation / 发布前验证
    └── publish.sh        # One-click publishing / 一键发布
```

## Best Practices / 最佳实践

### Before Publishing / 发布前

1. ✅ Run validation script / 运行验证脚本
2. ✅ Check for sensitive information / 检查敏感信息
3. ✅ Ensure README.md is complete / 确保 README.md 完整
4. ✅ Add appropriate LICENSE / 添加适当的 LICENSE
5. ✅ Test all scripts / 测试所有脚本

### After Publishing / 发布后

1. ✅ Verify repository on GitHub / 在 GitHub 上验证仓库
2. ✅ Add repository description and topics / 添加仓库描述和主题
3. ✅ Share on social media / 在社交媒体分享
4. ✅ Submit to Qoder community / 提交到 Qoder 社区

## Troubleshooting / 故障排除

### Common Issues / 常见问题

**Issue: Validation fails**
**问题：验证失败**

- Check SKILL.md format / 检查 SKILL.md 格式
- Ensure all required fields are present / 确保所有必需字段存在
- Run validation script for details / 运行验证脚本获取详细信息

**Issue: Push rejected**
**问题：推送被拒绝**

```bash
# Pull remote changes first
git pull origin main --rebase
git push -u origin main
```

## License / 许可证

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## Support / 支持

- 🐛 [Report Issues / 报告问题](https://github.com/JiangLongLiu/publish-skill-to-github/issues)
- 💡 [Feature Requests / 功能请求](https://github.com/JiangLongLiu/publish-skill-to-github/issues)

## ⭐ Show Your Support / 支持我们

If this skill helped you, please give it a star! 🌟

如果这个 skill 对您有帮助，请给它一个星标！🌟

---

Made with ❤️ by [JiangLongLiu](https://github.com/JiangLongLiu) / 由 [JiangLongLiu](https://github.com/JiangLongLiu) 用 ❤️ 制作
