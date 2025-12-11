# Skill Creation Questionnaire

Use these questions to gather requirements for a new skill. 
Ask 2-3 questions at a time to avoid overwhelming the user.
Store answers in the XML-tagged sections below IN MEMORY.

## Phase 1: Purpose & Scope

**Q1: What task should this skill automate?**
- What problem does it solve?
- What would the user accomplish?

<answer_q1>
</answer_q1>

**Q2: Can you give examples of how this would be used?**
- Specific scenarios or use cases
- Example user requests that should trigger this skill

<answer_q2>
</answer_q2>

**Q3: What would a user say to trigger this skill?**
- Exact phrases they might use
- Related keywords or concepts

<answer_q3>
</answer_q3>

## Phase 2: Implementation Details

**Q4: What tools, commands, or APIs are involved?**
- CLI tools (git, npm, docker, etc.)
- External APIs or services
- Programming languages needed

<answer_q4>
</answer_q4>

**Q5: Are there scripts that would be reused repeatedly?**
- Deterministic operations
- Complex multi-step commands
- File processing tasks

<answer_q5>
</answer_q5>

**Q6: Is there documentation or reference material to include?**
- API docs, schemas, specifications
- Team conventions or guidelines
- External documentation links

<answer_q6>
</answer_q6>

## Phase 3: Constraints & Verification

**Q7: What constraints or guardrails should the skill enforce?**
- Security considerations
- Files/directories that should NOT be modified
- Required approvals or checks

<answer_q7>
</answer_q7>

**Q8: How should success be verified?**
- Commands to run after completion
- Expected outputs or artifacts
- Tests or checks to perform

<answer_q8>
</answer_q8>

## Phase 4: Scope Refinement

**Q9: Should this be one skill or multiple smaller skills?**
- Can the task be broken into independent capabilities?
- Are there distinct workflows that could be separate?

<answer_q9>
</answer_q9>

**Q10: Where should this skill live?**
- Plugin skills directory (distributed with plugin)
- Personal commands (`~/.claude/commands/`)

<answer_q10>
</answer_q10>
