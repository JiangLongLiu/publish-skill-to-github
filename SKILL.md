---
name: publish-skill-to-github
description: 将 Qoder skill 发布到 GitHub 仓库，包括创建仓库、初始化 Git、添加文档和推送。当用户提到发布 skill、开源 skill、上传到 GitHub 或分享 skill 时使用此 skill。
---

# 发布 Skill 到 GitHub

## 概述

将本地的 Qoder skill 发布到公开的 GitHub 仓库，使其成为可共享的开源项目。

## 发布流程

### 步骤 1: 确认发布准备

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

### 步骤 2: 创建 GitHub 仓库

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

### 步骤 3: 初始化 Git 仓库

在 skill 目录中初始化 Git：

```bash
cd ~/.qoder/skills/skill-name/
git init
git remote add origin https://github.com/USERNAME/skill-name.git
```

### 步骤 4: 配置 Git

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

### 步骤 5: 添加并提交文件

```bash
# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: skill-name description"

# 重命名分支为 main
git branch -M main
```

### 步骤 6: 推送到 GitHub

```bash
# 推送并设置上游分支
git push -u origin main
```

### 步骤 7: 验证发布

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

```bash
# 发布 skill 到 GitHub
bash scripts/publish.sh <skill-name> [github-username]

# 示例
bash scripts/publish.sh docker-compose-desensitizer JiangLongLiu
```

**脚本功能：**
- 检查 skill 目录结构
- 验证 SKILL.md 格式
- 创建 GitHub 仓库
- 初始化 Git 并推送
- 验证发布成功

### validate-skill.sh - 验证脚本

```bash
# 验证 skill 是否准备好发布
bash scripts/validate-skill.sh <skill-path>

# 示例
bash scripts/validate-skill.sh ~/.qoder/skills/docker-compose-desensitizer
```

**验证内容：**
- SKILL.md 是否存在且格式正确
- 是否包含 LICENSE 文件
- 是否有 .gitignore
- 是否包含敏感信息

## 文档准备

### README.md 要求

发布前确保 README.md 包含：

1. **项目标题和描述**
2. **功能特性列表**
3. **快速开始指南**
4. **使用示例**
5. **安装说明**
6. **许可证信息**

### 双语文档（可选）

如果支持多语言：

```
README.md       # 英文主文档
README_zh.md    # 中文文档
```

在 README.md 顶部添加语言切换链接：

```markdown
[[English](README.md)] [[中文](README_zh.md)]
```

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
   - README.md 清晰易懂
   - 包含使用示例
   - 提供安装说明

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
