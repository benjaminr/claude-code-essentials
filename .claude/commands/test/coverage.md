---
description: Analyse test coverage and generate tests for untested code
argument-hint: [directory/file path] or "identify-untested"
allowed-tools: Read, Grep, Glob, Task, Write, MultiEdit
---

# Test Coverage Analysis & Generation

You are analysing test coverage to identify untested code and generate comprehensive test suites for critical functionality.

## Input
**Coverage Request**: $ARGUMENTS
- **Path Analysis**: Specific file or directory to analyse
- **"identify-untested"**: Find all untested code in project
- **"critical-paths"**: Focus on critical business logic
- **"generate"**: Create tests for identified gaps

## Your Task

Comprehensive test coverage analysis and improvement:

1. **Coverage Analysis** - Identify what's tested and what's not
2. **Risk Assessment** - Prioritise untested critical code
3. **Test Generation** - Create meaningful test cases
4. **Coverage Report** - Provide actionable coverage metrics

## Coverage Analysis Strategy

### 1. Test Discovery
- Locate existing test files
- Map tests to source code
- Identify testing patterns used
- Detect test framework (Jest, pytest, etc.)

### 2. Coverage Gap Detection
- Find functions without tests
- Identify untested branches
- Locate untested error paths
- Detect missing edge cases

### 3. Risk-Based Prioritisation
- Critical business logic first
- High-complexity functions
- Error-prone areas
- Public API surfaces

## Output Format

```markdown
# 🧪 Test Coverage Analysis Report

## Coverage Overview
**Project**: [Project name]
**Current Coverage**: [X]% (Estimated)
**Critical Gaps**: [Y] high-priority items
**Test Framework**: [Jest/pytest/mocha/etc.]

## 📊 Coverage Summary

### By Component
| Component | Files | Coverage | Priority |
|-----------|-------|----------|----------|
| API Routes | 12 | 45% | 🔴 High |
| Services | 8 | 78% | 🟡 Medium |
| Utils | 15 | 92% | 🟢 Low |
| Models | 6 | 30% | 🔴 High |

### Coverage Visualisation
```
src/
├── api/
│   ├── auth.js       ██████░░░░ 60% ⚠️
│   ├── users.js      ███░░░░░░░ 30% 🔴
│   └── payments.js   ░░░░░░░░░░ 0%  🚨
├── services/
│   ├── email.js      █████████░ 90% ✅
│   └── cache.js      ███████░░░ 70% 🟡
└── utils/
    └── validation.js ██████████ 100% ✅

Legend: █ Tested | ░ Untested
```

## 🔴 Critical Untested Code

### 1. Payment Processing - `[services/payment.js]`
**Risk Level**: 🚨 CRITICAL
**Business Impact**: Revenue loss, compliance issues

#### Untested Functions:
```javascript
// services/payment.js:45-72
async function processPayment(amount, userId, paymentMethod) {
  // ❌ No tests for:
  // - Invalid amount handling
  // - Payment method validation
  // - Stripe API error handling
  // - Partial payment scenarios
  // - Refund logic
}

// services/payment.js:120-145  
function calculateTax(amount, location) {
  // ❌ No tests for:
  // - Different tax jurisdictions
  // - Tax exemptions
  // - Rounding edge cases
}
```

#### Generated Test Suite:
```javascript
// __tests__/services/payment.test.js
describe('Payment Service', () => {
  describe('processPayment', () => {
    it('should process valid payment successfully', async () => {
      const result = await processPayment(100, 'user123', 'card');
      expect(result.status).toBe('success');
      expect(result.transactionId).toBeDefined();
    });

    it('should reject negative amounts', async () => {
      await expect(processPayment(-100, 'user123', 'card'))
        .rejects.toThrow('Invalid payment amount');
    });

    it('should handle Stripe API errors gracefully', async () => {
      mockStripe.charges.create.mockRejectedValue(new Error('Card declined'));
      await expect(processPayment(100, 'user123', 'card'))
        .rejects.toThrow('Payment failed: Card declined');
    });

    // ... more test cases
  });
});
```

### 2. User Authentication - `[api/auth.js]`
**Risk Level**: 🔴 HIGH
**Business Impact**: Security vulnerabilities

#### Coverage Gaps:
- No tests for rate limiting
- Missing JWT expiration tests
- No SQL injection tests
- Untested password reset flow

## 🟡 Medium Priority Gaps

### Data Validation - `[utils/validators.js]`
```javascript
// Missing edge case tests:
- Email validation with international domains
- Phone number formatting for different countries
- Date parsing with various formats
```

## Test Generation Templates

### Unit Test Template
```javascript
describe('[Module Name]', () => {
  let [dependencies];

  beforeEach(() => {
    // Setup mocks and test data
  });

  afterEach(() => {
    // Cleanup
  });

  describe('[Function Name]', () => {
    it('should [expected behaviour] when [condition]', () => {
      // Arrange
      const input = [test data];
      
      // Act
      const result = functionUnderTest(input);
      
      // Assert
      expect(result).toBe([expected]);
    });

    it('should handle edge case: [description]', () => {
      // Edge case test
    });

    it('should throw error when [error condition]', () => {
      // Error handling test
    });
  });
});
```

### Integration Test Template
```javascript
describe('[Feature] Integration Tests', () => {
  it('should complete [user flow] successfully', async () => {
    // Step 1: Setup initial state
    // Step 2: Execute user actions
    // Step 3: Verify end state
    // Step 4: Check side effects
  });
});
```

## 📈 Coverage Improvement Plan

### Phase 1: Critical Gaps (Week 1)
1. Payment processing tests - 8 hours
2. Authentication flow tests - 6 hours
3. Data integrity tests - 4 hours

### Phase 2: High-Risk Areas (Week 2)
1. API endpoint tests - 10 hours
2. Error handling paths - 6 hours
3. Edge case scenarios - 8 hours

### Phase 3: Comprehensive Coverage (Week 3)
1. Integration tests - 12 hours
2. Performance tests - 6 hours
3. Security tests - 8 hours

## Test Quality Metrics

### Good Test Characteristics
✅ **Clear test names** describing behaviour
✅ **Independent** - no dependencies between tests
✅ **Repeatable** - same result every time
✅ **Fast** - milliseconds not seconds
✅ **Focused** - one assertion per test

### Test Smells to Avoid
❌ Testing implementation details
❌ Overly complex setup
❌ Brittle assertions
❌ Ignored/skipped tests
❌ Non-deterministic results

## Recommended Testing Tools

### Coverage Tools
- **JavaScript**: nyc, c8, Jest coverage
- **Python**: coverage.py, pytest-cov
- **Go**: go test -cover
- **Ruby**: SimpleCov

### Mutation Testing
- **JavaScript**: Stryker
- **Python**: mutmut
- **Java**: PITest

## Action Items

### Immediate (Do Today)
- [ ] Add tests for payment processing
- [ ] Test authentication error paths
- [ ] Cover critical data validations

### Short Term (This Week)
- [ ] Set up coverage reporting in CI
- [ ] Add coverage badges to README
- [ ] Create test writing guidelines

### Long Term (This Month)
- [ ] Achieve 80% coverage minimum
- [ ] Implement mutation testing
- [ ] Add performance test suite

## Success Criteria
- Critical business logic 100% tested
- Overall coverage above 80%
- All error paths have tests
- Edge cases documented and tested
- Tests are maintainable and clear

Generate comprehensive test coverage analysis and create meaningful tests that improve code quality and reliability.