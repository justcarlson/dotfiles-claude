---
description: Manage git worktrees for parallel development
argument-hint: [create|list|cleanup|sync] [branch-name]
---

# Manage Worktrees

Use the manage-worktrees skill to handle the user's request.

Available actions:
- **create** - Create a new worktree for a feature branch
- **list** - Show all active worktrees
- **cleanup** - Remove old/merged worktrees
- **sync** - Update worktree with changes from main

If no action specified, ask the user what they want to do.
