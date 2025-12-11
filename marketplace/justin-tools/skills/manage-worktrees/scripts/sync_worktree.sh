#!/usr/bin/env bash
# Git Worktree Sync - Update worktree with main branch

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

BASE_BRANCH="main"

while [[ $# -gt 0 ]]; do
    case $1 in
        --base) BASE_BRANCH="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 [--base <branch>]"
            echo "Syncs current worktree with base branch (default: main)"
            exit 0 ;;
        *) shift ;;
    esac
done

echo -e "${BLUE}Git Worktree Sync${NC}"
echo ""

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}✗ Not in a git repository${NC}"
    exit 1
fi

CURRENT_BRANCH=$(git branch --show-current)

if [ "$CURRENT_BRANCH" = "$BASE_BRANCH" ]; then
    echo -e "${YELLOW}Already on $BASE_BRANCH - nothing to sync${NC}"
    exit 0
fi

echo -e "Current: ${CYAN}$CURRENT_BRANCH${NC}"
echo -e "Base: ${CYAN}$BASE_BRANCH${NC}"
echo ""

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo -e "${YELLOW}⚠ Uncommitted changes detected${NC}"
    read -p "Stash changes? (y/n): " STASH
    if [[ "$STASH" =~ ^[Yy]$ ]]; then
        git stash push -m "Auto-stash before sync"
        STASHED=true
    else
        exit 1
    fi
else
    STASHED=false
fi

echo -e "${CYAN}→${NC} Fetching..."
git fetch origin

BEHIND=$(git rev-list --count HEAD..origin/$BASE_BRANCH 2>/dev/null || echo "0")

if [ "$BEHIND" = "0" ]; then
    echo -e "${GREEN}✓ Already up-to-date${NC}"
    [ "$STASHED" = true ] && git stash pop
    exit 0
fi

echo -e "${YELLOW}$BEHIND commit(s) behind $BASE_BRANCH${NC}"
echo ""

if git merge origin/$BASE_BRANCH -m "Merge $BASE_BRANCH into $CURRENT_BRANCH"; then
    echo -e "${GREEN}✓ Sync successful${NC}"
    [ "$STASHED" = true ] && git stash pop
else
    echo -e "${RED}✗ Merge conflicts - resolve manually${NC}"
    exit 1
fi
