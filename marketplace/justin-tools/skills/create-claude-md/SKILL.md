---
name: create-claude-md
description: This skill should be used when the user asks to "create CLAUDE.md", "make CLAUDE.md", "generate CLAUDE.md", "init claude", or asks about CLAUDE.md best practices for Claude Code projects.
---

Generate token-efficient CLAUDE.md files with progressive disclosure.

# Purpose

Create excellent CLAUDE.md files that guide Claude Code effectively while being token-efficient.
Follow the `Instructions`, execute the `Workflow`.

## Variables

ENABLE_ANALYSIS: true
ENABLE_DISCOVERY: true
MAX_MAIN_FILE_LINES: 150
SIX_CORE_AREAS: commands, testing, project_structure, code_style, git_workflow, boundaries

## Instructions

- Analyze the project before generating content.
- Always use progressive disclosure: main file is concise, links to details.
- CLAUDE.md is loaded into context every session - keep it lean.

### Determining the Path

- IF: Project is a simple single-repo with one tech stack.
- THEN: READ and execute: `cookbook/simple-project.md`
- EXAMPLES:
  - Small to medium repos with single package.json/requirements.txt
  - Projects under 50 files
  - Single-language projects

- IF: Project is a monorepo or has distinct packages/services.
- THEN: READ and execute: `cookbook/monorepo.md`
- EXAMPLES:
  - Multiple package.json files in subdirectories
  - `/packages/`, `/apps/`, `/services/` directory structure
  - Multiple languages or frameworks in subdirectories

### Discovery

- IF: Automatic analysis is insufficient.
- THEN: READ `prompts/discovery_template.md` and ask focused questions.
- EXAMPLES:
  - Missing test framework information
  - Unclear project conventions

## Workflow

### Analysis Phase

1. Identify tech stack:
   - Package manager (npm, yarn, pnpm, pip, cargo, etc.)
   - Test framework (jest, pytest, cargo test, etc.)
   - Linter/formatter (eslint, prettier, black, etc.)
   - Build system (webpack, vite, make, etc.)

2. Find existing commands:
   - Check `package.json` scripts
   - Check `Makefile` targets
   - Check existing documentation

3. Identify key directories:
   - Source code location
   - Test location
   - Configuration files

### Generation Phase

Create CLAUDE.md with these sections:

```markdown
# Project Context

Brief description of what this project does.

## Quick Commands

```bash
# Development
npm run dev

# Testing
npm test

# Linting
npm run lint
```

## Project Structure

- `src/` - Source code
- `tests/` - Test files
- `docs/` - Documentation

## Code Style

- Use TypeScript strict mode
- Prefer named exports
- See `.eslintrc` for full rules

## Git Workflow

- Branch naming: `type/description`
- Commit format: conventional commits
- PR template: `.github/pull_request_template.md`

## Boundaries

### Always Do
- Run tests before committing
- Follow existing patterns

### Ask First
- Major refactoring
- New dependencies

### Never Do
- Modify `.env` files
- Push directly to main
```

### Simple Project Workflow

1. Analyze single tech stack
2. Generate single CLAUDE.md at repo root
3. Keep under 150 lines
4. Include all six core areas

### Monorepo Workflow

1. Create root CLAUDE.md with overall structure
2. Create package-specific CLAUDE.md files in each workspace
3. Root file references package files
4. Each package file is self-contained

## Core Principles

### Six Core Areas

1. **Commands** - Put early, include flags/options, prefer file-scoped
2. **Testing** - Test commands, coverage expectations
3. **Project Structure** - Key directories, entry points
4. **Code Style** - Examples over explanations, point to real files
5. **Git Workflow** - PR format, commit conventions
6. **Boundaries** - Three tiers: always do, ask first, never do

### Token Efficiency

- Assume Claude is smart - only add what it doesn't know
- Code examples beat paragraphs of explanation
- Use progressive disclosure: main file links to details
- File-scoped commands over project-wide builds

### What NOT to Include

- Generic programming advice Claude already knows
- Obvious things like "write clean code"
- Extensive API documentation (link to it instead)
- Sensitive information (API keys, credentials)

## References

Load explicitly when needed:
- READ: `references/best-practices.md` - Core principles from effective CLAUDE.md files
- READ: `references/structure-patterns.md` - Token-efficient structure patterns
- READ: `prompts/claude_md_template.md` - Starter template for generation

## Verification

After creating CLAUDE.md:
- [ ] Under 150 lines for simple projects
- [ ] All six core areas addressed
- [ ] Commands are copy-pasteable
- [ ] No sensitive information included
- [ ] File paths are accurate
