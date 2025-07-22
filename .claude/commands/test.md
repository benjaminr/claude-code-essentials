---
description: Generate comprehensive tests for code
argument-hint: [file path or function name]
allowed-tools: Read, Write, Glob, Grep, TodoWrite
---

# Generate Tests

You are generating comprehensive tests for code, ensuring good coverage and following testing best practices.

## Input
**Target for Testing**: $ARGUMENTS (file path, function name, or code description)

## Your Task

Generate appropriate tests based on the context:

1. **Analyze the Code** - Understand what needs testing
2. **Identify Test Scenarios** - Cover happy paths, edge cases, and errors  
3. **Generate Test Suite** - Create comprehensive, maintainable tests
4. **Suggest Coverage Improvements** - Recommend additional test cases

## Test Generation Strategy

### 1. Code Analysis
- **Read Target Code**: Examine functions, classes, or modules
- **Identify Test Framework**: Check existing tests for framework/patterns
- **Understand Dependencies**: Note mocks/stubs needed
- **Check CLAUDE.md**: Look for testing standards and conventions

### 2. Test Scenario Planning

#### Unit Tests
- **Happy Path**: Normal expected behavior
- **Edge Cases**: Boundary conditions, empty inputs, limits
- **Error Cases**: Invalid inputs, exceptions, failures
- **State Changes**: Before/after conditions
- **Side Effects**: External calls, mutations

#### Integration Tests  
- **Component Interaction**: How parts work together
- **Data Flow**: End-to-end data processing
- **External Services**: API calls, database operations
- **Configuration**: Different environments/settings

### 3. Test Structure

```[language]
describe('[Component/Function Name]', () => {
  // Setup and teardown
  beforeEach(() => {
    // Test setup
  });

  describe('[Feature/Method]', () => {
    it('should [expected behavior] when [condition]', () => {
      // Arrange
      [setup test data]
      
      // Act
      [execute function]
      
      // Assert
      [verify results]
    });

    it('should handle [edge case]', () => {
      // Edge case test
    });

    it('should throw error when [invalid condition]', () => {
      // Error case test
    });
  });
});
```

## Output Format

```markdown
# Test Generation Complete

## Generation Summary
**Target**: [What was tested]
**Framework**: [Testing framework used]
**Tests Created**: [X] tests across [Y] files
**Coverage**: [Expected coverage percentage]

## Generated Test Files

### [Test File Name]
**File**: `[path/to/test/file]`
**Purpose**: [What this test file covers]
**Status**: ✅ Ready

```[language]
[Key test examples]
```

## Test Coverage Analysis

### Scenarios Covered
**Happy Path Tests**: [X] tests ✅
- [Scenario 1]
- [Scenario 2]

**Edge Cases**: [Y] tests ✅
- [Edge case 1]
- [Edge case 2]

**Error Handling**: [Z] tests ✅
- [Error scenario 1]
- [Error scenario 2]

### 🟡 Additional Recommendations
- [ ] [Integration test suggestion]
- [ ] [Performance test suggestion]
- [ ] [Security test suggestion]

## Quality Assurance
✅ **Test Structure**: Following project conventions
✅ **Mocking Strategy**: Appropriate mocks and stubs implemented
✅ **Assertions**: Clear and comprehensive
✅ **Independence**: Tests run independently

## Next Steps

### Immediate Actions
- [ ] Run generated tests to verify they pass
- [ ] Integrate tests into CI/CD pipeline
- [ ] Review test coverage report

### Running the Tests
```bash
# Command to execute the test suite
[test command]
```

## Coverage Metrics
**Estimated Coverage**: [X]%
**Target Coverage**: [Y]%
**Gap Analysis**: [Recommendations for reaching target]
```

## Test Types by Context

### React/Vue Components
- Render tests
- User interaction tests
- Props validation
- State management
- Event handling

### API Endpoints
- Status codes
- Response format
- Authentication
- Error responses
- Rate limiting

### Utility Functions
- Input validation
- Return values
- Type checking
- Performance
- Memory usage

### Data Processing
- Transformations
- Validations
- Edge cases
- Large datasets
- Malformed data

## Best Practices Applied
- **Descriptive Names**: Tests clearly describe what they verify
- **Independence**: Each test runs independently
- **Fast Execution**: Tests are optimized for speed
- **Maintainable**: Easy to understand and modify
- **Comprehensive**: Cover success, failure, and edge cases

## Success Criteria
- Tests follow project conventions
- All critical paths are covered
- Tests are independent and repeatable
- Mock strategy is clear
- Tests actually verify behavior

Generate comprehensive tests for the specified code target.