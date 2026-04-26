#!/bin/bash
# publish-skill.sh - 将 Qoder skill 发布到 GitHub
# 用法: bash publish.sh <skill-name> [github-username]

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 参数检查
if [ -z "$1" ]; then
    echo -e "${RED}错误: 请提供 skill 名称${NC}"
    echo "用法: bash publish.sh <skill-name> [github-username]"
    exit 1
fi

SKILL_NAME="$1"
GITHUB_USERNAME="${2:-$(git config user.name)}"
SKILL_DIR="$HOME/.qoder/skills/$SKILL_NAME"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}发布 Skill 到 GitHub${NC}"
echo -e "${BLUE}================================${NC}"
echo -e "Skill 名称: ${GREEN}$SKILL_NAME${NC}"
echo -e "GitHub 用户: ${GREEN}$GITHUB_USERNAME${NC}"
echo -e "Skill 目录: ${GREEN}$SKILL_DIR${NC}"
echo ""

# 步骤 1: 检查 skill 目录
echo -e "${YELLOW}[1/8] 检查 skill 目录...${NC}"
if [ ! -d "$SKILL_DIR" ]; then
    echo -e "${RED}错误: Skill 目录不存在: $SKILL_DIR${NC}"
    exit 1
fi

# 步骤 2: 验证必要文件
echo -e "${YELLOW}[2/8] 验证必要文件...${NC}"
if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
    echo -e "${RED}错误: SKILL.md 文件不存在${NC}"
    exit 1
fi

# 检查 SKILL.md 是否包含 frontmatter
if ! grep -q "^---" "$SKILL_DIR/SKILL.md"; then
    echo -e "${RED}错误: SKILL.md 缺少 YAML frontmatter${NC}"
    exit 1
fi

# 检查 LICENSE
if [ ! -f "$SKILL_DIR/LICENSE" ]; then
    echo -e "${YELLOW}警告: LICENSE 文件不存在，建议添加${NC}"
fi

# 检查 README
if [ ! -f "$SKILL_DIR/README.md" ]; then
    echo -e "${YELLOW}警告: README.md 文件不存在，建议添加${NC}"
fi

echo -e "${GREEN}✓ 必要文件检查通过${NC}"

# 步骤 3: 创建 GitHub 仓库
echo -e "${YELLOW}[3/8] 创建 GitHub 仓库...${NC}"
echo -e "${BLUE}使用 GitHub MCP 工具创建仓库...${NC}"
echo -e "${YELLOW}请手动执行以下操作：${NC}"
echo "1. 使用 github.create_repository 工具"
echo "2. 参数: name='$SKILL_NAME', description='Qoder skill: $SKILL_NAME', private=false, auto_init=true"
echo ""
read -p "按 Enter 继续..."

# 步骤 4: 初始化 Git 仓库
echo -e "${YELLOW}[4/8] 初始化 Git 仓库...${NC}"
cd "$SKILL_DIR"

if [ -d ".git" ]; then
    echo -e "${YELLOW}警告: 已存在 .git 目录，将使用现有仓库${NC}"
else
    git init
    echo -e "${GREEN}✓ Git 仓库已初始化${NC}"
fi

# 步骤 5: 配置远程仓库
echo -e "${YELLOW}[5/8] 配置远程仓库...${NC}"
REMOTE_URL="https://github.com/$GITHUB_USERNAME/$SKILL_NAME.git"

if git remote get-url origin &>/dev/null; then
    echo -e "${YELLOW}远程仓库已存在，更新 URL...${NC}"
    git remote set-url origin "$REMOTE_URL"
else
    git remote add origin "$REMOTE_URL"
fi
echo -e "${GREEN}✓ 远程仓库已配置: $REMOTE_URL${NC}"

# 步骤 6: 添加和提交文件
echo -e "${YELLOW}[6/8] 添加和提交文件...${NC}"
git add .

# 检查是否有更改需要提交
if git diff --staged --quiet; then
    echo -e "${YELLOW}没有新的更改需要提交${NC}"
else
    git commit -m "Initial commit: $SKILL_NAME

Qoder skill for $SKILL_NAME"
    echo -e "${GREEN}✓ 文件已提交${NC}"
fi

# 重命名分支为 main
git branch -M main 2>/dev/null || true

# 步骤 7: 推送到 GitHub
echo -e "${YELLOW}[7/8] 推送到 GitHub...${NC}"
if git push -u origin main; then
    echo -e "${GREEN}✓ 推送成功${NC}"
else
    echo -e "${RED}推送失败，尝试强制推送...${NC}"
    echo -e "${YELLOW}注意: 强制推送会覆盖远程仓库的历史${NC}"
    read -p "是否继续? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git push -u origin main --force
        echo -e "${GREEN}✓ 强制推送成功${NC}"
    else
        echo -e "${RED}推送已取消${NC}"
        exit 1
    fi
fi

# 步骤 8: 验证发布
echo -e "${YELLOW}[8/8] 验证发布...${NC}"
echo -e "${BLUE}仓库地址: https://github.com/$GITHUB_USERNAME/$SKILL_NAME${NC}"
echo -e "${BLUE}请手动验证：${NC}"
echo "1. 访问仓库页面"
echo "2. 检查文件是否完整"
echo "3. 确认 README.md 显示正常"
echo ""

# 总结
echo -e "${BLUE}================================${NC}"
echo -e "${GREEN}✓ 发布完成！${NC}"
echo -e "${BLUE}================================${NC}"
echo -e "仓库地址: ${GREEN}https://github.com/$GITHUB_USERNAME/$SKILL_NAME${NC}"
echo -e "Skill 目录: ${GREEN}$SKILL_DIR${NC}"
echo ""
echo -e "${YELLOW}后续步骤：${NC}"
echo "1. 验证仓库内容"
echo "2. 添加仓库描述和标签"
echo "3. 在社交媒体分享"
echo "4. 提交到 Qoder 社区"
echo ""
