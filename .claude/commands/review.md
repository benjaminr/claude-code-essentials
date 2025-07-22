---
description: Perform systematic code review with best practices checklist
argument-hint: [files to review or PR/branch]
allowed-tools: Read, Grep, Glob, Bash, Task
---

# Code Review Assistant

You are performing systematic code review to ensure code quality, maintainability, security, and adherence to best practices.

## Input
**Review Target**: $ARGUMENTS (file paths, branch name, or PR reference)

## Your Task

Conduct comprehensive code review covering:

1. **Code Quality** - Structure, readability, maintainability
2. **Functionality** - Logic correctness and edge cases
3. **Security** - Vulnerability assessment
4. **Performance** - Efficiency and scalability concerns
5. **Standards Compliance** - Team conventions and best practices

## Review Framework

### 1. Code Quality Assessment

#### Readability & Maintainability
- Clear variable and function naming
- Appropriate code comments
- Consistent formatting and style
- Logical code organisation
- Proper abstraction levels

#### Complexity Analysis
- Cyclomatic complexity evaluation
- Function/method length assessment
- Nested logic depth
- Code duplication detection

### 2. Review Report Structure

```markdown
# 📝 Code Review Report

**Reviewer**: Claude Code Assistant
**Review Date**: [Date]
**Scope**: [Files/changes reviewed]
**Overall Rating**: ⭐⭐⭐⭐⭐ ([X]/5)

## 📊 Review Summary
- **Files Reviewed**: [X] files, [Y] lines changed
- **Issues Found**: [Z] total ([Critical], [Major], [Minor])
- **Recommendation**: ✅ APPROVE | ⚠️ APPROVE WITH CHANGES | ❌ REQUEST CHANGES

## 🔴 Critical Issues (Must Fix)

### 1. [Issue Category] - [file:line]
**Severity**: 🔴 Critical
**Impact**: [Security/Performance/Functionality]

#### Code:
```[language]
[Problematic code snippet]
```

#### Issue:
[Detailed explanation of the problem]

#### Recommendation:
```[language]
[Suggested fix]
```

#### Rationale:
[Why this fix is necessary]

## 🟡 Major Issues (Should Fix)

### 1. Logic Error - [file:line]
**Potential Impact**: [Functional bug under specific conditions]

#### Analysis:
[Detailed code analysis]

#### Suggested Fix:
[Specific solution]

## 🟢 Minor Issues (Nice to Have)

### Code Style & Readability
- **[file:line]**: Variable naming could be more descriptive
- **[file:line]**: Consider extracting complex expression to variable
- **[file:line]**: Add documentation comment

## ✅ Positive Observations

### What's Done Well
- Excellent error handling in [file:function]
- Clear separation of concerns in [module]
- Good test coverage for [feature]
- Consistent coding style throughout

### Best Practices Followed
- Proper input validation
- Effective use of design patterns
- Clear documentation
- Appropriate error handling

## 📋 Detailed Review Checklist

### Functionality ✅❌
- [ ] Code accomplishes intended purpose
- [ ] Edge cases are handled appropriately
- [ ] Error conditions are managed properly
- [ ] Input validation is comprehensive
- [ ] Output is correctly formatted

### Code Quality ✅❌
- [ ] Functions are single-purpose and focused
- [ ] Variable names are clear and descriptive
- [ ] Code is well-organised and structured
- [ ] Comments explain why, not what
- [ ] No code duplication

### Performance ✅❌
- [ ] Algorithms are efficient for expected scale
- [ ] Database queries are optimised
- [ ] Memory usage is appropriate
- [ ] No unnecessary computations
- [ ] Caching used where beneficial

### Security ✅❌
- [ ] Input sanitisation implemented
- [ ] No hardcoded secrets or credentials
- [ ] Authentication/authorisation checked
- [ ] SQL injection prevention
- [ ] XSS protection in place

### Testing ✅❌
- [ ] Unit tests cover new functionality
- [ ] Edge cases are tested
- [ ] Integration tests updated if needed
- [ ] Test names are descriptive
- [ ] Mocks/stubs used appropriately

### Documentation ✅❌
- [ ] README updated if necessary
- [ ] API documentation current
- [ ] Inline comments explain complex logic
- [ ] Change log updated
- [ ] Architecture docs reflect changes
```

## Review Categories

### Architectural Review
- Design pattern appropriateness
- Separation of concerns
- Dependency management
- Scalability considerations
- Integration points

### Security Review
- Authentication/authorisation flows
- Input validation and sanitisation
- Data encryption and protection
- Secrets management
- OWASP compliance

### Performance Review
- Time complexity analysis
- Space complexity assessment
- Database query efficiency
- Network request optimisation
- Resource utilisation

### Maintainability Review
- Code readability and clarity
- Test coverage and quality
- Documentation completeness
- Refactoring opportunities
- Technical debt assessment

## Contextual Analysis

### Business Logic Validation
```markdown
#### Feature: [Feature Name]
**Business Requirements Met**: ✅❌
**User Stories Addressed**: [List]
**Acceptance Criteria**: [Validation]

#### Edge Cases Considered:
- [ ] Empty/null inputs
- [ ] Maximum/minimum values
- [ ] Concurrent access scenarios
- [ ] Network/database failures
```

### Integration Impact
```markdown
#### Dependencies Affected:
- [Service A]: [Impact description]
- [Database]: [Schema changes, migration needed]
- [External API]: [Contract changes]

#### Backwards Compatibility:
✅ Fully compatible | ⚠️ Minor breaking changes | ❌ Major breaking changes
[Details of any compatibility issues]
```

## Review Workflow Integration

### PR Review Template
```markdown
## Review Checklist
- [ ] Code builds without warnings
- [ ] All tests pass
- [ ] No security vulnerabilities introduced
- [ ] Performance impact assessed
- [ ] Documentation updated

## Questions for Author:
1. [Specific question about implementation choice]
2. [Clarification needed on business logic]

## Suggestions:
- Consider [alternative approach] for better [performance/maintainability]
- Would benefit from [additional testing/documentation]
```

### Follow-up Actions
```markdown
## Action Items
### For Author:
- [ ] Fix critical security issue in [file:line]
- [ ] Add unit tests for [function]
- [ ] Update documentation for [feature]

### For Reviewer:
- [ ] Re-review after fixes applied
- [ ] Verify performance impact in staging
- [ ] Update team knowledge base

### For Team:
- [ ] Discuss new pattern introduced
- [ ] Update coding standards if needed
- [ ] Schedule knowledge sharing session
```

## Success Criteria
- All critical issues identified and addressed
- Code quality standards maintained
- Security considerations evaluated
- Performance implications understood
- Knowledge shared and team standards upheld

Provide thorough, constructive code review that maintains high standards while supporting developer growth.