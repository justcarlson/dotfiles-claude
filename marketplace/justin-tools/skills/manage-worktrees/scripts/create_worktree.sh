#!/usr/bin/env bash
# Git Worktree Creator - Interactive worktree creation

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

BASE_BRANCH="main"
CUSTOM_DIR=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --base) BASE_BRANCH="$2"; shift 2 ;;
        --dir) CUSTOM_DIR="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo "Options:"
            echo "  --base <branch>    Base branch (default: main)"
            echo "  --dir <path>       Custom directory for worktree"
            exit 0 ;;
        *) echo -e "${RED}Unknown option: $1${NC}"; exit 1 ;;
    esac
done

echo -e "${BLUE}Git Worktree Creator${NC}"
echo ""

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}✗ Not in a git repository${NC}"
    exit 1
fi

REPO_ROOT=$(git rev-parse --show-toplevel)
REPO_NAME=$(basename "$REPO_ROOT")
CURRENT_BRANCH=$(git branch --show-current)

echo -e "${GREEN}✓${NC} Repository: ${CYAN}$REPO_NAME${NC}"
echo -e "${GREEN}✓${NC} Current branch: ${CYAN}$CURRENT_BRANCH${NC}"
echo ""

read -p "Feature name: " FEATURE_NAME

if [ -z "$FEATURE_NAME" ]; then
    echo -e "${RED}✗ Feature name cannot be empty${NC}"
    exit 1
fi

FEATURE_NAME=$(echo "$FEATURE_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')

if [ -z "$FEATURE_NAME" ]; then
    echo -e "${RED}✗ Invalid feature name${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} Branch name: ${CYAN}$FEATURE_NAME${NC}"

if git show-ref --verify --quiet "refs/heads/$FEATURE_NAME"; then
    echo -e "${YELLOW}⚠${NC} Branch already exists"
    read -p "Use existing branch? (y/n): " USE_EXISTING
    [[ ! "$USE_EXISTING" =~ ^[Yy]$ ]] && exit 1
    CREATE_BRANCH=false
else
    read -p "Base branch [$BASE_BRANCH]: " CUSTOM_BASE
    [ -n "$CUSTOM_BASE" ] && BASE_BRANCH="$CUSTOM_BASE"
    
    if ! git show-ref --verify --quiet "refs/heads/$BASE_BRANCH"; then
        echo -e "${RED}✗ Base branch '$BASE_BRANCH' does not exist${NC}"
        exit 1
    fi
    CREATE_BRANCH=true
fi

if [ -n "$CUSTOM_DIR" ]; then
    WORKTREE_DIR="$CUSTOM_DIR"
else
    PARENT_DIR=$(dirname "$REPO_ROOT")
    WORKTREE_DIR="$PARENT_DIR/${REPO_NAME}-${FEATURE_NAME}"
fi

if [ -d "$WORKTREE_DIR" ]; then
    echo -e "${RED}✗ Directory already exists: $WORKTREE_DIR${NC}"
    exit 1
fi

echo ""
echo -e "${CYAN}Creating:${NC} $WORKTREE_DIR"

if [ "$CREATE_BRANCH" = true ]; then
    git worktree add -b "$FEATURE_NAME" "$WORKTREE_DIR" "$BASE_BRANCH"
else
    git worktree add "$WORKTREE_DIR" "$FEATURE_NAME"
fi

echo ""
echo -e "${GREEN}✓ Worktree created!${NC}"
echo ""
echo -e "Navigate: ${YELLOW}cd $WORKTREE_DIR${NC}"
echo ""
