---
description: Trace execution paths and data flow through the codebase
argument-hint: [flow description] or [entry point function/file]
allowed-tools: Read, Grep, Glob, Task, LS
---

# Trace Execution Flow

You are tracing execution paths through the codebase to help developers understand how data flows through the system and which components are involved in specific operations.

## Input
**Trace Request**: $ARGUMENTS
- **Flow Description**: High-level flow (e.g., "user login flow", "payment processing")
- **Entry Point**: Specific function or file to start tracing from
- **Data Flow**: Track specific data through system (e.g., "user object transformation")

## Your Task

Trace the complete execution path:

1. **Identify Entry Point** - Find where the flow begins
2. **Follow Execution Path** - Track function calls across files
3. **Map Data Transformations** - Show how data changes through the flow
4. **Identify Side Effects** - Database writes, API calls, events triggered
5. **Visualise Flow** - Create clear flow diagram

## Tracing Strategy

### 1. Entry Point Discovery
- Search for route handlers, event listeners, or main functions
- Identify initial data input format
- Find authentication/middleware layers

### 2. Call Chain Analysis
- Follow function calls depth-first
- Track both synchronous and asynchronous flows
- Note branching logic and conditions
- Identify loops and recursion

### 3. Cross-File Tracking
- Trace imports and exports
- Follow service/module boundaries
- Map API calls between services
- Track event emissions and handlers

## Output Format

```markdown
# 🔍 Execution Flow Trace

## Flow Overview
**Flow**: [Flow name/description]
**Entry Point**: `[file:line]` - [function/route]
**Exit Points**: [List of possible endpoints]
**Total Files Involved**: [Count]

## Visual Flow Diagram
```
┌─────────────────┐
│   HTTP Request  │ GET /api/login
│  (Entry Point)  │ {email, password}
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Middleware    │ validateRequest()
│  auth.js:15     │ ├─ Check headers
└────────┬────────┘ └─ Parse body
         │
         ▼
┌─────────────────┐
│   Controller    │ loginController()
│ login.js:42     │ ├─ Validate input
└────────┬────────┘ └─ Call service
         │
    ┌────┴────┐
    ▼         ▼
┌─────────┐ ┌─────────┐
│ Success │ │ Failure │
│ Path    │ │ Path    │
└─────────┘ └─────────┘
```

## Detailed Trace

### Step 1: Entry Point
**File**: `[routes/auth.js:25]`
**Function**: `router.post('/login', ...)`
**Receives**: 
```json
{
  "email": "string",
  "password": "string"
}
```

### Step 2: Input Validation
**File**: `[middleware/validation.js:10]`
**Function**: `validateLoginInput(req, res, next)`
**Actions**:
- Validates email format
- Checks password length
- Sanitises input
**Transforms**: Raw input → Validated input

### Step 3: Business Logic
**File**: `[services/authService.js:45]`
**Function**: `authenticateUser(email, password)`
**Actions**:
- Query database for user
- Verify password hash
- Generate JWT token
**Side Effects**:
- Database read: `users` table
- Cache write: Session data

### Step 4: Response Generation
**File**: `[controllers/authController.js:78]`
**Returns**:
```json
{
  "token": "jwt...",
  "user": { "id", "email", "role" }
}
```

## Data Transformation Timeline

```
1. Raw Input          │ {email: "user@example.com", password: "raw"}
   ↓ Validation       │
2. Validated Input    │ {email: "user@example.com", password: "raw"}
   ↓ Service Layer    │
3. User Object        │ {id: 123, email: "...", hashedPassword: "..."}
   ↓ Authentication   │
4. Session Object     │ {userId: 123, token: "jwt...", expiry: "..."}
   ↓ Response Format  │
5. API Response       │ {token: "jwt...", user: {id, email, role}}
```

## Dependencies & External Calls

### Database Queries
1. **User Lookup** - `[authService.js:52]`
   ```sql
   SELECT * FROM users WHERE email = $1
   ```

2. **Session Creation** - `[sessionService.js:23]`
   ```sql
   INSERT INTO sessions (user_id, token, expires_at)
   ```

### External Services
- **Redis Cache**: Session storage at `[cache/redis.js:15]`
- **Email Service**: Welcome email at `[services/email.js:89]`

### Event Emissions
- `user.login.success` → Analytics service
- `session.created` → Audit log

## Error Paths

### Path 1: Invalid Credentials
```
loginController() → authService.authenticate() 
                 → throw AuthError
                 → errorHandler() → 401 Response
```

### Path 2: Database Error
```
authService() → database.query()
             → catch DBError
             → logger.error()
             → 500 Response
```

## Performance Considerations

### Bottlenecks Identified
1. **Database Query** - No index on email field
2. **Password Hashing** - Synchronous bcrypt operation
3. **Session Creation** - Multiple Redis calls

### Optimisation Opportunities
- Add database index on `users.email`
- Use async bcrypt operations
- Batch Redis operations

## Related Flows
- **Logout Flow**: Reverses session creation
- **Password Reset**: Similar validation, different path
- **OAuth Login**: Alternative authentication path

## Testing Entry Points
To test this flow:
```bash
# Unit test entry
npm test -- auth.test.js

# Integration test
curl -X POST http://localhost:3000/api/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"test123"}'
```
```

## Advanced Tracing Features

### Async Flow Tracking
- Promise chains and async/await paths
- Parallel execution branches
- Event loop considerations

### Conditional Path Analysis
- Branch coverage visualisation
- Condition evaluation points
- Edge case identification

### Cross-Service Tracing
- Microservice communication
- API gateway routing
- Message queue flows

## Success Criteria
- Complete execution path mapped
- All files and functions identified
- Data transformations documented
- Side effects catalogued
- Performance bottlenecks highlighted
- Error paths traced
- Clear visual representation provided

Trace the execution flow to provide developers with a comprehensive understanding of how their code executes.