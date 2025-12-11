---
name: push-changes
description: This skill should be used when the user asks to "push changes", "commit and push", "push this", "push to github", or completes work and wants to save changes with conventional commit messages.
---

# Purpose

Stage all changes, create a conventional commit message, and push to remote.
Follow the `Instructions`, execute the `Workflow`.

## Variables

CO_AUTHOR: Claude <noreply@anthropic.com>

## Instructions

### Auto-Generated Commit

- IF: User wants to push without specifying a message.
- THEN: Auto-detect commit type from changes and generate message.
- EXAMPLES:
  - "push changes"
  - "commit and push"
  - "push this"

### Custom Message Commit

- IF: User provides a specific commit message.
- THEN: Use their message with conventional commit format.
- EXAMPLES:
  - "push with message feat: add login"
  - "commit and push: fix(auth): resolve token bug"

### Dry Run Preview

- IF: User wants to preview the commit without executing.
- THEN: Show what would be committed using git status and diff.
- EXAMPLES:
  - "preview the commit"
  - "what would the commit message be"

## Workflow

1. Check for uncommitted changes: `git status`
2. Review diff for secrets or sensitive data: `git diff`
3. Stage changes: `git add -A`
4. Determine commit type from changes (feat/fix/docs/style/refactor/test/chore)
5. Generate or use provided commit message
6. Commit with co-authorship
7. Push to remote: `git push`
8. Verify with: `git log --oneline -1`

## Co-Authorship

When Claude creates commits, include co-author attribution:

```
git commit -m "feat: description

Co-authored-by: Claude <noreply@anthropic.com>"
```

## Conventional Commit Types

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Formatting, whitespace (no code change) |
| `refactor` | Code restructure (no behavior change) |
| `perf` | Performance improvement |
| `test` | Adding/updating tests |
| `build` | Build system or dependencies |
| `ci` | CI/CD configuration |
| `chore` | Other maintenance tasks |
| `revert` | Revert a previous commit |

### Breaking Changes

Append `!` after type for breaking changes:
```
feat!: remove deprecated API endpoint

BREAKING CHANGE: The /v1/users endpoint has been removed.
```

## Security Reminder

Before pushing, always check for:
- API keys and secrets
- Passwords or credentials
- Private configuration files
- `.env` files with sensitive data

## Verification

After push, confirm with:
```bash
git log --oneline -1
git status
```
