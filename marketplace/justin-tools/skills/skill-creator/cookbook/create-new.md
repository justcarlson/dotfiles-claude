# Create New Skill

Create a brand new skill from scratch using research, interactive discovery, and implementation.

## Variables

RESEARCH_TOOLS: exa___get_code_context_exa, Ref___ref_search_documentation, FetchUrl

## Instructions

### Step 1: Research Phase

- IF: `ENABLE_EXA_RESEARCH` is true AND user's skill idea involves common patterns.
- THEN: Use `exa___get_code_context_exa` to find similar skills.
- EXAMPLES:
  - Query: "Claude Code skill git workflow conventional commits"
  - Query: "Claude Code skill database migration automation"

- IF: `ENABLE_REF_RESEARCH` is true.
- THEN: Use `Ref___ref_search_documentation` for Claude Code docs.
- EXAMPLES:
  - Query: "Claude Code skills SKILL.md format"
  - Query: "Claude Code plugin development"

- IF: `ENABLE_GITHUB_FETCH` is true AND relevant example skills exist.
- THEN: Use `FetchUrl` to grab example SKILL.md files.
- EXAMPLES:
  - URL: `https://raw.githubusercontent.com/anthropics/claude-code/main/plugins/plugin-dev/skills/skill-development/SKILL.md`

### Step 2: Interactive Discovery

Ask questions in phases (2-3 at a time):

**Phase 1: Purpose & Scope**
- What task should this skill automate?
- Can you give examples of how this would be used?
- What phrases should trigger this skill?

**Phase 2: Implementation**
- What tools, commands, or APIs are involved?
- Are there scripts that would be reused repeatedly?
- Is there documentation or reference material to include?

**Phase 3: Constraints**
- What guardrails should the skill enforce?
- How should success be verified?

### Step 3: Plan Components

Based on discovery, determine what to create:

- IF: Skill involves deterministic, repeatable code.
- THEN: Plan `scripts/` directory with executable scripts.
- EXAMPLES:
  - Git operations -> `scripts/smart_commit.sh`
  - File processing -> `scripts/process_files.py`

- IF: Skill needs reference documentation.
- THEN: Plan `references/` directory.
- EXAMPLES:
  - API schemas -> `references/api_schema.md`
  - Conventions -> `references/conventions.md`

- IF: Skill has branching workflows.
- THEN: Plan `cookbook/` directory with separate files per branch.
- EXAMPLES:
  - Multiple targets -> `cookbook/deploy-staging.md`, `cookbook/deploy-prod.md`

### Step 4: Create Skill Structure

```bash
mkdir -p plugin-name/skills/<skill-name>/{references,examples,scripts}
```

### Step 5: Implement

1. Create SKILL.md with:
   - YAML frontmatter: `name`, `description` (third-person with triggers)
   - Purpose section
   - Variables section (if applicable)
   - Instructions with IF/THEN/EXAMPLES
   - Workflow as numbered steps
   - Cookbook references (if applicable)
   - References section

2. Create supporting files as planned.

3. Make scripts executable:
   ```bash
   chmod +x skills/<skill-name>/scripts/*
   ```

### Step 6: Create Slash Command (Optional)

- IF: User wants a slash command for the skill.
- THEN: Create command file in plugin's `commands/` directory.

**Command format:**
```markdown
---
description: One-line description of command
---

# Purpose

Brief description of what this command triggers.

## Workflow

Invoke the <skill-name> skill based on user's request.
```

## Workflow

1. Research similar skills and patterns.
2. Conduct interactive discovery.
3. Present summary for user confirmation.
4. Plan components based on discovery.
5. Create skill structure.
6. Implement SKILL.md and supporting files.
7. Offer to create slash command.
8. Verify structure.

## Verification

Confirm:
- [ ] SKILL.md follows no-ambiguity pattern
- [ ] Description uses third-person with trigger phrases
- [ ] Variables section defined (if applicable)
- [ ] IF/THEN/EXAMPLES used for branching logic
- [ ] All file paths are relative
- [ ] Scripts are executable
- [ ] Slash command created (if applicable)
