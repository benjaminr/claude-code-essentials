---
description: Create new APIs from description or improve existing APIs with best practices
argument-hint: [API description] or [path to existing API code]
allowed-tools: Read, Write, MultiEdit, Glob, Grep, Task
---

# API Development Assistant

You are helping create new APIs from descriptions or improve existing APIs by applying industry best practices for design, security, performance, and maintainability.

## Input
**API Request**: $ARGUMENTS 
- **New API**: High-level description (e.g., "user management API with authentication", "e-commerce product catalog API")
- **Existing API**: File path or directory path to existing API code to improve

## Your Approach

### For New API Creation:
1. **Understand Requirements** - Parse the API description and identify core resources and operations
2. **Design Resources** - Create RESTful resource structure following best practices
3. **Generate Implementation** - Create FastAPI implementation with security, validation, and performance optimisations
4. **Add Documentation** - Generate comprehensive OpenAPI documentation
5. **Include Testing** - Provide test examples and validation strategies

### For Existing API Improvement:
1. **Analyse Current Code** - Read and understand existing API structure
2. **Identify Issues** - Check against industry best practices and identify improvement areas
3. **Apply Best Practices** - Refactor code to follow proper API design principles
4. **Enhance Security** - Add authentication, validation, and rate limiting where needed
5. **Improve Performance** - Add caching, pagination, and optimisation patterns
6. **Update Documentation** - Ensure OpenAPI docs reflect improvements

## Usage Examples

### Creating New API from Description
```
/api "task management API with user authentication, projects, and team collaboration"
/api "real-time chat API with rooms, messages, and user presence"
/api "inventory management system with products, categories, and stock tracking"
```

### Improving Existing API
```
/api ./src/api/users.py
/api ./backend/routes/
/api ./app/controllers/ProductController.js
```

## Your Task

Provide comprehensive API development support:

1. **Resource Analysis** - Identify core resources and relationships from description or existing code
2. **Best Practice Application** - Apply industry-standard API design principles
3. **Secure Implementation** - Include authentication, authorisation, and input validation
4. **Performance Optimization** - Add caching, pagination, and efficient data handling
5. **Comprehensive Documentation** - Generate clear OpenAPI specifications with examples
6. **Testing Strategy** - Provide test examples and validation approaches
7. **Developer Experience** - Ensure APIs are easy to understand and hard to misuse

## Implementation Strategy

### Detecting Input Type
1. **File/Directory Path**: If argument contains `/`, `\`, or ends with common file extensions (`.py`, `.js`, `.ts`, etc.)
   - Use Read/Glob tools to analyse existing code
   - Identify current API patterns and issues
   - Apply improvements incrementally

2. **API Description**: If argument is descriptive text
   - Parse requirements and identify core resources
   - Design from scratch following best practices
   - Generate complete implementation with examples

### For New API Development:
- Start with resource identification and relationship mapping
- Follow RESTful design principles strictly
- Include comprehensive error handling from the start
- Implement security measures (authentication, rate limiting)
- Generate OpenAPI documentation automatically
- Provide testing examples and patterns

### For Existing API Improvement:
- Analyse current structure and identify anti-patterns
- Suggest specific improvements with before/after examples
- Preserve existing functionality while enhancing design
- Add missing security, validation, or performance features
- Update or create documentation to match improvements
- Provide migration strategies for breaking changes

## Core API Design Principles

### 1. Resource-Oriented Design
**Design around resources (nouns) not actions (verbs)**
- Use plural nouns for collections: `/users`, `/orders`, `/products`
- Create clear resource hierarchies: `/users/123/orders`
- Make URLs self-explanatory and readable
- Focus on what the resource represents, not what you do with it

```
✅ Good Resource Design:
/users                    # Collection of users
/users/123               # Specific user
/users/123/orders        # User's orders
/orders/456/items        # Order line items

❌ Poor Resource Design:
/getUsers               # Action-oriented
/createOrder            # Verb-based
/user-management        # Unclear resource
```

### 2. HTTP Method Semantics
**Use standard HTTP methods with their intended meaning**
- **GET**: Retrieve data (safe, idempotent, cacheable)
- **POST**: Create new resources or non-idempotent operations
- **PUT**: Replace entire resource (idempotent)
- **PATCH**: Partial updates
- **DELETE**: Remove resource (idempotent)

### 3. Meaningful HTTP Status Codes
**Use standard status codes to communicate outcomes clearly**

**Success (2xx):**
- `200 OK` - Successful GET, PUT, PATCH
- `201 Created` - Successful POST creating new resource
- `202 Accepted` - Request accepted for async processing
- `204 No Content` - Successful DELETE or update with no response body

**Client Errors (4xx):**
- `400 Bad Request` - Malformed request syntax
- `401 Unauthorized` - Missing or invalid authentication
- `403 Forbidden` - Authenticated but insufficient permissions
- `404 Not Found` - Resource doesn't exist
- `409 Conflict` - Resource state conflict
- `422 Unprocessable Entity` - Valid syntax but business logic failure
- `429 Too Many Requests` - Rate limit exceeded

**Server Errors (5xx):**
- `500 Internal Server Error` - Unexpected server fault
- `503 Service Unavailable` - Temporary server unavailability

### 4. Stateless Design
**Each request must be independent and self-contained**
- Include all necessary context in each request
- Don't rely on server-side session state
- Use tokens/headers for authentication state
- Make requests reproducible and cacheable

### 5. Consistent Error Response Format
**Provide clear, actionable error information**
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Request validation failed",
    "details": [
      {
        "field": "email",
        "message": "Invalid email format",
        "code": "INVALID_FORMAT"
      }
    ],
    "timestamp": "2024-01-15T10:30:00Z",
    "request_id": "550e8400-e29b-41d4-a716-446655440000"
  }
}
```

### 6. API Versioning Strategy
**Plan for evolution from day one**

**URL Path Versioning (Recommended):**
```
/api/v1/users
/api/v2/users
```

**Header Versioning (Alternative):**
```
API-Version: 1.0
Accept: application/vnd.myapi.v1+json
```

### 7. Pagination and Filtering
**Handle large datasets efficiently**
- Implement pagination for collections
- Use cursor-based pagination for performance at scale
- Support filtering with query parameters
- Provide clear pagination metadata
- Set reasonable default and maximum limits

### 8. Content Negotiation
**Support multiple data formats when appropriate**
- Use `Accept` header for response format
- Use `Content-Type` header for request format
- Default to JSON for modern APIs
- Consider supporting JSON, XML, or other formats as needed

## API Development Framework

### 1. RESTful API Design

```markdown
# 🔌 API Development Plan

## API Overview
**Service**: [API name and purpose]
**Base URL**: `/api/v1`
**Authentication**: [Bearer Token/API Key/OAuth2]
**Data Format**: JSON

## Resource Design
### [Resource Name] (e.g., Users)
| Method | Endpoint | Purpose | Request | Response |
|--------|----------|---------|---------|----------|
| GET | `/users` | List users | Query params | User array |
| GET | `/users/{id}` | Get specific user | Path param | User object |
| POST | `/users` | Create user | User data | Created user |
| PUT | `/users/{id}` | Full update | User data | Updated user |
| PATCH | `/users/{id}` | Partial update | Partial data | Updated user |
| DELETE | `/users/{id}` | Delete user | Path param | 204 No Content |

## Data Models
[JSON schemas for request/response objects]
```

### 2. API Security Best Practices

#### Authentication & Rate Limiting (FastAPI)
```python
from fastapi import FastAPI, Depends, HTTPException, status, Request
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from slowapi import Limiter, _rate_limit_exceeded_handler
from slowapi.util import get_remote_address
import jwt
import os
from datetime import datetime, timedelta

# Rate limiting setup
limiter = Limiter(key_func=get_remote_address)
app = FastAPI()
app.state.limiter = limiter
app.add_exception_handler(429, _rate_limit_exceeded_handler)

# Security scheme
security = HTTPBearer()

# JWT configuration
JWT_SECRET = os.getenv("JWT_SECRET")
JWT_ALGORITHM = "HS256"
JWT_EXPIRATION = timedelta(hours=24)

async def verify_token(credentials: HTTPAuthorizationCredentials = Depends(security)):
    """Verify JWT token and return user data."""
    token = credentials.credentials
    
    try:
        payload = jwt.decode(token, JWT_SECRET, algorithms=[JWT_ALGORITHM])
        user_id = payload.get("sub")
        
        if not user_id:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="Invalid authentication credentials"
            )
        
        # Verify user still exists and is active
        user = await get_user(user_id)
        if not user or not user.is_active:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="User not found or inactive"
            )
        
        return user
        
    except jwt.ExpiredSignatureError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Token has expired"
        )
    except jwt.JWTError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid token"
        )

# Apply rate limiting to endpoints
@app.post("/api/v1/auth/login")
@limiter.limit("5/minute")
async def login(request: Request, credentials: LoginRequest):
    """Authenticate user and return JWT token."""
    user = await authenticate_user(credentials.email, credentials.password)
    
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect email or password"
        )
    
    # Create JWT token
    token_data = {
        "sub": str(user.id),
        "exp": datetime.utcnow() + JWT_EXPIRATION,
        "iat": datetime.utcnow()
    }
    
    token = jwt.encode(token_data, JWT_SECRET, algorithm=JWT_ALGORITHM)
    
    return {
        "access_token": token,
        "token_type": "bearer",
        "expires_in": int(JWT_EXPIRATION.total_seconds())
    }
```

### 3. API Implementation Examples

#### FastAPI REST API with Best Practices
```python
# api/routes/users.py
from fastapi import APIRouter, HTTPException, Depends, Query, status, BackgroundTasks
from sqlalchemy.orm import Session
from typing import Optional
from uuid import UUID
import logging

from ..database import get_db
from ..models import User
from ..schemas import (
    UserCreate, UserResponse, UserUpdate, 
    PaginatedResponse, ErrorResponse
)
from ..auth import verify_token
from ..cache import cache_key_wrapper

router = APIRouter(prefix="/api/v1/users", tags=["users"])
logger = logging.getLogger(__name__)

# Dependency for cursor pagination
async def get_pagination_params(
    cursor: Optional[str] = None,
    limit: int = Query(20, ge=1, le=100, description="Number of items to return")
):
    return {"cursor": cursor, "limit": limit}

@router.get(
    "/",
    response_model=PaginatedResponse[UserResponse],
    responses={
        200: {"description": "List of users"},
        401: {"model": ErrorResponse, "description": "Unauthorized"},
        429: {"description": "Rate limit exceeded"}
    }
)
@limiter.limit("100/minute")
async def list_users(
    pagination: dict = Depends(get_pagination_params),
    search: Optional[str] = Query(None, min_length=3, description="Search by name or email"),
    is_active: Optional[bool] = Query(None, description="Filter by active status"),
    db: Session = Depends(get_db),
    current_user: User = Depends(verify_token)
):
    """List users with cursor-based pagination and optional filtering."""
    try:
        query = db.query(User)
        
        # Apply filters
        if search:
            query = query.filter(
                User.name.ilike(f"%{search}%") | 
                User.email.ilike(f"%{search}%")
            )
        
        if is_active is not None:
            query = query.filter(User.is_active == is_active)
        
        # Apply cursor pagination
        if pagination["cursor"]:
            query = query.filter(User.id > pagination["cursor"])
        
        # Fetch one extra to check if there are more results
        users = query.order_by(User.id).limit(pagination["limit"] + 1).all()
        
        has_more = len(users) > pagination["limit"]
        if has_more:
            users = users[:-1]  # Remove the extra item
        
        next_cursor = str(users[-1].id) if users and has_more else None
        
        return PaginatedResponse(
            data=users,
            pagination={
                "cursor": next_cursor,
                "has_more": has_more,
                "count": len(users)
            }
        )
        
    except Exception as e:
        logger.error(f"Error listing users: {str(e)}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Internal server error"
        )

@router.post(
    "/",
    response_model=UserResponse,
    status_code=status.HTTP_201_CREATED,
    responses={
        201: {"description": "User created successfully"},
        400: {"model": ErrorResponse, "description": "Validation error"},
        409: {"model": ErrorResponse, "description": "User already exists"}
    }
)
async def create_user(
    user_data: UserCreate,
    background_tasks: BackgroundTasks,
    db: Session = Depends(get_db)
):
    """Create a new user with email verification."""
    # Validate email uniqueness
    if db.query(User).filter(User.email == user_data.email).first():
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail=ErrorResponse(
                error={
                    "code": "USER_EXISTS",
                    "message": "User with this email already exists",
                    "field": "email"
                }
            ).dict()
        )
    
    try:
        # Create user with hashed password
        user = User(
            **user_data.dict(exclude={"password"}),
            hashed_password=hash_password(user_data.password)
        )
        
        db.add(user)
        db.commit()
        db.refresh(user)
        
        # Send welcome email in background
        background_tasks.add_task(
            send_welcome_email,
            user.email,
            user.name
        )
        
        logger.info(f"Created new user: {user.id}")
        return user
        
    except Exception as e:
        db.rollback()
        logger.error(f"Error creating user: {str(e)}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Failed to create user"
        )

@router.get(
    "/{user_id}",
    response_model=UserResponse,
    responses={
        200: {"description": "User details"},
        404: {"model": ErrorResponse, "description": "User not found"}
    }
)
@cache_key_wrapper("user", expire=300)  # Cache for 5 minutes
async def get_user(
    user_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(verify_token)
):
    """Get a specific user by ID with caching."""
    user = db.query(User).filter(User.id == user_id).first()
    
    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=ErrorResponse(
                error={
                    "code": "USER_NOT_FOUND",
                    "message": f"User {user_id} not found"
                }
            ).dict()
        )
    
    return user

@router.patch(
    "/{user_id}",
    response_model=UserResponse,
    responses={
        200: {"description": "User updated"},
        403: {"model": ErrorResponse, "description": "Forbidden"},
        404: {"model": ErrorResponse, "description": "User not found"}
    }
)
async def update_user(
    user_id: UUID,
    user_update: UserUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(verify_token)
):
    """Update user details (partial update)."""
    # Check permissions
    if current_user.id != user_id and not current_user.is_admin:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Cannot update other users"
        )
    
    user = db.query(User).filter(User.id == user_id).first()
    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="User not found"
        )
    
    # Update only provided fields
    update_data = user_update.dict(exclude_unset=True)
    for field, value in update_data.items():
        setattr(user, field, value)
    
    user.updated_at = datetime.utcnow()
    
    try:
        db.commit()
        db.refresh(user)
        
        # Invalidate cache
        await invalidate_cache(f"user:{user_id}")
        
        return user
        
    except Exception as e:
        db.rollback()
        logger.error(f"Error updating user {user_id}: {str(e)}")
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Failed to update user"
        )
```

#### Performance Optimisation with FastAPI
```python
# api/middleware/performance.py
from fastapi import Request, Response
from starlette.middleware.base import BaseHTTPMiddleware
import hashlib
import json
import time
from typing import Callable

class CacheMiddleware(BaseHTTPMiddleware):
    """HTTP caching middleware with ETags."""
    
    async def dispatch(self, request: Request, call_next: Callable) -> Response:
        # Only cache GET requests
        if request.method != "GET":
            return await call_next(request)
        
        # Generate cache key
        cache_key = f"{request.url.path}:{request.url.query}"
        
        # Check if client has cached version
        if_none_match = request.headers.get("if-none-match")
        
        # Process request
        response = await call_next(request)
        
        # Only cache successful responses
        if response.status_code == 200:
            # Read response body
            body = b""
            async for chunk in response.body_iterator:
                body += chunk
            
            # Generate ETag
            etag = hashlib.md5(body).hexdigest()
            
            # Check if content hasn't changed
            if if_none_match == f'"{etag}"':
                return Response(status_code=304)
            
            # Set cache headers
            headers = dict(response.headers)
            headers["ETag"] = f'"{etag}"'
            headers["Cache-Control"] = "private, max-age=300"
            
            return Response(
                content=body,
                status_code=response.status_code,
                headers=headers,
                media_type=response.media_type
            )
        
        return response

# Add compression
from starlette.middleware.gzip import GZipMiddleware

app.add_middleware(GZipMiddleware, minimum_size=1000)
app.add_middleware(CacheMiddleware)
```

### 4. OpenAPI/Swagger Documentation with FastAPI

```yaml
openapi: 3.0.0
info:
  title: User Management API
  version: 1.0.0
  description: RESTful API for user management
servers:
  - url: https://api.example.com/v1

paths:
  /users:
    get:
      summary: List users
      tags: [Users]
      parameters:
        - name: page
          in: query
          schema:
            type: integer
            minimum: 1
            default: 1
        - name: limit
          in: query
          schema:
            type: integer
            minimum: 1
            maximum: 100
            default: 10
        - name: search
          in: query
          schema:
            type: string
          description: Search users by name
      responses:
        '200':
          description: List of users
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    type: array
                    items:
                      $ref: '#/components/schemas/User'
                  pagination:
                    $ref: '#/components/schemas/Pagination'
    
    post:
      summary: Create user
      tags: [Users]
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/CreateUserRequest'
      responses:
        '201':
          description: User created
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    $ref: '#/components/schemas/User'

  /users/{userId}:
    get:
      summary: Get user by ID
      tags: [Users]
      parameters:
        - name: userId
          in: path
          required: true
          schema:
            type: string
            format: uuid
      responses:
        '200':
          description: User details
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    $ref: '#/components/schemas/User'
        '404':
          description: User not found

components:
  schemas:
    User:
      type: object
      properties:
        id:
          type: string
          format: uuid
        email:
          type: string
          format: email
        name:
          type: string
        createdAt:
          type: string
          format: date-time
        updatedAt:
          type: string
          format: date-time
    
    CreateUserRequest:
      type: object
      required: [email, name, password]
      properties:
        email:
          type: string
          format: email
        name:
          type: string
          minLength: 2
          maxLength: 50
        password:
          type: string
          minLength: 8
    
    Pagination:
      type: object
      properties:
        page:
          type: integer
        limit:
          type: integer
        total:
          type: integer
        pages:
          type: integer

  securitySchemes:
    BearerAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT

security:
  - BearerAuth: []
```

### 5. API Client Generation

#### Auto-generated TypeScript Client from FastAPI
```typescript
// generated/api-client.ts
export interface User {
  id: string;
  email: string;
  name: string;
  createdAt: string;
  updatedAt: string;
}

export interface CreateUserRequest {
  email: string;
  name: string;
  password: string;
}

export interface ApiResponse<T> {
  data: T;
  message?: string;
}

export interface PaginatedResponse<T> {
  data: T[];
  pagination: {
    page: number;
    limit: number;
    total: number;
    pages: number;
  };
}

export class UserApiClient {
  constructor(private baseUrl: string, private apiKey: string) {}
  
  async getUsers(params?: {
    page?: number;
    limit?: number;
    search?: string;
  }): Promise<PaginatedResponse<User>> {
    const searchParams = new URLSearchParams();
    if (params?.page) searchParams.set('page', params.page.toString());
    if (params?.limit) searchParams.set('limit', params.limit.toString());
    if (params?.search) searchParams.set('search', params.search);
    
    const response = await fetch(
      `${this.baseUrl}/users?${searchParams}`,
      {
        headers: {
          'Authorization': `Bearer ${this.apiKey}`,
          'Content-Type': 'application/json'
        }
      }
    );
    
    if (!response.ok) {
      throw new Error(`API Error: ${response.status}`);
    }
    
    return response.json();
  }
  
  async createUser(userData: CreateUserRequest): Promise<ApiResponse<User>> {
    const response = await fetch(`${this.baseUrl}/users`, {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${this.apiKey}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(userData)
    });
    
    if (!response.ok) {
      const error = await response.json();
      throw new Error(error.error || `API Error: ${response.status}`);
    }
    
    return response.json();
  }
  
  async getUser(userId: string): Promise<ApiResponse<User>> {
    const response = await fetch(`${this.baseUrl}/users/${userId}`, {
      headers: {
        'Authorization': `Bearer ${this.apiKey}`,
        'Content-Type': 'application/json'
      }
    });
    
    if (!response.ok) {
      if (response.status === 404) {
        throw new Error('User not found');
      }
      throw new Error(`API Error: ${response.status}`);
    }
    
    return response.json();
  }
}

// Usage example
const apiClient = new UserApiClient('https://api.example.com/v1', 'your-api-key');

// List users
const users = await apiClient.getUsers({ page: 1, limit: 10 });

// Create user
const newUser = await apiClient.createUser({
  email: 'john@example.com',
  name: 'John Doe',
  password: 'SecurePass123'
});
```

### 6. API Testing

#### Pytest with FastAPI
```javascript
// tests/api/users.test.js
const request = require('supertest');
const app = require('../../app');
const { User } = require('../../models');

describe('Users API', () => {
  beforeEach(async () => {
    await User.destroy({ where: {} }); // Clear users table
  });
  
  describe('POST /api/v1/users', () => {
    it('should create a new user with valid data', async () => {
      const userData = {
        email: 'test@example.com',
        name: 'Test User',
        password: 'SecurePass123'
      };
      
      const response = await request(app)
        .post('/api/v1/users')
        .send(userData)
        .expect(201);
      
      expect(response.body.data).toHaveProperty('id');
      expect(response.body.data.email).toBe(userData.email);
      expect(response.body.data.name).toBe(userData.name);
      expect(response.body.data).not.toHaveProperty('password');
    });
    
    it('should return 400 for invalid email', async () => {
      const userData = {
        email: 'invalid-email',
        name: 'Test User',
        password: 'SecurePass123'
      };
      
      const response = await request(app)
        .post('/api/v1/users')
        .send(userData)
        .expect(400);
      
      expect(response.body.error).toBe('Validation failed');
      expect(response.body.details).toHaveLength(1);
    });
    
    it('should return 409 for duplicate email', async () => {
      const userData = {
        email: 'test@example.com',
        name: 'Test User',
        password: 'SecurePass123'
      };
      
      // Create first user
      await User.create(userData);
      
      // Try to create duplicate
      const response = await request(app)
        .post('/api/v1/users')
        .send(userData)
        .expect(409);
      
      expect(response.body.error).toBe('User already exists');
    });
  });
  
  describe('GET /api/v1/users', () => {
    it('should return paginated list of users', async () => {
      // Create test users
      await Promise.all([
        User.create({ email: 'user1@test.com', name: 'User 1', password: 'pass123' }),
        User.create({ email: 'user2@test.com', name: 'User 2', password: 'pass123' }),
        User.create({ email: 'user3@test.com', name: 'User 3', password: 'pass123' })
      ]);
      
      const response = await request(app)
        .get('/api/v1/users')
        .query({ page: 1, limit: 2 })
        .expect(200);
      
      expect(response.body.data).toHaveLength(2);
      expect(response.body.pagination.total).toBe(3);
      expect(response.body.pagination.pages).toBe(2);
    });
  });
});
```

## Success Criteria
- ✅ **Resource-oriented design** with clear, intuitive URLs
- ✅ **Proper HTTP semantics** using methods and status codes correctly
- ✅ **Stateless interactions** with self-contained requests
- ✅ **Consistent error handling** with actionable error messages
- ✅ **API versioning strategy** implemented from the start
- ✅ **Efficient data handling** with pagination and filtering
- ✅ **Developer-friendly documentation** with clear examples
- ✅ **Performance considerations** including caching and async operations
- ✅ **Security best practices** with proper authentication and validation
- ✅ **Comprehensive testing** covering functionality and contracts
- ✅ **Type safety and validation** using modern frameworks
- ✅ **Monitoring and observability** for production readiness

Create APIs that are **easy to understand, hard to misuse, and built for scale** using industry best practices and modern development patterns.