---
description: Help migrate code between versions or frameworks
argument-hint: [from-version] [to-version] or [migration-type]
allowed-tools: Read, Write, MultiEdit, Glob, Grep, WebSearch, Task
---

# Migration Assistant

You are helping migrate code between versions, frameworks, or patterns, ensuring a smooth transition with minimal breaking changes.

## Input
**Migration Request**: $ARGUMENTS (e.g., "react 17 to 18", "callbacks to async/await", "javascript to typescript")

## Your Task

Guide and execute code migration:

1. **Analyze Current State** - Understand existing code
2. **Plan Migration Path** - Identify changes needed
3. **Execute Migration** - Make necessary changes
4. **Verify Compatibility** - Ensure everything works

## Migration Strategy

### 1. Migration Analysis

```markdown
# 🔄 Migration Plan

## Migration Overview
**Type**: [Version Upgrade/Framework Migration/Pattern Update]
**From**: [Current version/pattern]
**To**: [Target version/pattern]
**Scope**: [X] files affected

## Breaking Changes
🔴 **Critical Changes**:
- [Breaking change 1]
- [Breaking change 2]

🟡 **Deprecations**:
- [Deprecated feature 1]
- [Deprecated feature 2]

## Migration Steps
1. **Preparation** ([X] tasks)
2. **Core Migration** ([Y] tasks)
3. **Testing & Validation** ([Z] tasks)
4. **Cleanup** ([W] tasks)
```

### 2. Common Migration Types

#### Framework Version Upgrades

**React 17 → 18 Example**:
```diff
// Before: React 17
- import React from 'react';
- ReactDOM.render(<App />, document.getElementById('root'));

// After: React 18
+ import React from 'react';
+ import { createRoot } from 'react-dom/client';
+ const root = createRoot(document.getElementById('root'));
+ root.render(<App />);
```

**Changes Required**:
- Update ReactDOM.render calls
- Add Suspense boundaries
- Update concurrent features
- Fix hydration issues

#### JavaScript → TypeScript

```diff
// Before: JavaScript
- function calculateTotal(items) {
-   return items.reduce((sum, item) => sum + item.price, 0);
- }

// After: TypeScript
+ interface Item {
+   price: number;
+   name: string;
+ }
+ 
+ function calculateTotal(items: Item[]): number {
+   return items.reduce((sum, item) => sum + item.price, 0);
+ }
```

**Migration Tasks**:
- Add type definitions
- Configure tsconfig.json
- Update build process
- Fix type errors

#### Callbacks → Async/Await

```diff
// Before: Callbacks
- function fetchData(callback) {
-   api.get('/data', (err, data) => {
-     if (err) return callback(err);
-     processData(data, (err, result) => {
-       if (err) return callback(err);
-       callback(null, result);
-     });
-   });
- }

// After: Async/Await
+ async function fetchData() {
+   try {
+     const data = await api.get('/data');
+     const result = await processData(data);
+     return result;
+   } catch (err) {
+     throw err;
+   }
+ }
```

### 3. Migration Execution

```markdown
## 📋 Migration Progress

### Phase 1: Preparation ✅
- [x] Backup current code
- [x] Update dependencies
- [x] Install migration tools
- [x] Create migration branch

### Phase 2: Core Migration 🚧
#### File: [path/to/file.js]
- [x] Update imports
- [x] Modify syntax
- [ ] Fix type errors
- [ ] Update tests

**Changes Made**:
```diff
[Show actual code changes]
```

### Phase 3: Testing & Validation
- [ ] Run test suite
- [ ] Check for runtime errors
- [ ] Verify functionality
- [ ] Performance testing

### Phase 4: Cleanup
- [ ] Remove old code
- [ ] Update documentation
- [ ] Clean up dependencies
- [ ] Update CI/CD
```

## Migration Patterns

### Database Migrations
```sql
-- Migration: Add user_preferences table
-- Version: 2.0.0
-- Date: 2024-01-15

BEGIN;

CREATE TABLE user_preferences (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  theme VARCHAR(50) DEFAULT 'light',
  notifications BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Migrate existing data
INSERT INTO user_preferences (user_id)
SELECT id FROM users;

COMMIT;
```

### API Version Migration
```javascript
// API Adapter for gradual migration
class APIAdapter {
  async fetchUser(id) {
    if (this.useV2) {
      // New API structure
      const response = await fetch(`/api/v2/users/${id}`);
      return this.transformV2Response(response);
    } else {
      // Old API structure
      const response = await fetch(`/api/v1/user?id=${id}`);
      return this.transformV1Response(response);
    }
  }
}
```

### Configuration Migration
```diff
// Old config format
- {
-   "server": {
-     "host": "localhost",
-     "port": 3000
-   }
- }

// New config format
+ {
+   "app": {
+     "server": {
+       "host": "localhost",
+       "port": 3000,
+       "protocol": "http"
+     },
+     "features": {
+       "auth": true,
+       "api": true
+     }
+   }
+ }
```

## Rollback Plan

```markdown
## 🔙 Rollback Procedure

If migration fails:

1. **Immediate Actions**
   ```bash
   git checkout main
   git branch -D migration-branch
   ```

2. **Restore Dependencies**
   ```bash
   git checkout package-lock.json
   npm install
   ```

3. **Database Rollback**
   ```sql
   -- Rollback script
   DROP TABLE IF EXISTS new_table;
   ALTER TABLE old_table ...;
   ```

4. **Notify Team**
   - Update status in project channel
   - Document issues encountered
```

## Post-Migration

### Verification Checklist
- [ ] All tests passing
- [ ] No console errors
- [ ] Performance acceptable
- [ ] Features working
- [ ] Documentation updated

### Team Communication
```markdown
## Migration Complete! 🎉

**What Changed**:
- [Summary of changes]

**Action Required**:
- Pull latest changes
- Run `npm install`
- Update local .env file

**New Features**:
- [New capabilities]

**Deprecated**:
- [What to avoid]
```

## Success Criteria
- Code successfully migrated
- All tests passing
- No functionality lost
- Performance maintained or improved
- Documentation updated

Guide through the migration process with clear steps and safety measures.