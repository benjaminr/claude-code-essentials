---
description: Validate current stage completeness and quality
allowed-tools: Read, Glob, Write
---

# Validate Current Stage

You are validating the current stage of a spec-driven development workflow. Your task is to check the completeness and quality of the current stage files.

## Your Task

1. **Identify the current stage** by checking which files exist:
   - If only `requirements.md` exists: validate requirements stage
   - If `requirements.md` and `design.md` exist: validate design stage
   - If all three files exist: validate implementation planning stage
   - If tasks are marked in progress: validate build stage

2. **Perform stage-specific validation**

## Validation Criteria

### Requirements Stage Validation
Check `requirements.md` for:
- [ ] Clear feature overview and purpose
- [ ] User stories in proper format ("As a [user], I want [goal] so that [benefit]")
- [ ] Functional requirements using EARS notation (WHEN...THE SYSTEM SHALL...)
- [ ] Non-functional requirements specified
- [ ] Acceptance criteria are specific and testable
- [ ] Dependencies and assumptions documented
- [ ] Requirements are numbered for traceability
- [ ] No implementation details mixed with requirements

### Design Stage Validation
Check `design.md` for:
- [ ] Architecture overview clearly explains system structure
- [ ] All major components are documented with purpose and responsibilities
- [ ] Data flow is logical and complete
- [ ] API design follows REST principles (if applicable)
- [ ] Data models are properly structured
- [ ] Security considerations addressed
- [ ] Error handling strategy defined
- [ ] Performance considerations documented
- [ ] Integration points identified
- [ ] Design addresses all requirements from requirements.md

### Implementation Planning Stage Validation
Check `tasks.md` for:
- [ ] Tasks are broken down into manageable pieces (1-2 days max)
- [ ] Each task has clear description and outcome
- [ ] Dependencies between tasks are identified
- [ ] Effort estimates are realistic
- [ ] Testing tasks are included
- [ ] Documentation tasks are included
- [ ] Risk assessment covers major concerns
- [ ] Definition of done is comprehensive
- [ ] All design components have corresponding tasks

### Build Stage Validation
Check task progress in `tasks.md` for:
- [ ] Task status indicators are being used correctly
- [ ] Completed tasks actually deliver the specified outcomes
- [ ] Implementation follows the design architecture
- [ ] Code quality meets project standards
- [ ] Tests are passing
- [ ] Documentation is updated
- [ ] All requirements are being addressed

## Output Format

```markdown
# Validation Report - [Stage Name]

## Executive Summary
**Stage**: [Requirements/Design/Planning/Building]
**Overall Status**: [✅ PASS | ⚠️ NEEDS IMPROVEMENT | ❌ FAIL]
**Critical Issues**: [X] found
**Ready to Proceed**: [✅ Yes | ❌ No]

## Quality Assessment

### Strengths Identified
- ✅ [What is working well]
- ✅ [Quality aspects that meet standards]
- ✅ [Best practices followed]

### 🔴 Critical Issues (Must Fix)
- ❌ **[Issue Category]**: [Specific issue description]
- ❌ **[Another Issue]**: [Another specific issue]

### 🟡 Improvement Opportunities
- ⚠️ **[Minor Issue]**: [Enhancement suggestion]
- ⚠️ **[Style Issue]**: [Improvement recommendation]

### 🟢 Missing Elements
- [Required component 1]: [Why it's needed]
- [Required component 2]: [Impact of absence]

## Stage-Specific Validation Results
[Detailed validation against stage-specific criteria]

## Action Plan

### Immediate Actions (Required)
- [ ] [Critical fix 1 with specific steps]
- [ ] [Critical fix 2 with specific steps]

### Recommended Improvements
- [ ] [Enhancement 1]
- [ ] [Enhancement 2]

## Next Steps
**Ready for Next Stage**: [✅ YES | ❌ NO]

### If Ready:
Run `/next` to proceed to [next stage name]

### If Not Ready:
1. Address critical issues listed above
2. Run `/validate` again to verify fixes
3. Use `/refine [specific instructions]` for targeted improvements
```

## Success Criteria
- Validation report identifies the current stage correctly
- All validation criteria for the stage are checked
- Issues are clearly categorised by severity
- Specific recommendations are provided
- Clear guidance on readiness for next stage

Perform thorough validation of the current stage and provide actionable feedback for improvement.