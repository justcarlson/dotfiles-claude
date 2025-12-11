# CLAUDE.md Structure Patterns

Token-efficient structures for different project types.

## Pattern 1: Minimal (< 50 lines)

For small projects:

```markdown
# CLAUDE.md

## Stack
React 18, TypeScript 5.3, Vite, Tailwind

## Commands
npm run dev          # dev server
npm run lint --fix   # fix linting
npm run test         # run tests

## Structure
- `src/` - application code
- `src/components/` - UI components

## Style
- Functional components with hooks
- See `src/components/Button.tsx`

## Boundaries
- Never commit `.env` files
- Ask before adding dependencies
```

## Pattern 2: Standard (50-150 lines)

For most projects - covers six core areas:

```markdown
# CLAUDE.md

## Stack
[Tech with versions]

## Commands
### File-scoped (fast)
[Single-file commands]

### Project-wide (slow)
[Full build/test commands]

## Structure
[Key directories]

## Style
### Do
[Preferences]

### Don't
[Anti-patterns]

## Testing
[Commands, patterns]

## Git
[PR format, commits]

## Boundaries
### Always / Ask First / Never
[Three tiers]

## When Stuck
[Escape hatch]
```

## Pattern 3: Progressive Disclosure

For larger projects:

```markdown
# CLAUDE.md

## Stack
React 18, TypeScript 5.3, Node 20, PostgreSQL

## Quick Commands
npm run check        # lint + typecheck + test
npm run dev          # start everything

## Structure
- `apps/` - frontend and backend
- `packages/` - shared libraries
- `docs/` - detailed guides

## Guides
- **API**: See `docs/api-guide.md`
- **Components**: See `docs/component-guide.md`
- **Database**: See `docs/database-guide.md`

## Boundaries
### Always
- Run `npm run check` before commits

### Never
- Commit secrets
```

## Pattern 4: Hierarchical (Monorepo)

Root + nested files:

### Root: `/CLAUDE.md`
```markdown
# CLAUDE.md

## Overview
Monorepo: React frontend, Node backend, shared packages.

## Global Commands
npm run lint         # all packages
npm run test         # all packages

## Package-Specific
Each package may have its own CLAUDE.md.

## Global Rules
### Always
- Use shared packages

### Never
- Cross-import between apps
```

### Nested: `/apps/web/CLAUDE.md`
```markdown
# Web App

Inherits from root.

## Stack
React 18, Vite, Tailwind

## Commands
npm run dev          # port 3000
npm run test         # frontend tests
```

## Size Guidelines

| Type | Lines | Approach |
|------|-------|----------|
| Small | < 50 | Minimal |
| Medium | 50-150 | Standard |
| Large | 100-200 + refs | Progressive |
| Monorepo | Root + nested | Hierarchical |
