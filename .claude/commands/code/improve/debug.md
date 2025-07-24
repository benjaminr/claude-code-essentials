---
description: Analyse errors, stack traces, and debug code issues (supports images and extended thinking)
argument-hint: [error message, file path, or image path]
allowed-tools: Read, Grep, Glob, Task, Bash, WebSearch
---

# Debug Code Issues

You are helping debug code issues by analysing errors, understanding stack traces, and providing targeted solutions.

## Input
**Debug Request**: $ARGUMENTS
- **Text Error**: Error message or description
- **Image Path**: Screenshot of error (`.png`, `.jpg`, etc.)
- **File Path**: Specific file to debug
- **Complex Issue**: Use "think:" prefix for extended analysis

## Your Task

Based on the input, perform intelligent debugging:

1. **Input Detection** - Determine if input is text, image, or complex issue
2. **Error Analysis** - Extract and analyse error information
3. **Code Investigation** - Search for related code and trace execution paths
4. **Root Cause Analysis** - Identify the underlying issue
5. **Solution Proposal** - Provide specific fixes and preventive measures

### Special Handling

#### Image Analysis
If input is an image path:
- Use Read tool to view the image
- Extract error messages, stack traces, or UI issues
- Identify file paths and line numbers from screenshots
- Continue with standard debugging process

#### Extended Thinking Mode
If input starts with "think:":
- Engage in deeper analysis for complex problems
- Consider multiple hypotheses
- Trace through complex execution paths
- Provide comprehensive solution strategies

## Debugging Framework

### 1. Error Analysis Phase
- **Error Type**: Identify error category (syntax, runtime, logic, etc.)
- **Stack Trace**: Extract file paths and line numbers (from text or images)
- **Error Message**: Understand what went wrong
- **Context**: Determine when/where error occurs
- **Execution Path**: Trace the code flow leading to the error

### 2. Code Investigation Phase
- **Read Error Location**: Examine code at error location
- **Trace Execution Path**: Follow complete code flow from entry point to error
- **Check Dependencies**: Verify imports and dependencies
- **Review Recent Changes**: Look for recent modifications if relevant
- **Cross-File Analysis**: Trace errors across multiple files and modules
- **Data Flow**: Track how data transforms through the error path

### 3. Pattern Recognition Phase
- **Null/Undefined**: Check for missing null checks
- **Type Mismatches**: Verify data types and conversions
- **Async Issues**: Look for promise/async/await problems
- **State Problems**: Check for state mutations or race conditions
- **Configuration**: Verify environment and config settings

## Output Format

```markdown
# Debug Analysis Report

## Executive Summary
**Issue**: [Brief description of the error]
**Severity**: [🔴 Critical | 🟡 Major | 🟢 Minor]
**Root Cause**: [Primary cause identified]
**Resolution Status**: [✅ Solution Ready | 🚧 Investigation Needed]

## Error Analysis

### Problem Location
**File**: `[file]:[line]`
**Context**: [What's happening at this location]
**Impact**: [What functionality is affected]

### Root Cause Investigation
[Detailed explanation of why the error occurs]

### Related Code Areas
**File**: `[related-file]:[line]`
**Purpose**: [How this code contributes to the issue]

## Immediate Solution

### 🔴 Critical Fix Required
**File**: `[file]:[line]`
```[language]
// Fixed code implementation
```

**Explanation**: [Why this fix resolves the issue]

## Prevention Measures

### 🟡 Code Improvements
- [Specific best practice 1]
- [Specific best practice 2] 
- [Testing recommendation]

### Monitoring
- [What to monitor to prevent recurrence]
- [Logging improvements needed]

## Validation Steps

### Testing the Fix
```bash
# Commands to verify the solution
```

### Verification Checklist
- [ ] Error no longer occurs
- [ ] All tests pass
- [ ] No regression introduced
- [ ] Edge cases handled

## Additional Context
- **Performance Impact**: [Assessment]
- **Security Implications**: [Any security considerations]
- **Future Considerations**: [Long-term improvements]
```

## Special Debugging Scenarios

### Memory/Performance Issues
- Profile code execution
- Identify memory leaks
- Suggest optimisation strategies

### Async/Concurrency Bugs
- Trace promise chains
- Identify race conditions
- Suggest proper synchronisation

### Integration Errors
- Check API contracts
- Verify data formats
- Test edge cases

### Build/Compilation Errors
- Analyse build configuration
- Check dependencies versions
- Resolve conflicts

## Advanced Features

### Image Debugging
When debugging from screenshots:
- Extract text from error dialogs
- Identify UI component issues
- Parse console output from images
- Analyse browser DevTools screenshots

### Extended Thinking Mode
For complex debugging scenarios:
- Multi-hypothesis testing
- Deep architectural analysis
- Performance profiling insights
- Concurrency and race condition detection

### Execution Path Tracing
- Complete call stack visualisation
- Cross-file execution flow
- Async operation tracking
- Event chain analysis

### Web Search Integration
If the error seems framework/library specific:
- Search for known issues and solutions
- Check recent version changes
- Find community solutions

### Pattern Recognition
- Identify similar errors in the codebase
- Suggest systematic fixes
- Recommend refactoring opportunities

## Success Criteria
- Error is accurately diagnosed
- Root cause is clearly identified
- Solution is specific and actionable
- Prevention strategies are provided
- Code examples are correct and tested

Analyse the provided error or issue and deliver a comprehensive debugging solution.