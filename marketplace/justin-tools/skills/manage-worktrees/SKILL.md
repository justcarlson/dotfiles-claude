---
name: manage-worktrees
description: This skill should be used when the user asks to "create a worktree", "list worktrees", "cleanup worktrees", "sync worktree", "run parallel sessions", or needs help with git worktree management for parallel development.
---

Create and manage git worktrees for parallel development and Claude sessions.

# Git Worktrees for Parallel Development

Git worktrees let you have **multiple working directories** from the same repository, each with a different branch checked out. Think of them as **parallel universes** of your code - changes in one don't affect the others, but they all share the same Git history.

## Instructions

Based on user's request, follow the appropriate command or workflow pattern.

## Direct Commands

### Create Worktree

- IF: User provides feature/branch name in their request.
- THEN: Create worktree directly using git command (non-interactive).
- COMMAND: `git worktree add ../<repo>-<feature-name> -b <feature-name> <base-branch>`
- NOTE: Derive repo name from `basename $(git rev-parse --show-toplevel)`, default base branch to `main` or `master`.
- EXAMPLES:
  - "create a worktree for refactor-parsers" → `git worktree add ../repo-refactor-parsers -b refactor-parsers main`
  - "I need a worktree called feature-auth" → `git worktree add ../repo-feature-auth -b feature-auth main`

- IF: User says "Create" without specifying a name, or wants guided mode.
- THEN: Ask user for feature name, then run git command directly.
- EXAMPLES:
  - "create a worktree" → Ask: "What branch name should I use?" then create directly
  - "Create" → Ask for branch name first

### List Worktrees

- IF: User says "List", "list worktrees", "show worktrees", or wants to see active worktrees.
- THEN: Run: `git worktree list`
- EXAMPLES:
  - "list worktrees"
  - "List"
  - "show me all worktrees"

### Cleanup Worktrees

- IF: User says "Cleanup", "clean up", "remove worktrees", or wants to delete old worktrees.
- THEN: List worktrees, ask which to remove, then run: `git worktree remove <path>`
- EXAMPLES:
  - "cleanup worktrees"
  - "Cleanup"
  - "remove old worktrees"

### Sync Worktree

- IF: User says "Sync", "sync worktree", "update worktree", or wants to merge from main.
- THEN: Run: `git fetch origin && git merge origin/main`
- EXAMPLES:
  - "sync worktree"
  - "Sync"
  - "update worktree with main"

## Workflow Patterns

### Pattern 1: Parallel Sessions

- IF: User wants to run multiple Claude sessions on different features simultaneously.
- THEN: Create separate worktrees for each session.
- EXAMPLES:
  - "I want Claude working on the API while I work on the UI"
  - "create a worktree so Claude can work on this in parallel"
  - "run parallel sessions"

**Steps:**
1. Create worktree: `git worktree add ../repo-feature-name -b feature-name`
2. Open new terminal in worktree directory
3. Start Claude Code session in the new worktree
4. Continue working in main repo uninterrupted
5. When done, merge and clean up

### Pattern 2: Hotfix Without Interruption

- IF: Production bug needs immediate fix while working on a feature.
- THEN: Create hotfix worktree, fix, merge, continue feature work.
- EXAMPLES:
  - "I need to fix a production bug but don't want to lose my current work"
  - "create a hotfix worktree"

**Steps:**
1. Create hotfix worktree: `git worktree add ../repo-hotfix-name -b hotfix-name main`
2. Fix the bug in the hotfix worktree
3. Merge to main and deploy
4. Return to feature worktree (unchanged)
5. Clean up hotfix worktree

### Pattern 3: Compare Implementations

- IF: User wants to try multiple approaches to the same problem.
- THEN: Create worktrees for each approach, compare side-by-side.
- EXAMPLES:
  - "I want to compare two different implementations"
  - "create worktrees for approach-a and approach-b"

## Submodule Support

### When Repository Has Submodules

- IF: Repository contains `.gitmodules` file.
- THEN: After creating worktree, initialize submodules.

**Steps:**
1. Create worktree: `git worktree add ../repo-feature-name feature-name`
2. Navigate to worktree: `cd ../repo-feature-name`
3. Initialize submodules: `git submodule update --init --recursive`
4. Optionally switch submodule branches as needed

## Best Practices

### Naming Conventions

**Format:** `<type>-<short-description>`

| Type | Description |
|------|-------------|
| `feature-*` | New feature or functionality |
| `bugfix-*` | Bug fix (issue-based) |
| `hotfix-*` | Urgent production fix |
| `experiment-*` | Experimental approach |
| `refactor-*` | Code restructuring |
| `review-*` | Code review worktree |

### Directory Structure

Worktrees are created as siblings to your main directory:
```
~/projects/
  └── myapp/                  # Main worktree (main branch)
  └── myapp-feature-auth/     # Feature worktree
  └── myapp-hotfix-urgent/    # Hotfix worktree
```

### Key Principles

1. **One worktree per feature** - Don't reuse worktrees for different work
2. **Initialize submodules immediately** - Run `git submodule update --init --recursive`
3. **Clean up when done** - Remove worktrees after merging
4. **Regular maintenance** - Run `git worktree prune` periodically

## Troubleshooting

### Issue: "Branch is already checked out"
**Solution:** Create a new branch: `git worktree add ../path -b new-branch-name base-branch`

### Issue: "fatal: invalid reference"
**Solution:** Use alphanumeric + hyphens only for branch names.

### Issue: Submodules not initialized (empty directories)
**Solution:** Run `git submodule update --init --recursive` in the worktree.

### Issue: "cannot remove worktree"
**Solution:** Run `git worktree prune` to clean stale references, or use `--force`.

## Quick Reference

| Task | Command |
|------|---------|
| Create worktree | `git worktree add ../repo-name -b branch-name` |
| List all worktrees | `git worktree list` |
| Remove worktree | `git worktree remove ../path` |
| Prune stale refs | `git worktree prune` |
| Init submodules | `git submodule update --init --recursive` |
