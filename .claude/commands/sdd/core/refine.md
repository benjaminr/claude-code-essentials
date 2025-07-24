---
description: Improve current stage output based on feedback
argument-hint: [instructions for improvement]
allowed-tools: Read, Write, Edit, MultiEdit, Glob
---

# Refine Current Stage

You are improving the current stage of a spec-driven development workflow based on specific feedback or instructions. Your task is to enhance the quality and completeness of the current stage files.

## Input
**Refinement Instructions**: $ARGUMENTS

## Your Task

1. **Identify the current stage** by checking which files exist
2. **Read the current stage files** to understand existing content
3. **Apply the requested improvements** based on the instructions
4. **Maintain the overall structure and format** while enhancing content

## Stage-Specific Refinement Approach

### Requirements Stage Refinement
**Target File**: `requirements.md`
**Common Improvements**:
- Add missing user stories
- Convert requirements to proper EARS notation
- Make acceptance criteria more specific
- Add missing dependencies or assumptions
- Improve clarity and remove ambiguity
- Add edge cases or error scenarios

### Design Stage Refinement
**Target File**: `design.md`
**Common Improvements**:
- Enhance architectural diagrams
- Add missing components or interfaces
- Improve API endpoint specifications
- Add security considerations
- Enhance data model definitions
- Add performance considerations
- Improve error handling strategy

### Planning Stage Refinement
**Target File**: `tasks.md`
**Common Improvements**:
- Break down large tasks into smaller ones
- Add missing testing tasks
- Improve task descriptions and outcomes
- Add missing dependencies
- Refine effort estimates
- Add risk mitigation tasks
- Improve definition of done criteria

### Build Stage Refinement
**Target Files**: Code files and `tasks.md`
**Common Improvements**:
- Improve code quality and structure
- Add missing error handling
- Enhance test coverage
- Update documentation
- Refactor for better maintainability
- Add performance optimisations

## Refinement Guidelines

### Content Enhancement
- Preserve all existing valid content
- Add new content based on instructions
- Improve clarity and specificity
- Remove redundancy or inconsistencies
- Ensure alignment with previous stages

### Quality Improvements
- Fix formatting and structure issues
- Improve readability and organisation
- Add missing details or context
- Enhance technical accuracy
- Improve actionability of tasks

### Structural Integrity
- Maintain file format and sections
- Keep numbering and reference systems
- Preserve links between requirements, design, and tasks
- Ensure consistency across all files

## Response Format

```markdown
# 🔧 Refinement Complete

## Changes Made
### [File Name]
- [Specific improvement 1]
- [Specific improvement 2]
- [Specific improvement 3]

## Summary of Improvements
- **Added**: [What was added]
- **Enhanced**: [What was improved]
- **Fixed**: [What was corrected]

## Impact Assessment
- **Requirements Coverage**: [How requirements coverage improved]
- **Technical Clarity**: [How design clarity improved]
- **Implementation Readiness**: [How ready for implementation]

## Next Steps
[Recommended actions after refinement]
```

## Success Criteria
- Instructions are followed precisely
- File quality is improved without losing existing value
- Changes enhance clarity and completeness
- Structure and format are maintained
- All improvements are documented

Apply the requested refinements to improve the current stage while maintaining quality and consistency with the overall specification.