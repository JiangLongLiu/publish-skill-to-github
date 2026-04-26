#!/bin/bash
# validate-skill.sh - 验证 Qoder skill 是否准备好发布
# 用法: bash validate-skill.sh <skill-path>

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

ERRORS=0
WARNINGS=0

# 参数检查
if [ -z "$1" ]; then
    echo -e "${RED}错误: 请提供 skill 路径${NC}"
    echo "用法: bash validate-skill.sh <skill-path>"
    echo "示例: bash validate-skill.sh ~/.qoder/skills/my-skill"
    exit 1
fi

SKILL_PATH="$1"

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}验证 Skill 发布准备${NC}"
echo -e "${BLUE}================================${NC}"
echo -e "Skill 路径: ${GREEN}$SKILL_PATH${NC}"
echo ""

# 检查 1: 目录存在
echo -e "${YELLOW}[检查 1] Skill 目录...${NC}"
if [ -d "$SKILL_PATH" ]; then
    echo -e "${GREEN}✓ 目录存在${NC}"
else
    echo -e "${RED}✗ 目录不存在${NC}"
    ERRORS=$((ERRORS + 1))
    exit 1
fi

# 检查 2: SKILL.md 文件
echo -e "${YELLOW}[检查 2] SKILL.md 文件...${NC}"
if [ -f "$SKILL_PATH/SKILL.md" ]; then
    echo -e "${GREEN}✓ SKILL.md 存在${NC}"
    
    # 检查 frontmatter
    if head -n 1 "$SKILL_PATH/SKILL.md" | grep -q "^---"; then
        echo -e "${GREEN}✓ 包含 YAML frontmatter${NC}"
        
        # 检查 name 字段
        if grep -q "^name:" "$SKILL_PATH/SKILL.md"; then
            SKILL_NAME=$(grep "^name:" "$SKILL_PATH/SKILL.md" | head -1 | sed 's/name: *//')
            echo -e "${GREEN}✓ Skill 名称: $SKILL_NAME${NC}"
        else
            echo -e "${RED}✗ 缺少 name 字段${NC}"
            ERRORS=$((ERRORS + 1))
        fi
        
        # 检查 description 字段
        if grep -q "^description:" "$SKILL_PATH/SKILL.md"; then
            echo -e "${GREEN}✓ 包含 description 字段${NC}"
        else
            echo -e "${RED}✗ 缺少 description 字段${NC}"
            ERRORS=$((ERRORS + 1))
        fi
    else
        echo -e "${RED}✗ 缺少 YAML frontmatter${NC}"
        ERRORS=$((ERRORS + 1))
    fi
else
    echo -e "${RED}✗ SKILL.md 不存在${NC}"
    ERRORS=$((ERRORS + 1))
fi

# 检查 3: README.md 文件
echo -e "${YELLOW}[检查 3] README.md 文件...${NC}"
if [ -f "$SKILL_PATH/README.md" ]; then
    echo -e "${GREEN}✓ README.md 存在${NC}"
    
    # 检查基本内容
    if grep -q "# " "$SKILL_PATH/README.md"; then
        echo -e "${GREEN}✓ 包含标题${NC}"
    else
        echo -e "${YELLOW}! 建议添加标题${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo -e "${YELLOW}! README.md 不存在（推荐添加）${NC}"
    WARNINGS=$((WARNINGS + 1))
fi

# 检查 4: LICENSE 文件
echo -e "${YELLOW}[检查 4] LICENSE 文件...${NC}"
if [ -f "$SKILL_PATH/LICENSE" ]; then
    echo -e "${GREEN}✓ LICENSE 存在${NC}"
else
    echo -e "${YELLOW}! LICENSE 不存在（推荐添加 MIT 许可证）${NC}"
    WARNINGS=$((WARNINGS + 1))
fi

# 检查 5: .gitignore 文件
echo -e "${YELLOW}[检查 5] .gitignore 文件...${NC}"
if [ -f "$SKILL_PATH/.gitignore" ]; then
    echo -e "${GREEN}✓ .gitignore 存在${NC}"
else
    echo -e "${YELLOW}! .gitignore 不存在（推荐添加）${NC}"
    WARNINGS=$((WARNINGS + 1))
fi

# 检查 6: 敏感信息
echo -e "${YELLOW}[检查 6] 敏感信息检查...${NC}"
SENSITIVE_PATTERNS="(password|secret|token|api_key|apikey|private_key)"
if grep -ri "$SENSITIVE_PATTERNS" "$SKILL_PATH" --include="*.md" --include="*.py" --include="*.sh" --exclude-dir=".git" 2>/dev/null; then
    echo -e "${YELLOW}! 检测到可能的敏感信息，请手动检查${NC}"
    WARNINGS=$((WARNINGS + 1))
else
    echo -e "${GREEN}✓ 未检测到明显的敏感信息${NC}"
fi

# 检查 7: 脚本文件（如果存在）
echo -e "${YELLOW}[检查 7] 脚本文件...${NC}"
if [ -d "$SKILL_PATH/scripts" ]; then
    SCRIPT_COUNT=$(find "$SKILL_PATH/scripts" -name "*.sh" -o -name "*.py" | wc -l)
    if [ "$SCRIPT_COUNT" -gt 0 ]; then
        echo -e "${GREEN}✓ 找到 $SCRIPT_COUNT 个脚本文件${NC}"
        
        # 检查脚本是否可执行
        for script in "$SKILL_PATH/scripts"/*.sh; do
            if [ -f "$script" ]; then
                if [ -x "$script" ]; then
                    echo -e "${GREEN}  ✓ $(basename $script) 可执行${NC}"
                else
                    echo -e "${YELLOW}  ! $(basename $script) 不可执行，建议添加执行权限${NC}"
                    chmod +x "$script" 2>/dev/null || true
                fi
            fi
        done
    else
        echo -e "${YELLOW}! scripts 目录为空${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo -e "${BLUE}ℹ 没有 scripts 目录（可选）${NC}"
fi

# 检查 8: 示例文件（如果存在）
echo -e "${YELLOW}[检查 8] 示例文件...${NC}"
if [ -d "$SKILL_PATH/examples" ]; then
    EXAMPLE_COUNT=$(find "$SKILL_PATH/examples" -type f | wc -l)
    if [ "$EXAMPLE_COUNT" -gt 0 ]; then
        echo -e "${GREEN}✓ 找到 $EXAMPLE_COUNT 个示例文件${NC}"
    else
        echo -e "${YELLOW}! examples 目录为空${NC}"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo -e "${BLUE}ℹ 没有 examples 目录（可选）${NC}"
fi

# 总结
echo ""
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}验证结果${NC}"
echo -e "${BLUE}================================${NC}"

if [ "$ERRORS" -eq 0 ] && [ "$WARNINGS" -eq 0 ]; then
    echo -e "${GREEN}✓ 所有检查通过！Skill 已准备好发布${NC}"
    exit 0
elif [ "$ERRORS" -eq 0 ]; then
    echo -e "${YELLOW}! 发现 $WARNINGS 个警告${NC}"
    echo -e "${YELLOW}  建议修复警告后再发布${NC}"
    exit 0
else
    echo -e "${RED}✗ 发现 $ERRORS 个错误和 $WARNINGS 个警告${NC}"
    echo -e "${RED}  必须修复错误后才能发布${NC}"
    exit 1
fi
