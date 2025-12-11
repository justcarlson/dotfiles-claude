# Monorepo Cookbook

Create hierarchical CLAUDE.md files for monorepos.

## Workflow

### Step 1: Identify Structure

```bash
# Monorepo patterns
ls -d apps/ packages/ services/ libs/ 2>/dev/null

# Workspaces
grep -l "workspaces" package.json pnpm-workspace.yaml 2>/dev/null

# Multiple package.json
find . -name "package.json" -not -path "*/node_modules/*"

# Turborepo/Nx
ls turbo.json nx.json 2>/dev/null
```

### Step 2: Map Architecture

- [ ] **Root**: Global commands, shared config
- [ ] **Apps**: Deployable applications
- [ ] **Packages**: Shared libraries

### Step 3: Plan Hierarchy

- IF: Directory has distinct tech stack.
- THEN: Create nested CLAUDE.md.
- EXAMPLES: `apps/web/`, `apps/api/`

- IF: Directory shares parent conventions.
- THEN: Skip nested file.
- EXAMPLES: `packages/utils/`, `packages/types/`

### Step 4: Create Root CLAUDE.md

```markdown
# CLAUDE.md

## Overview
[Brief description]

## Global Commands
[Workspace-level commands]

## Architecture
[Map of apps/, packages/]

## Cross-Cutting Rules
[Rules that apply everywhere]

## Package-Specific
Each package may have its own CLAUDE.md.
```

### Step 5: Create Nested Files

```markdown
# [Package] Instructions

Inherits from root.

## Stack
[Package-specific tech]

## Commands
[Package-specific commands]

## Structure
[Package-specific files]

## Boundaries
[Package-specific rules]
```

## Example Output

### Root: `/CLAUDE.md`

```markdown
# CLAUDE.md

## Overview
E-commerce monorepo: React storefront, Node API, shared packages.

## Global Commands

### Development
npm run dev              # all services
npm run dev:web          # frontend only
npm run dev:api          # backend only

### Quality
npm run lint
npm run test
npm run typecheck

## Architecture

```
apps/
├── web/          # React storefront (CLAUDE.md)
├── api/          # Node API (CLAUDE.md)
└── admin/        # Admin dashboard

packages/
├── ui/           # Shared components (CLAUDE.md)
├── types/        # TypeScript types
└── utils/        # Utilities
```

## Cross-Cutting Rules

### Always
- Use packages from `packages/`
- Import types from `@acme/types`

### Never
- Cross-import between apps
- Commit `.env` files

## Package Navigation
- **Web**: `apps/web/CLAUDE.md`
- **API**: `apps/api/CLAUDE.md`
- **UI**: `packages/ui/CLAUDE.md`
```

### Nested: `/apps/web/CLAUDE.md`

```markdown
# Web Storefront

Inherits from root.

## Stack
React 18, Next.js 14, Tailwind, @acme/ui

## Commands
npm run dev              # port 3000
npm run test             # vitest

## Structure
- `app/` - Next.js pages
- `components/` - page components
- `lib/` - utilities

## Style
- Use `@acme/ui` components
- See `components/ProductCard.tsx`

## Boundaries
### Ask First
- Adding routes
- New dependencies
```

### Nested: `/apps/api/CLAUDE.md`

```markdown
# API Backend

Inherits from root.

## Stack
Node 20, Express, Prisma, PostgreSQL

## Commands
npm run dev              # port 4000
npm run db:migrate       # prisma migrate

## Structure
- `src/routes/` - endpoints
- `src/services/` - business logic
- `prisma/schema.prisma` - database

## Boundaries
### Ask First
- Schema changes
- New endpoints

### Never
- Raw SQL (use Prisma)
```
