---
description: Move to next stage with validation
allowed-tools: Read, Write, Glob
---

# Move to Next Stage

You are managing progression through a spec-driven development workflow. Your task is to validate the current stage and proceed to the next stage if ready.

## Your Task

1. **Identify current stage** by checking which files exist
2. **Validate current stage** completeness and quality
3. **Proceed to next stage** if validation passes
4. **Provide guidance** if validation fails

## Stage Progression Flow

```
Requirements (spec) → Design → Implementation Planning (plan) → Build → Complete
```

## Validation & Progression Logic

### From Requirements Stage
**Current**: `requirements.md` exists
**Validation**: Check requirements completeness
**Next Action**: If valid, run `/design` command
**Output**: "Moving to Design stage..." or validation errors

### From Design Stage  
**Current**: `requirements.md` and `design.md` exist
**Validation**: Check design completeness and alignment with requirements
**Next Action**: If valid, run `/plan` command  
**Output**: "Moving to Implementation Planning stage..." or validation errors

### From Implementation Planning Stage
**Current**: All three files exist (`requirements.md`, `design.md`, `tasks.md`)
**Validation**: Check implementation plan completeness
**Next Action**: If valid, run `/build` command
**Output**: "Moving to Build stage..." or validation errors

### From Build Stage
**Current**: Tasks in `tasks.md` are marked as in-progress or completed
**Validation**: Check implementation progress
**Next Action**: Continue building or mark as complete
**Output**: Progress update and next recommended actions

## Validation Criteria (Quick Check)

### Requirements Ready?
- User stories present and well-formed
- EARS notation used correctly
- Acceptance criteria specific and testable
- No implementation details

### Design Ready?
- Architecture addresses all requirements
- Components clearly defined
- Data flow logical
- API design complete (if applicable)

### Plan Ready?
- Tasks broken down appropriately
- Dependencies identified
- Testing included
- Effort estimated

### Build Ready?
- Key tasks completed
- Tests passing
- Requirements being met
- Code quality maintained

## Response Format

### If Ready to Proceed
```markdown
# ✅ Stage Validation Passed

Current stage: [Stage Name]
Validation: All critical criteria met

## Moving to Next Stage: [Next Stage Name]
[Execute next stage command automatically]

## What to Expect
[Brief description of what the next stage will produce]
```

### If Not Ready to Proceed
```markdown
# ❌ Stage Validation Failed

Current stage: [Stage Name]
Issues found that must be addressed:

## Critical Issues
- [Issue 1 that blocks progression]
- [Issue 2 that blocks progression]

## Recommendations
1. [Specific action to resolve issue 1]
2. [Specific action to resolve issue 2]

## Next Steps
Run `/refine [instructions]` to address issues, then try `/next` again.
```

## Success Criteria
- Correctly identifies current stage
- Performs appropriate validation
- Either proceeds to next stage or provides clear feedback
- Automatically executes next stage command if ready
- Gives helpful guidance for resolving issues

Start by identifying the current stage, validate it thoroughly, and either proceed or provide specific guidance for improvement.