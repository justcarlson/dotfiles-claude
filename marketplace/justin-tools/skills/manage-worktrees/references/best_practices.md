# Git Worktrees Best Practices

## Naming Conventions

**Format:** `<type>-<short-description>`

| Type | Description | Example |
|------|-------------|---------|
| `feature-*` | New features | `feature-user-auth` |
| `bugfix-*` | Bug fixes | `bugfix-12345` |
| `hotfix-*` | Urgent fixes | `hotfix-critical` |
| `experiment-*` | Experiments | `experiment-new-arch` |
| `refactor-*` | Restructuring | `refactor-api` |
| `review-*` | Code review | `review-pr-789` |

**Avoid:** `temp`, `test`, `wt1`, generic names

## Directory Organization

Worktrees as siblings to main directory:

```
~/projects/
  └── myapp/                    # Main (main branch)
  └── myapp-feature-auth/       # Feature worktree
  └── myapp-hotfix-critical/    # Hotfix worktree
```

## When to Use Worktrees

**Use for:**
- Parallel development
- Multiple Claude sessions
- Context switching (hotfix during feature work)
- Side-by-side comparisons
- Long-running tasks
- Code reviews

**Don't use for:**
- Quick branch switches
- Very short tasks (< 1 hour)
- Simple merges

## Lifecycle Management

**Creation checklist:**
- [ ] Descriptive branch name
- [ ] Task warrants a worktree
- [ ] Sufficient disk space

**Maintenance:**
- Daily: Check status, commit progress
- Weekly: Clean up merged worktrees

**Cleanup when:**
- Branch merged to main
- Task completed
- Experiment concluded

## Submodule Handling

After creating worktree:
```bash
cd ../myapp-feature
git submodule update --init --recursive
```

## Performance Tips

- Limit concurrent worktrees to 3-5
- Use sparse checkout for large repos
- Regular `git worktree prune`

## Summary

**Do:**
- Descriptive names
- Create as siblings
- Clean up regularly
- Sync with main frequently
- Initialize submodules

**Don't:**
- Nest inside repository
- Use for quick tasks
- Let worktrees accumulate
- Use generic names
