#!/usr/bin/env bash
# List Git Worktrees with status

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
RED='\033[0;31m'
NC='\033[0m'

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}✗ Not in a git repository${NC}"
    exit 1
fi

REPO_NAME=$(basename "$(git rev-parse --show-toplevel)")

echo -e "${BLUE}Git Worktrees - $REPO_NAME${NC}"
echo ""

git worktree list --porcelain | while IFS= read -r line; do
    if [[ $line == worktree* ]]; then
        CURRENT_PATH=$(echo "$line" | awk '{print $2}')
    elif [[ $line == branch* ]]; then
        CURRENT_BRANCH=$(echo "$line" | sed 's|branch refs/heads/||')
        
        cd "$CURRENT_PATH" 2>/dev/null || continue
        
        if git diff-index --quiet HEAD -- 2>/dev/null; then
            STATUS="${GREEN}clean${NC}"
        else
            CHANGES=$(git status --short | wc -l | tr -d ' ')
            STATUS="${YELLOW}$CHANGES changes${NC}"
        fi
        
        echo -e "${CYAN}$CURRENT_BRANCH${NC}"
        echo -e "  Path: ${GRAY}$CURRENT_PATH${NC}"
        echo -e "  Status: $STATUS"
        echo ""
    fi
done

TOTAL=$(git worktree list | wc -l)
echo -e "${GRAY}Total: $TOTAL worktree(s)${NC}"
