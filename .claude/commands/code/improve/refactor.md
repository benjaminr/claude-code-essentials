---
description: Guide systematic refactoring to improve code structure and maintainability  
argument-hint: [file path or refactoring goal]
allowed-tools: Read, Write, MultiEdit, Grep, Glob, Task
---

# Refactoring Assistant

You are guiding systematic refactoring to improve code structure, maintainability, and quality whilst preserving functionality.

## Input
**Refactoring Target**: $ARGUMENTS (file path, function name, or refactoring goal)

## Your Task

Guide strategic refactoring with:

1. **Code Analysis** - Identify refactoring opportunities
2. **Impact Assessment** - Evaluate risks and benefits
3. **Refactoring Plan** - Systematic approach with steps
4. **Implementation** - Execute refactoring safely
5. **Validation** - Ensure functionality preserved

## Refactoring Framework

### 1. Refactoring Assessment

```markdown
# 🔧 Refactoring Analysis

## Current State
**Target**: [File/function/module]
**Code Smells Identified**:
- [Long methods/classes]
- [Duplicate code]
- [Complex conditionals]
- [Poor naming]

## Refactoring Opportunities
1. **[Refactoring Type]** - [Expected benefit]
2. **[Another refactoring]** - [Expected benefit]

## Risk Assessment
- **Complexity**: [Low/Medium/High]
- **Test Coverage**: [X]% - [Good/Needs improvement]
- **Dependencies**: [X] files affected
- **Business Impact**: [Low/Medium/High]
```

### 2. Common Refactoring Patterns

#### Extract Method
```javascript
// Before: Long method with multiple responsibilities
function processOrder(order) {
  // Validate order (10 lines)
  if (!order.customerId) throw new Error('Missing customer');
  if (!order.items || order.items.length === 0) throw new Error('No items');
  // ... more validation
  
  // Calculate totals (15 lines)  
  let subtotal = 0;
  for (const item of order.items) {
    subtotal += item.price * item.quantity;
  }
  // ... tax and shipping calculations
  
  // Save to database (8 lines)
  const orderRecord = { ...order, total: grandTotal };
  database.orders.insert(orderRecord);
  // ... audit logging
}

// After: Extracted methods
function processOrder(order) {
  validateOrder(order);
  const total = calculateOrderTotal(order);
  return saveOrderToDatabase(order, total);
}

function validateOrder(order) {
  if (!order.customerId) throw new Error('Missing customer');
  if (!order.items || order.items.length === 0) throw new Error('No items');
  // Focused validation logic
}

function calculateOrderTotal(order) {
  const subtotal = calculateSubtotal(order.items);
  const tax = calculateTax(subtotal);
  const shipping = calculateShipping(order);
  return subtotal + tax + shipping;
}
```

#### Extract Class
```javascript
// Before: God object with too many responsibilities
class User {
  constructor(userData) {
    this.name = userData.name;
    this.email = userData.email;
    this.preferences = userData.preferences;
  }
  
  // Authentication methods (should be separate)
  login(password) { /* ... */ }
  logout() { /* ... */ }
  resetPassword() { /* ... */ }
  
  // Profile methods  
  updateProfile(data) { /* ... */ }
  getDisplayName() { /* ... */ }
  
  // Notification methods (should be separate)
  sendEmail(subject, body) { /* ... */ }
  sendSMS(message) { /* ... */ }
  getNotificationPreferences() { /* ... */ }
}

// After: Separated concerns
class User {
  constructor(userData) {
    this.name = userData.name;
    this.email = userData.email;
    this.profile = new UserProfile(userData.profile);
    this.auth = new UserAuthentication(this);
    this.notifications = new UserNotifications(this);
  }
  
  getDisplayName() {
    return this.profile.getDisplayName();
  }
}

class UserAuthentication {
  constructor(user) {
    this.user = user;
  }
  
  login(password) { /* ... */ }
  logout() { /* ... */ }
  resetPassword() { /* ... */ }
}

class UserNotifications {
  constructor(user) {
    this.user = user;
  }
  
  sendEmail(subject, body) { /* ... */ }
  sendSMS(message) { /* ... */ }
  getPreferences() { /* ... */ }
}
```

#### Replace Conditional with Polymorphism
```javascript
// Before: Complex conditional logic
class PaymentProcessor {
  processPayment(payment) {
    if (payment.type === 'credit_card') {
      // Credit card processing logic
      this.validateCard(payment.cardNumber);
      return this.chargeCreditCard(payment);
    } else if (payment.type === 'paypal') {
      // PayPal processing logic
      return this.processPayPal(payment);
    } else if (payment.type === 'bank_transfer') {
      // Bank transfer logic
      return this.processBankTransfer(payment);
    }
    throw new Error('Unknown payment type');
  }
}

// After: Polymorphic solution
class PaymentProcessor {
  constructor() {
    this.processors = {
      credit_card: new CreditCardProcessor(),
      paypal: new PayPalProcessor(),
      bank_transfer: new BankTransferProcessor()
    };
  }
  
  processPayment(payment) {
    const processor = this.processors[payment.type];
    if (!processor) {
      throw new Error('Unknown payment type');
    }
    return processor.process(payment);
  }
}

class CreditCardProcessor {
  process(payment) {
    this.validateCard(payment.cardNumber);
    return this.charge(payment);
  }
}
```

## Refactoring Report Format

```markdown
# 🔧 Refactoring Report

## Overview
**Refactoring Type**: [Extract Method/Extract Class/etc.]
**Files Modified**: [X] files
**Impact**: [Lines changed, methods affected]

## Changes Made

### 1. Extract Method: calculateOrderTotal()
**File**: `src/services/OrderService.js`
**Lines**: 45-75 → New method at line 120

#### Before (Inline calculation):
```javascript
[Original complex code]
```

#### After (Extracted method):
```javascript
[Refactored clean code]
```

#### Benefits:
- Improved readability
- Better testability  
- Single responsibility
- Reusable logic

### 2. Rename Variables for Clarity
**Changes**:
- `data` → `orderData` (5 occurrences)
- `temp` → `processedItems` (3 occurrences)
- `result` → `validationResult` (2 occurrences)

## Quality Improvements
- **Cyclomatic Complexity**: Reduced from 12 to 4
- **Method Length**: Average reduced from 25 to 8 lines
- **Code Duplication**: Eliminated 3 duplicate blocks
- **Test Coverage**: Maintained at 94%

## Validation Results
✅ **All Tests Pass**: 127/127 tests passing
✅ **Linting Clean**: No style violations
✅ **Type Checking**: No TypeScript errors
✅ **Performance**: No regression detected

## Next Steps
- [ ] Add unit tests for extracted methods
- [ ] Update documentation
- [ ] Consider further extracting [specific area]
- [ ] Schedule code review
```

## Refactoring Strategies

### Safe Refactoring Steps
1. **Ensure Test Coverage** - Verify comprehensive tests exist
2. **Make Small Changes** - One refactoring at a time
3. **Run Tests Frequently** - After each change
4. **Use IDE Tools** - Automated refactoring where possible
5. **Review and Commit** - Small, focused commits

### Code Smell Detection
```javascript
// 🔍 Detect these patterns for refactoring:

// Long Parameter List (>3-4 parameters)
function createUser(firstName, lastName, email, phone, address, preferences, settings) {
  // Consider: Parameter object or builder pattern
}

// Feature Envy (method uses another class more than its own)
class Invoice {
  calculateTotal() {
    return this.customer.getDiscountRate() * this.customer.getBaseAmount();
    // Should this method be in Customer class?
  }
}

// Data Clumps (same parameters appear together frequently)
function calculateShipping(weight, dimensions, destination) { }
function calculateTax(weight, dimensions, destination) { }
// Consider: Shipping context object

// Primitive Obsession (using primitives instead of objects)
function validateEmail(email) { } // String primitive
// Consider: Email value object with validation
```

## Refactoring Tools Integration

### IDE Refactoring Support
```json
// VS Code settings for refactoring
{
  "typescript.preferences.includePackageJsonAutoImports": "auto",
  "editor.codeActionsOnSave": {
    "source.organizeImports": true,
    "source.fixAll": true
  },
  "refactoring.extract.constant": true,
  "refactoring.extract.function": true
}
```

### Automated Refactoring Tools
```bash
# JavaScript/TypeScript
npm install -g jscodeshift
jscodeshift -t transform-script.js src/

# Python
pip install rope
# Use rope for automated Python refactoring

# Java
# Use IntelliJ IDEA or Eclipse refactoring tools
```

## Success Criteria
- Code is more maintainable and readable
- All tests continue to pass
- No functionality regression
- Improved code metrics (complexity, duplication)
- Better separation of concerns

Guide systematic refactoring that improves code quality whilst preserving functionality.