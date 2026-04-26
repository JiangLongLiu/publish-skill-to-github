# 发布 Skill 检查清单

## 发布前检查

### 1. 文件完整性

- [ ] `SKILL.md` 存在且格式正确
- [ ] `README.md` 存在且内容完整
- [ ] `LICENSE` 文件存在（推荐 MIT）
- [ ] `.gitignore` 文件存在
- [ ] 所有必要的辅助脚本在 `scripts/` 目录中
- [ ] 示例文件在 `examples/` 目录中（如果适用）

### 2. SKILL.md 质量

- [ ] 包含完整的 YAML frontmatter
- [ ] `name` 字段符合规范（小写、连字符、最大 64 字符）
- [ ] `description` 字段清晰且包含触发关键词
- [ ] 描述使用第三人称
- [ ] 包含明确的使用场景
- [ ] 文件大小在 500 行以内
- [ ] 使用渐进式披露（详细文档放在单独文件）

### 3. 文档质量

- [ ] README.md 包含项目标题
- [ ] 包含功能特性列表
- [ ] 包含快速开始指南
- [ ] 包含使用示例
- [ ] 包含安装说明
- [ ] 语言清晰简洁
- [ ] 无拼写错误
- [ ] 代码示例可运行

### 4. 安全性

- [ ] 无硬编码的密码或密钥
- [ ] 无敏感的个人数据
- [ ] 示例数据不包含真实信息
- [ ] .gitignore 排除了敏感文件
- [ ] 无 API 密钥或令牌

### 5. 代码质量

- [ ] 所有脚本可正常运行
- [ ] 包含错误处理
- [ ] 代码格式一致
- [ ] 注释清晰
- [ ] 无调试代码或临时文件

## 发布步骤

### 步骤 1: 验证 Skill

```bash
# 运行验证脚本
bash scripts/validate-skill.sh ~/.qoder/skills/skill-name
```

**检查项：**
- [ ] 验证脚本运行成功
- [ ] 无错误
- [ ] 警告已处理（如果有）

### 步骤 2: 准备 GitHub 仓库

- [ ] 确定仓库名称（与 skill 名称一致）
- [ ] 编写仓库描述
- [ ] 确认仓库为公开（private=false）
- [ ] 启用 auto_init

### 步骤 3: 创建仓库

使用 GitHub MCP 工具：
```
工具: github.create_repository
参数:
{
  "name": "skill-name",
  "description": "Qoder skill description",
  "private": false,
  "auto_init": true
}
```

- [ ] 仓库创建成功
- [ ] 记录仓库 URL

### 步骤 4: 初始化 Git

```bash
cd ~/.qoder/skills/skill-name/
git init
git remote add origin https://github.com/USERNAME/skill-name.git
```

- [ ] Git 仓库初始化成功
- [ ] 远程仓库配置正确

### 步骤 5: 提交文件

```bash
git add .
git commit -m "Initial commit: skill-name"
git branch -M main
```

- [ ] 所有文件已添加
- [ ] 提交信息清晰
- [ ] 分支重命名为 main

### 步骤 6: 推送

```bash
git push -u origin main
```

- [ ] 推送成功
- [ ] 无冲突

### 步骤 7: 验证

- [ ] 访问仓库页面
- [ ] 检查文件完整性
- [ ] README.md 显示正常
- [ ] 所有链接有效
- [ ] 代码高亮正常

## 发布后操作

### 仓库配置

- [ ] 添加仓库描述
- [ ] 添加主题标签（topics）
- [ ] 设置网站 URL（如果有）
- [ ] 启用 Issues
- [ ] 添加项目主页（如果有）

### 推广

- [ ] 在社交媒体分享
- [ ] 提交到 Qoder 社区
- [ ] 添加到相关目录
- [ ] 通知潜在用户

### 维护

- [ ] 监控 Issues
- [ ] 响应 PR
- [ ] 定期更新
- [ ] 维护文档

## 常见问题处理

### 验证失败

**问题：** SKILL.md 格式错误
**解决：** 
- 检查 YAML frontmatter 格式
- 确保 name 和 description 字段存在
- 验证字段值符合规范

**问题：** 缺少必要文件
**解决：**
- 添加 LICENSE 文件
- 创建 README.md
- 添加 .gitignore

### 推送失败

**问题：** 远程仓库已存在
**解决：**
```bash
git remote set-url origin NEW_URL
git push -u origin main
```

**问题：** 冲突
**解决：**
```bash
git pull origin main --rebase
git push -u origin main
```

## 最佳实践

### 文档

1. **简洁明了**：使用清晰简洁的语言
2. **示例优先**：提供实际可运行的示例
3. **渐进式披露**：基本信息在 README，详细信息在单独文件
4. **多语言支持**：考虑添加多语言文档

### 代码

1. **错误处理**：所有脚本包含完善的错误处理
2. **注释**：关键逻辑添加注释
3. **测试**：发布前测试所有功能
4. **格式**：保持一致的代码风格

### 安全

1. **敏感信息**：绝不提交敏感信息
2. **示例数据**：使用虚构的示例数据
3. **权限**：最小权限原则
4. **更新**：定期更新依赖

## 发布模板

### 提交信息模板

```markdown
Initial commit: [skill-name]

[Short description of what the skill does]

Features:
- Feature 1
- Feature 2
- Feature 3

Usage:
[Basic usage instructions]
```

### 仓库描述模板

```markdown
Qoder skill for [purpose]. [Brief description of functionality]. Use when [trigger scenarios].
```

## 资源链接

- [Qoder Skills 文档](https://docs.qoder.com/skills)
- [GitHub 仓库指南](https://docs.github.com/en/repositories)
- [MIT 许可证模板](https://opensource.org/licenses/MIT)
- [Markdown 语法指南](https://www.markdownguide.org/)
