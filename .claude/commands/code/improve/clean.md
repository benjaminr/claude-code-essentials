---
description: Clean up code by removing dead code, unused imports, and formatting
argument-hint: [file or directory path]
allowed-tools: Read, Write, MultiEdit, Grep, Glob, Bash
---

# Clean Code

You are cleaning up code by removing unused imports, dead code, formatting issues, and other code hygiene problems.

## Input
**Target to Clean**: $ARGUMENTS (file path, directory, or empty for current directory)

## Your Task

Clean and improve code quality:

1. **Remove Unused Code** - Imports, variables, functions
2. **Fix Formatting** - Consistent style and structure
3. **Improve Readability** - Simplify complex expressions
4. **Update Patterns** - Modernise outdated patterns

## Cleaning Strategy

### 1. Code Analysis
- Identify unused imports
- Find unreachable code
- Detect unused variables/functions
- Check for duplicate code
- Find console.logs/debug statements

### 2. Cleaning Report

```markdown
# 🧹 Code Cleanup Report

## Summary
**Files Analysed**: [X]
**Issues Found**: [Y]
**Issues Fixed**: [Z]

## Cleanup Actions

### Unused Imports Removed
📦 **[file:line]**
```diff
- import { unusedFunction } from 'module';
- import unusedDefault from 'another-module';
```

### Dead Code Removed
💀 **[file:line]**
```diff
- function neverCalled() {
-   // This function is never used
- }
```

### Console Statements Removed
🚫 **[file:line]**
```diff
- console.log('debug:', data);
- console.error('temporary debug');
```

### Code Simplified
✨ **[file:line]**
```diff
- if (condition === true) {
-   return true;
- } else {
-   return false;
- }
+ return condition;
```

### Formatting Fixed
🎨 **[file:line]**
- Inconsistent indentation fixed
- Trailing whitespace removed
- Missing semicolons added

## Patterns Modernized

### Updated to Modern Syntax
```diff
- var x = 1;
- var y = function() {};
+ const x = 1;
+ const y = () => {};
```

### Async/Await Migration
```diff
- fetchData().then(data => {
-   processData(data);
- }).catch(err => {
-   handleError(err);
- });
+ try {
+   const data = await fetchData();
+   processData(data);
+ } catch (err) {
+   handleError(err);
+ }
```

## Code Quality Improvements

### Complexity Reduction
- Simplified nested conditionals
- Extracted complex expressions
- Reduced function length

### Naming Improvements
- Renamed unclear variables
- Fixed inconsistent naming
- Added meaningful names

## Remaining Issues

### Manual Review Needed
1. **Potential dead code** in [file:line]
   - Appears unused but may have side effects
   
2. **Complex refactoring** in [file:line]
   - Requires deeper understanding of business logic

### Configuration Updates
- [ ] Update linter rules to prevent issues
- [ ] Add pre-commit hooks for formatting
- [ ] Configure editor auto-formatting

## Statistics
- **Lines Removed**: [X]
- **Imports Cleaned**: [Y]
- **Files Modified**: [Z]
- **Estimated Size Reduction**: [%]
```

## Cleaning Categories

### Import Hygiene
- Remove unused imports
- Organise import order
- Combine duplicate imports
- Convert require to import

### Dead Code Elimination
- Unreachable code after return
- Unused functions/methods
- Commented-out code blocks
- Obsolete feature flags

### Code Modernization
- var → const/let
- Callbacks → async/await
- Class components → hooks
- Old syntax → modern syntax

### Formatting & Style
- Consistent indentation
- Proper spacing
- Line length limits
- Consistent quotes

### Performance Cleanup
- Remove unnecessary loops
- Eliminate redundant operations
- Optimise data structures
- Remove memory leaks

## Safety Measures

### Before Cleaning
- Check for dynamic imports
- Verify test coverage
- Look for reflection usage
- Consider side effects

### Validation
- Run tests after changes
- Check build still works
- Verify functionality intact
- Look for runtime errors

## Configuration Support

### ESLint Integration
```json
{
  "rules": {
    "no-unused-vars": "error",
    "no-console": "warn",
    "no-debugger": "error",
    "no-unreachable": "error"
  }
}
```

### Prettier Config
```json
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5"
}
```

## Success Criteria
- Code is cleaner and more maintainable
- No functionality is broken
- Tests still pass
- Build size is reduced
- Code follows consistent style

Clean the specified code while maintaining functionality and improving quality.