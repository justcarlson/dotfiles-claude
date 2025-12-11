---
name: heal-skill
description: This skill should be used when the user asks to "heal skill", "fix the skill", "that skill confused you", "improve that skill", or wants to analyze and fix a skill that caused confusion.
---

Analyze session confusion, diagnose problematic skills, and apply fixes.

# Purpose

Analyze the current session to identify when confusion occurred, determine which skill was involved, diagnose the root cause, and apply a fix to prevent future issues.
Follow the `Instructions`, execute the `Workflow`.

## Variables

PLUGIN_SKILLS_LOCATION: plugin skills/ directory
REQUIRE_USER_APPROVAL: true

## Instructions

- Review the current session context to identify points of confusion.
- Determine which skill (if any) was active when confusion occurred.
- Diagnose whether the skill's instructions caused the issue.
- Propose and apply a fix with user approval.

### Session Analysis

- IF: User invokes heal-skill without specifying a skill.
- THEN: Scan session for confusion indicators.
- EXAMPLES:
  - "heal skill" (analyze recent confusion)
  - "that last skill confused you, fix it"

- IF: User specifies a skill name.
- THEN: Focus analysis on that skill's usage in session.
- EXAMPLES:
  - "heal skill push-changes"
  - "fix the skill-creator skill"

## Workflow

### Step 1: Identify Confusion

Look for these indicators in the session:
- Claude apologizing or correcting itself
- User saying "no", "that's wrong", "not what I meant"
- Claude asking for clarification multiple times
- Unexpected tool usage or file edits
- Claude going in circles or repeating actions

### Step 2: Determine Active Skill

Check what skill was active when confusion occurred:
- Look for skill trigger phrases in user messages
- Check if SKILL.md content was loaded
- Identify which instructions Claude was following

### Step 3: Diagnose Root Cause

Common skill failure patterns:

| Pattern | Symptom | Cause |
|---------|---------|-------|
| Ambiguous triggers | Wrong skill activated | Description too vague |
| Missing IF/THEN | Unpredictable behavior | No clear conditional logic |
| Wrong assumptions | Incorrect actions | Missing context in instructions |
| Infinite loops | Repeated actions | No termination conditions |
| Path errors | File not found | Hardcoded or wrong paths |

### Step 4: Propose Fix

Based on diagnosis, propose specific changes:

- IF: Trigger was ambiguous.
- THEN: Add more specific trigger phrases to description.

- IF: Instructions were unclear.
- THEN: Add IF/THEN/EXAMPLES for the confusing case.

- IF: Context was missing.
- THEN: Add Variables or References sections.

- IF: Workflow had gaps.
- THEN: Add missing steps or termination conditions.

### Step 5: Apply Fix

1. Show proposed changes to user.
2. Wait for approval.
3. Edit the SKILL.md file.
4. Summarize what was changed.

## Verification

After applying fix:
- [ ] SKILL.md still has valid YAML frontmatter
- [ ] Description includes specific trigger phrases
- [ ] New IF/THEN/EXAMPLES are clear and unambiguous
- [ ] All file paths are correct
- [ ] No syntax errors introduced
