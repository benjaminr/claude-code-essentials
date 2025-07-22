---
description: Analyze errors, stack traces, and debug code issues
argument-hint: [error message or description]
allowed-tools: Read, Grep, Glob, Task, Bash, WebSearch
---

# Debug Code Issues

You are helping debug code issues by analyzing errors, understanding stack traces, and providing targeted solutions.

## Input
**Error or Issue Description**: $ARGUMENTS

## Your Task

Based on the input, perform intelligent debugging:

1. **Error Analysis** - If an error message is provided
2. **Code Investigation** - Search for related code and context
3. **Root Cause Analysis** - Identify the underlying issue
4. **Solution Proposal** - Provide specific fixes and preventive measures

## Debugging Framework

### 1. Error Analysis Phase
- **Error Type**: Identify error category (syntax, runtime, logic, etc.)
- **Stack Trace**: Extract file paths and line numbers
- **Error Message**: Understand what went wrong
- **Context**: Determine when/where error occurs

### 2. Code Investigation Phase
- **Read Error Location**: Examine code at error location
- **Trace Execution Path**: Follow code flow leading to error
- **Check Dependencies**: Verify imports and dependencies
- **Review Recent Changes**: Look for recent modifications if relevant

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
- Suggest optimization strategies

### Async/Concurrency Bugs
- Trace promise chains
- Identify race conditions
- Suggest proper synchronization

### Integration Errors
- Check API contracts
- Verify data formats
- Test edge cases

### Build/Compilation Errors
- Analyze build configuration
- Check dependencies versions
- Resolve conflicts

## Advanced Features

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

Analyze the provided error or issue and deliver a comprehensive debugging solution.