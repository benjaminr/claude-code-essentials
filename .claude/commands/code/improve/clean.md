---
description: Clean up code by removing dead code, unused imports, and formatting
argument-hint: [file or directory path]
allowed-tools: Read, Write, MultiEdit, Grep, Glob, Bash
---

# Clean Code

You are cleaning up code by removing unused imports, dead code, formatting issues, and other code hygiene problems. You automatically detect the language and apply language-specific best practices, with a focus on Python.

## Input
**Target to Clean**: $ARGUMENTS (file path, directory, or empty for current directory)

## Your Task

Clean and improve code quality:

1. **Auto-detect Language** - Identify file types and apply language-specific rules
2. **Remove Unused Code** - Imports, variables, functions, old commented code
3. **Fix Formatting** - Run formatters (ruff/black for Python, prettier for JS/TS)
4. **Apply Auto-fixes** - Use linter fixes respecting existing configs
5. **Improve Readability** - Simplify complex expressions following language best practices
6. **Update Patterns** - Modernise outdated patterns for each language
7. **Create Undo Backup** - Save original state before making changes

## Cleaning Strategy

### 1. Language Detection & Setup
- Detect programming language from file extension and content
- Check for formatter configs (.ruff.toml, pyproject.toml, .prettierrc)
- Create backup of original files for undo capability
- Scan both tracked files and .gitignore contents (focusing on code)

### 2. Language-Specific Analysis

#### Python
- Identify unused imports with `ruff check --select F401`
- Find unreachable code and dead functions
- Detect unused variables (`ruff check --select F841`)
- Remove `__pycache__` directories and `.pyc` files
- Find print statements and debug code
- Check for outdated patterns (e.g., `%` formatting, old-style classes)

#### JavaScript/TypeScript
- Identify unused imports and exports
- Find console.log/debug statements
- Detect unreachable code after return
- Check for var usage (prefer const/let)
- Find commented-out code blocks

### 3. Automated Cleaning Process

```python
# Step 1: Create undo backup
import shutil
import tempfile
backup_dir = tempfile.mkdtemp(prefix="clean_backup_")
print(f"Backup created at: {backup_dir}")

# Step 2: Run language-specific formatters
# Python
if language == "python":
    # Run ruff format (respects pyproject.toml)
    subprocess.run(["ruff", "format", target_path])
    # Run ruff fix for auto-fixable issues
    subprocess.run(["ruff", "check", "--fix", target_path])
    # Clean Python cache
    for root, dirs, files in os.walk(target_path):
        if "__pycache__" in dirs:
            shutil.rmtree(os.path.join(root, "__pycache__"))
        for file in files:
            if file.endswith(".pyc"):
                os.remove(os.path.join(root, file))

# JavaScript/TypeScript
elif language in ["javascript", "typescript"]:
    # Run prettier if config exists
    if prettier_config_exists:
        subprocess.run(["prettier", "--write", target_path])
    # Run ESLint fix
    if eslint_config_exists:
        subprocess.run(["eslint", "--fix", target_path])
```

### 4. Cleaning Report

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

### Code Simplified (Python Examples)
✨ **[file:line]**
```diff
# Boolean simplification
- if condition == True:
-     return True
- else:
-     return False
+ return bool(condition)

# List comprehension
- result = []
- for item in items:
-     if item.is_valid:
-         result.append(item.value)
+ result = [item.value for item in items if item.is_valid]

# Context manager usage
- file = open('data.txt')
- content = file.read()
- file.close()
+ with open('data.txt') as file:
+     content = file.read()
```

### Formatting Fixed
🎨 **[file:line]**
- Inconsistent indentation fixed
- Trailing whitespace removed
- Missing semicolons added

## Patterns Modernized

### Updated to Modern Python Syntax
```diff
# String formatting
- message = "Hello %s, you are %d years old" % (name, age)
- message = "Hello {}, you are {} years old".format(name, age)
+ message = f"Hello {name}, you are {age} years old"

# Type hints (Python 3.9+)
- from typing import List, Dict, Optional
- def process(items: List[str]) -> Dict[str, int]:
+ def process(items: list[str]) -> dict[str, int]:

# Dictionary merging
- merged = dict1.copy()
- merged.update(dict2)
+ merged = dict1 | dict2  # Python 3.9+

# Pattern matching (Python 3.10+)
- if isinstance(value, int):
-     return value * 2
- elif isinstance(value, str):
-     return len(value)
+ match value:
+     case int(n):
+         return n * 2
+     case str(s):
+         return len(s)
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

### Python Import Hygiene
- Remove unused imports (using ruff)
- Sort imports with isort conventions
- Group imports (standard lib, third-party, local)
- Remove duplicate imports
- Convert old-style imports to modern
```python
# Before
import os, sys
from typing import List, Dict, Optional
import unused_module
from my_module import *

# After
import os
import sys

from my_module import specific_function, SpecificClass
```

### Dead Code Elimination
- Unreachable code after return
- Unused functions/methods
- Commented-out code blocks
- Obsolete feature flags

### Python Code Modernization
- Old string formatting → f-strings
- `typing` imports → built-in types (3.9+)
- Dictionaries → dataclasses where appropriate
- Manual file handling → context managers
- `os.path` → `pathlib.Path`
- Class decorators for simple classes
- Walrus operator for assignments (3.8+)
- Match statements for complex conditionals (3.10+)

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

### Python Tool Integration

#### Ruff Configuration (pyproject.toml)
```toml
[tool.ruff]
line-length = 88
target-version = "py39"

# Enable specific rule sets
select = [
    "E",    # pycodestyle errors
    "F",    # pyflakes
    "I",    # isort
    "N",    # pep8-naming
    "UP",   # pyupgrade
    "RUF",  # Ruff-specific rules
]

# Auto-fix these issues
fixable = ["ALL"]

[tool.ruff.per-file-ignores]
"__init__.py" = ["F401"]  # Allow unused imports in __init__ files
```

#### Black Configuration (pyproject.toml)
```toml
[tool.black]
line-length = 88
target-version = ['py39']
include = '\.pyi?$'
```

## Undo Mechanism

```python
# Restore from backup
def undo_cleaning(backup_dir: str, target_path: str):
    """Restore files from backup created during cleaning."""
    if os.path.exists(backup_dir):
        shutil.rmtree(target_path)
        shutil.copytree(backup_dir, target_path)
        print(f"✅ Restored from backup: {backup_dir}")
    else:
        print(f"❌ Backup not found: {backup_dir}")
```

## Success Criteria
- Code is cleaner and follows language best practices
- All formatters and linters run successfully
- No functionality is broken
- Tests still pass
- Backup created for easy undo
- Python code follows modern idioms
- Respects existing tool configurations

Clean the specified code while maintaining functionality and improving quality according to language-specific best practices.