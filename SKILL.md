---
name: publish-skill-to-github
description: 将 Qoder skill 发布到 GitHub 仓库，包括创建仓库、初始化 Git、添加文档和推送。当用户提到发布 skill、开源 skill、上传到 GitHub 或分享 skill 时使用此 skill。
---

# 发布 Skill 到 GitHub

## 概述

将本地的 Qoder skill 发布到公开的 GitHub 仓库，使其成为可共享的开源项目。

## 发布流程

### 步骤 0: 生成双语说明文档（重要）

**在发布前，必须为 skill 生成完整的双语说明文档：**

#### 生成 README.md（纯英文版本）

创建完整的英文 README.md，必须包含以下部分：

```markdown
# [Skill Name]

🔧 [One-line description of what the skill does]

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[[English](README.md)] [[中文](README_zh.md)]

## Overview

[2-3 paragraphs describing the skill's purpose, key features, and benefits]

## Features

- ✅ **Feature 1**: Description
- 🚀 **Feature 2**: Description
- 📋 **Feature 3**: Description
- 🔒 **Feature 4**: Description

## Quick Start

### Installation

[Installation instructions]

### Usage

[Usage examples and instructions]

## Examples

### Example 1: [Example Title]

```bash
[Command example]
```

**Output:**
```
[Expected output]
```

### Example 2: [Example Title]

[More examples]

## Workflow

### Step-by-step Process

1. **Step 1**: Description
2. **Step 2**: Description
3. **Step 3**: Description

## Files

```
skill-name/
├── SKILL.md              # Main skill documentation
├── README.md             # English documentation (This file)
├── README_zh.md          # Chinese documentation
├── LICENSE               # MIT License
└── scripts/              # Utility scripts
```

## Best Practices

### Before [Action]

1. ✅ Step 1
2. ✅ Step 2

### After [Action]

1. ✅ Step 1
2. ✅ Step 2

## Troubleshooting

### Common Issues

**Issue: [Problem description]**
**Solution:** [How to fix it]

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- 🐛 [Report Issues](https://github.com/USERNAME/skill-name/issues)
- 💡 [Feature Requests](https://github.com/USERNAME/skill-name/issues)

## ⭐ Show Your Support

If this skill helped you, please give it a star! 🌟

---

Made with ❤️ by [YourName](https://github.com/YourName)
```

#### 生成 README_zh.md（纯中文版本）

创建完整的中文 README_zh.md，内容应与 README.md 对应：

```markdown
# [Skill 名称]

🔧 [一句话描述 skill 的功能]

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[[English](README.md)] [[中文](README_zh.md)]

## 概述

[2-3 段描述 skill 的目的、主要功能和优势]

## 功能特性

- ✅ **功能 1**: 描述
- 🚀 **功能 2**: 描述
- 📋 **功能 3**: 描述
- 🔒 **功能 4**: 描述

## 快速开始

### 安装

[安装说明]

### 使用方法

[使用示例和说明]

## 使用示例

### 示例 1: [示例标题]

```bash
[命令示例]
```

**输出：**
```
[预期输出]
```

### 示例 2: [示例标题]

[更多示例]

## 工作流

### 逐步流程

1. **步骤 1**: 描述
2. **步骤 2**: 描述
3. **步骤 3**: 描述

## 文件结构

```
skill-name/
├── SKILL.md              # 主要 skill 文档
├── README.md             # 英文文档
├── README_zh.md          # 中文文档（本文件）
├── LICENSE               # MIT 许可证
└── scripts/              # 辅助脚本
```

## 最佳实践

### 发布前

1. ✅ 步骤 1
2. ✅ 步骤 2

### 发布后

1. ✅ 步骤 1
2. ✅ 步骤 2

## 故障排除

### 常见问题

**问题：[问题描述]**
**解决方案：** [解决方法]

## 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 支持

- 🐛 [报告问题](https://github.com/USERNAME/skill-name/issues)
- 💡 [功能请求](https://github.com/USERNAME/skill-name/issues)

## ⭐ 支持我们

如果这个 skill 对您有帮助，请给它一个星标！🌟

---

由 [YourName](https://github.com/YourName) 用 ❤️ 制作
```

#### 文档要求

**内容要求：**
- ✅ 完整的功能描述和使用说明
- ✅ 至少 2-3 个实际使用示例
- ✅ 清晰的步骤流程
- ✅ 故障排除指南
- ✅ 最佳实践建议

**格式要求：**
- ✅ README.md 纯英文，无中文内容
- ✅ README_zh.md 纯中文，无英文内容（代码除外）
- ✅ 两个文件顶部都有语言切换链接
- ✅ 使用相同的标题层级和结构
- ✅ 代码示例保持一致

**质量要求：**
- ✅ 语言清晰、简洁
- ✅ 无拼写错误
- ✅ 所有链接有效
- ✅ 代码示例可运行

### 步骤 2: 确认发布准备

在发布前，确保 skill 目录包含以下文件：

```
skill-name/
├── SKILL.md              # 必需 - 主文档
├── README.md             # 推荐 - 用户文档
├── LICENSE               # 必需 - 开源许可证
├── .gitignore            # 推荐 - Git 忽略规则
├── scripts/              # 可选 - 辅助脚本
└── examples/             # 可选 - 示例文件
```

**检查清单：**
- [ ] SKILL.md 包含完整的 YAML frontmatter
- [ ] 描述清晰且包含触发关键词
- [ ] 添加了适当的开源许可证（推荐 MIT）
- [ ] 移除了敏感信息和个人数据
- [ ] 测试了所有脚本和功能

### 步骤 3: 创建 GitHub 仓库

使用 GitHub MCP 工具创建仓库：

```bash
# 使用 MCP 工具创建仓库
# 工具: github.create_repository
# 参数:
{
  "name": "skill-name",
  "description": "Skill 的简短描述",
  "private": false,
  "auto_init": true
}
```

**仓库命名规范：**
- 使用小写字母和连字符
- 与 skill 名称一致
- 最大 64 字符
- 示例：`docker-compose-desensitizer`

### 步骤 4: 初始化 Git 仓库

在 skill 目录中初始化 Git：

```bash
cd ~/.qoder/skills/skill-name/
git init
git remote add origin https://github.com/USERNAME/skill-name.git
```

### 步骤 5: 配置 Git

设置用户信息和 .gitignore：

```bash
# 配置用户信息
git config user.name "YourName"
git config user.email "your.email@example.com"

# 添加 .gitignore（如果还没有）
# 包含 Python、测试文件、临时文件等
```

**推荐的 .gitignore 内容：**
```
# Python
__pycache__/
*.py[cod]
*.pyc

# 测试文件
test-*.yml
test-*.json
*.backup-*.txt

# 环境
.env
.env.*
!.env.example

# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db
```

### 步骤 6: 添加并提交文件

```bash
# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: skill-name description"

# 重命名分支为 main
git branch -M main
```

### 步骤 7: 推送到 GitHub

```bash
# 推送并设置上游分支
git push -u origin main
```

### 步骤 8: 验证发布

使用 GitHub MCP 工具验证：

```bash
# 检查文件是否存在
# 工具: github.get_file_contents
# 参数:
{
  "owner": "USERNAME",
  "repo": "skill-name",
  "path": "README.md"
}

# 查看提交历史
# 工具: github.list_commits
# 参数:
{
  "owner": "USERNAME",
  "repo": "skill-name"
}
```

## 自动化脚本

使用提供的辅助脚本简化发布流程：

### publish.sh - 一键发布脚本

**注意：在运行此脚本前，请先完成步骤 0，确保已生成 README.md 和 README_zh.md**

```bash
# 发布 skill 到 GitHub
bash scripts/publish.sh <skill-name> [github-username]

# 示例
bash scripts/publish.sh docker-compose-desensitizer JiangLongLiu
```

**脚本功能：**
- 检查 skill 目录结构
- 验证 SKILL.md 格式
- 检查是否包含 README.md 和 README_zh.md
- 创建 GitHub 仓库
- 初始化 Git 并推送
- 验证发布成功

### validate-skill.sh - 验证脚本

**注意：此脚本会检查是否包含 README.md 和 README_zh.md**

```bash
# 验证 skill 是否准备好发布
bash scripts/validate-skill.sh <skill-path>

# 示例
bash scripts/validate-skill.sh ~/.qoder/skills/docker-compose-desensitizer
```

**验证内容：**
- SKILL.md 是否存在且格式正确
- 是否包含 README.md（英文）
- 是否包含 README_zh.md（中文）
- 是否包含 LICENSE 文件
- 是否有 .gitignore
- 是否包含敏感信息

## 文档准备

### README.md 和 README_zh.md 要求

**发布前必须生成完整的双语说明文档：**

#### README.md（纯英文）必须包含：

1. **项目标题和描述**
2. **功能特性列表**
3. **快速开始指南**
4. **使用示例**（至少 2-3 个）
5. **安装说明**
6. **工作流说明**
7. **最佳实践**
8. **故障排除**
9. **许可证信息**

#### README_zh.md（纯中文）必须包含：

1. **项目标题和描述**
2. **功能特性列表**
3. **快速开始指南**
4. **使用示例**（至少 2-3 个）
5. **安装说明**
6. **工作流说明**
7. **最佳实践**
8. **故障排除**
9. **许可证信息**

### 语言切换链接

在两个文件的顶部添加：

```markdown
[[English](README.md)] [[中文](README_zh.md)]
```

### 文档质量标准

- ✅ 内容完整、准确
- ✅ 语言清晰、简洁
- ✅ 代码示例可运行
- ✅ 无拼写错误
- ✅ 所有链接有效
- ✅ 格式一致

## 许可证选择

### 推荐：MIT 许可证

```markdown
MIT License

Copyright (c) 2026 YourName

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

[完整文本见 LICENSE 文件]
```

## 最佳实践

### 发布前检查

1. **内容审查**
   - 移除所有敏感信息
   - 检查是否有硬编码的密码或密钥
   - 确认示例数据不包含真实信息

2. **文档完整性**
   - ✅ README.md 存在且内容完整（纯英文）
   - ✅ README_zh.md 存在且内容完整（纯中文）
   - ✅ 两个文档都有语言切换链接
   - ✅ 包含使用示例
   - ✅ 提供安装说明

3. **代码质量**
   - 所有脚本可正常运行
   - 包含错误处理
   - 代码格式一致

### 发布后操作

1. **验证仓库**
   - 检查文件是否完整
   - 确认 README 显示正常
   - 测试克隆和安装

2. **推广分享**
   - 在社交媒体分享
   - 提交到 Qoder 社区
   - 添加到相关目录

## 故障排除

### 常见问题

**问题：推送被拒绝**
```bash
# 解决方案：先拉取远程更改
git pull origin main --rebase
git push -u origin main
```

**问题：SKILL.md 格式错误**
```bash
# 使用验证脚本检查
bash scripts/validate-skill.sh <skill-path>
```

**问题：仓库已存在**
```bash
# 使用已存在的仓库
git remote set-url origin https://github.com/USERNAME/existing-repo.git
git push -u origin main
```

## 附加资源

- 对于详细的 SKILL.md 编写指南，参见 [SKILL-BEST-PRACTICES.md](SKILL-BEST-PRACTICES.md)
- 对于发布检查清单，参见 [CHECKLIST.md](CHECKLIST.md)
