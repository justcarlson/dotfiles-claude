#!/usr/bin/env bash
# Git Worktree Cleanup - Interactive removal

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
NC='\033[0m'

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}✗ Not in a git repository${NC}"
    exit 1
fi

REPO_ROOT=$(git rev-parse --show-toplevel)

echo -e "${BLUE}Git Worktree Cleanup${NC}"
echo ""

declare -a PATHS BRANCHES MERGED_FLAGS
COUNT=0

while IFS= read -r line; do
    if [[ $line == worktree* ]]; then
        CURRENT_PATH=$(echo "$line" | awk '{print $2}')
    elif [[ $line == branch* ]]; then
        CURRENT_BRANCH=$(echo "$line" | sed 's|branch refs/heads/||')
        
        if [ "$CURRENT_PATH" != "$REPO_ROOT" ] && [ -n "$CURRENT_BRANCH" ]; then
            PATHS[$COUNT]="$CURRENT_PATH"
            BRANCHES[$COUNT]="$CURRENT_BRANCH"
            
            cd "$REPO_ROOT"
            if git branch --merged main 2>/dev/null | grep -q "^[* ]*${CURRENT_BRANCH}$"; then
                MERGED_FLAGS[$COUNT]="merged"
            else
                MERGED_FLAGS[$COUNT]="not-merged"
            fi
            ((COUNT++))
        fi
    fi
done < <(git worktree list --porcelain)

if [ $COUNT -eq 0 ]; then
    echo -e "${YELLOW}No feature worktrees to clean up${NC}"
    exit 0
fi

echo -e "${CYAN}Found $COUNT worktree(s):${NC}"
echo ""

for i in "${!PATHS[@]}"; do
    if [ "${MERGED_FLAGS[$i]}" = "merged" ]; then
        STATUS="${GREEN}✓ merged${NC}"
    else
        STATUS="${YELLOW}⚠ not merged${NC}"
    fi
    echo -e "[$((i+1))] ${BRANCHES[$i]} - $STATUS"
    echo -e "    ${GRAY}${PATHS[$i]}${NC}"
done

echo ""
echo "Enter numbers to remove (e.g., '1 3'), 'merged' for all merged, or Enter to cancel:"
read -p "Selection: " SELECTION

[ -z "$SELECTION" ] && exit 0

declare -a TO_REMOVE

if [ "$SELECTION" = "merged" ]; then
    for i in "${!MERGED_FLAGS[@]}"; do
        [ "${MERGED_FLAGS[$i]}" = "merged" ] && TO_REMOVE+=($i)
    done
elif [ "$SELECTION" = "all" ]; then
    for i in "${!PATHS[@]}"; do TO_REMOVE+=($i); done
else
    for num in $SELECTION; do
        if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -ge 1 ] && [ "$num" -le "$COUNT" ]; then
            TO_REMOVE+=($((num - 1)))
        fi
    done
fi

[ ${#TO_REMOVE[@]} -eq 0 ] && { echo "Nothing selected"; exit 0; }

echo ""
read -p "Remove ${#TO_REMOVE[@]} worktree(s)? (yes/no): " CONFIRM
[ "$CONFIRM" != "yes" ] && exit 0

cd "$REPO_ROOT"

for idx in "${TO_REMOVE[@]}"; do
    echo -e "${CYAN}→${NC} Removing ${BRANCHES[$idx]}..."
    git worktree remove "${PATHS[$idx]}" --force 2>/dev/null || rm -rf "${PATHS[$idx]}"
    
    if [ "${MERGED_FLAGS[$idx]}" = "merged" ]; then
        git branch -d "${BRANCHES[$idx]}" 2>/dev/null || true
    fi
done

git worktree prune
echo -e "${GREEN}✓ Cleanup complete${NC}"
