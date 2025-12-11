# Diagnose Skill

Determine if the identified skill caused the confusion and identify the specific issue.

## Variables

ROOT_CAUSES: ambiguous_instruction, missing_condition, wrong_example, unclear_workflow, missing_variable, incorrect_path

## Instructions

### Step 1: Load the Skill

- IF: Skill is in plugin directory.
- THEN: READ the skill's SKILL.md file from the plugin.

### Step 2: Analyze Skill Against Confusion

- IF: Agent couldn't determine which path to take.
- THEN: Root cause is `ambiguous_instruction` or `missing_condition`.

- IF: Agent took wrong action despite clear user request.
- THEN: Root cause is `wrong_example` or trigger mismatch.

- IF: Agent got stuck in workflow.
- THEN: Root cause is `unclear_workflow` or missing step.

- IF: Agent couldn't find referenced file.
- THEN: Root cause is `incorrect_path`.

- IF: Agent used wrong value for configuration.
- THEN: Root cause is `missing_variable`.

### Step 3: Identify Specific Fix

For each root cause:

- `ambiguous_instruction`: Add IF/THEN/EXAMPLES block
- `missing_condition`: Add missing conditional branch
- `wrong_example`: Fix or add correct example phrases
- `unclear_workflow`: Clarify step or add missing step
- `missing_variable`: Add to Variables section
- `incorrect_path`: Fix file path reference

### Step 4: Document Diagnosis

READ: `prompts/skill_patch.md`
Fill template IN MEMORY with:
- Root cause type
- Specific location in SKILL.md
- Proposed fix (exact text change)
- Rationale

## Workflow

1. Load affected skill's SKILL.md.
2. Compare skill instructions to confusion event.
3. Identify root cause type.
4. Determine specific fix.
5. Document in skill_patch template.
6. Present diagnosis to user.
