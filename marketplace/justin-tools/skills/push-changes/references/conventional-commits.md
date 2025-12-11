# Conventional Commits Specification

Reference: https://www.conventionalcommits.org/en/v1.0.0/

## Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Types

| Type | Description | SemVer |
|------|-------------|--------|
| `feat` | New feature | MINOR |
| `fix` | Bug fix | PATCH |
| `docs` | Documentation only | - |
| `style` | Formatting, whitespace | - |
| `refactor` | Code restructure | - |
| `perf` | Performance improvement | PATCH |
| `test` | Adding/updating tests | - |
| `build` | Build system, dependencies | - |
| `ci` | CI/CD configuration | - |
| `chore` | Other maintenance | - |
| `revert` | Revert previous commit | - |

## Scope

Optional context in parentheses:
```
feat(api): add user endpoint
fix(auth): resolve token refresh
docs(readme): update installation
```

## Description

- Use imperative mood: "add" not "added"
- No period at the end
- Keep under 72 characters

## Body

- Separate from description with blank line
- Explain what and why, not how
- Wrap at 72 characters

## Breaking Changes

Two ways to indicate:

1. **Exclamation mark after type:**
   ```
   feat!: remove deprecated endpoint
   ```

2. **Footer in body:**
   ```
   feat: redesign user API

   BREAKING CHANGE: Response format changed from array to object.
   ```

## Footers

Common footer tokens:
- `BREAKING CHANGE:` - Indicates breaking API change
- `Closes #123` - References issue being closed
- `Refs #456` - References related issue
- `Co-authored-by:` - Credit collaborators

## Examples

### Simple feature
```
feat: add user registration
```

### Feature with scope
```
feat(auth): implement OAuth2 login
```

### Bug fix with issue reference
```
fix(parser): handle empty input gracefully

Closes #234
```

### Breaking change
```
feat(api)!: change response format

BREAKING CHANGE: Responses now return objects instead of arrays.
Users must update their parsing logic.

Closes #567
```

### Co-authorship

When Claude contributes to commits, include:
```
Co-authored-by: Claude <noreply@anthropic.com>
```

## Quick Reference

```
feat:     New feature (MINOR version bump)
fix:      Bug fix (PATCH version bump)
docs:     Documentation only
style:    Formatting, no code change
refactor: Code restructure, no behavior change
perf:     Performance improvement
test:     Adding/updating tests
build:    Build system, dependencies
ci:       CI/CD configuration
chore:    Maintenance tasks
revert:   Revert previous commit
```
