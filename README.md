# Publish Skill to GitHub

🚀 A Qoder skill for publishing Qoder skills to GitHub repositories

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[[English](README.md)] [[中文](README_zh.md)]

## Overview

This skill provides a complete workflow for publishing Qoder skills to GitHub, including:
- Automated repository creation
- Git initialization and configuration
- Pre-publish validation
- One-click publishing scripts

## Features

- ✅ **Pre-publish Validation**: Check skill completeness and quality
- 🚀 **One-click Publishing**: Automated repository creation and push
- 📋 **Checklist**: Comprehensive publishing checklist
- 🔒 **Security Check**: Detect sensitive information

## Quick Start

### Installation

This skill is automatically installed in `~/.qoder/skills/publish-skill-to-github/`

### Usage

#### Method 1: Using the Skill

Simply ask the agent to publish a skill:

```
Publish my skill "docker-compose-desensitizer" to GitHub
```

#### Method 2: Using Scripts

**Validate before publishing:**
```bash
bash scripts/validate-skill.sh ~/.qoder/skills/your-skill-name
```

**Publish to GitHub:**
```bash
bash scripts/publish.sh your-skill-name your-github-username
```

## Examples

### Example 1: Validate a Skill

```bash
bash scripts/validate-skill.sh ~/.qoder/skills/docker-compose-desensitizer
```

**Output:**
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

### Example 2: Publish to GitHub

```bash
bash scripts/publish.sh docker-compose-desensitizer JiangLongLiu
```

**Output:**
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

## Workflow

### Step-by-step Process

1. **Validation**: Run validation script
2. **Preparation**: Ensure all files are ready
3. **Repository Creation**: Create GitHub repository
4. **Git Initialization**: Initialize and configure Git
5. **Commit**: Add and commit files
6. **Push**: Push to GitHub
7. **Verification**: Verify successful publish

## Files

```
publish-skill-to-github/
├── SKILL.md              # Main skill documentation
├── README.md             # English documentation (This file)
├── README_zh.md          # Chinese documentation
├── CHECKLIST.md          # Publishing checklist
├── .gitignore            # Git ignore rules
└── scripts/
    ├── validate-skill.sh # Pre-publish validation
    └── publish.sh        # One-click publishing
```

## Best Practices

### Before Publishing

1. ✅ Run validation script
2. ✅ Check for sensitive information
3. ✅ Ensure README.md is complete
4. ✅ Add appropriate LICENSE
5. ✅ Test all scripts

### After Publishing

1. ✅ Verify repository on GitHub
2. ✅ Add repository description and topics
3. ✅ Share on social media
4. ✅ Submit to Qoder community

## Troubleshooting

### Common Issues

**Issue: Validation fails**

- Check SKILL.md format
- Ensure all required fields are present
- Run validation script for details

**Issue: Push rejected**

```bash
# Pull remote changes first
git pull origin main --rebase
git push -u origin main
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- 🐛 [Report Issues](https://github.com/JiangLongLiu/publish-skill-to-github/issues)
- 💡 [Feature Requests](https://github.com/JiangLongLiu/publish-skill-to-github/issues)

## ⭐ Show Your Support

If this skill helped you, please give it a star! 🌟

---

Made with ❤️ by [JiangLongLiu](https://github.com/JiangLongLiu)
