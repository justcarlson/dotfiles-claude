# Git Worktree Command Reference

## Basic Commands

### Create
```bash
# New branch
git worktree add <path> -b <new-branch>

# Existing branch
git worktree add <path> <existing-branch>

# From commit
git worktree add <path> <commit-hash>
```

### List
```bash
git worktree list
git worktree list --porcelain
```

### Remove
```bash
git worktree remove <path>
git worktree remove <path> --force
```

### Move
```bash
git worktree move <old-path> <new-path>
```

### Prune
```bash
git worktree prune
git worktree prune --dry-run
```

## Advanced

### Lock/Unlock
```bash
git worktree lock <path>
git worktree lock <path> --reason "Long task"
git worktree unlock <path>
```

### Detached HEAD
```bash
git worktree add <path> --detach <commit>
```

## Quick Reference

| Command | Purpose |
|---------|---------|
| `git worktree add <path> -b <branch>` | Create with new branch |
| `git worktree add <path> <branch>` | Create from existing |
| `git worktree list` | Show all |
| `git worktree remove <path>` | Remove |
| `git worktree prune` | Clean stale refs |
| `git worktree lock <path>` | Prevent pruning |

## Common Errors

**"already exists"** - Remove directory or use different path

**"invalid reference"** - Use alphanumeric and hyphens only

**"already checked out"** - Use different branch name

**"not a working tree"** - Run `git worktree list` to verify
