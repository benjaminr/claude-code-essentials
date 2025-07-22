---
description: Generate API endpoints, documentation, and client code
argument-hint: [endpoint or API specification]
allowed-tools: Read, Write, MultiEdit, Glob, Grep
---

# API Development Assistant

You are helping develop APIs by generating endpoints, documentation, client code, and ensuring best practices for API design and implementation.

## Input
**API Context**: $ARGUMENTS (endpoint path, OpenAPI spec, or API description)

## Your Task

Provide comprehensive API development support:

1. **API Design** - RESTful endpoint design and structure
2. **Implementation** - Generate server-side code
3. **Documentation** - OpenAPI/Swagger specifications
4. **Client Generation** - SDK and client code
5. **Testing** - API test suites and validation

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
| PUT | `/users/{id}` | Update user | User data | Updated user |
| DELETE | `/users/{id}` | Delete user | Path param | 204 No Content |

## Data Models
[JSON schemas for request/response objects]
```

### 2. API Implementation Examples

#### Express.js REST API
```javascript
// routes/users.js
const express = require('express');
const { body, validationResult, param } = require('express-validator');
const User = require('../models/User');
const auth = require('../middleware/auth');
const router = express.Router();

// GET /api/v1/users - List users with pagination
router.get('/', 
  auth,
  async (req, res) => {
    try {
      const { page = 1, limit = 10, search } = req.query;
      const offset = (page - 1) * limit;
      
      const whereClause = search ? 
        { name: { [Op.iLike]: `%${search}%` } } : {};
      
      const users = await User.findAndCountAll({
        where: whereClause,
        limit: parseInt(limit),
        offset: parseInt(offset),
        attributes: { exclude: ['password'] }
      });
      
      res.json({
        data: users.rows,
        pagination: {
          page: parseInt(page),
          limit: parseInt(limit),
          total: users.count,
          pages: Math.ceil(users.count / limit)
        }
      });
    } catch (error) {
      res.status(500).json({ error: 'Internal server error' });
    }
  }
);

// POST /api/v1/users - Create new user
router.post('/',
  [
    body('email').isEmail().normalizeEmail(),
    body('name').trim().isLength({ min: 2, max: 50 }),
    body('password').isLength({ min: 8 }).matches(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/),
  ],
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ 
        error: 'Validation failed',
        details: errors.array()
      });
    }
    
    try {
      const { email, name, password } = req.body;
      
      // Check if user already exists
      const existingUser = await User.findOne({ where: { email } });
      if (existingUser) {
        return res.status(409).json({ 
          error: 'User already exists' 
        });
      }
      
      const user = await User.create({
        email,
        name,
        password // Will be hashed by model hook
      });
      
      // Remove password from response
      const userResponse = user.toJSON();
      delete userResponse.password;
      
      res.status(201).json({
        data: userResponse,
        message: 'User created successfully'
      });
    } catch (error) {
      res.status(500).json({ error: 'Internal server error' });
    }
  }
);

// GET /api/v1/users/:id - Get specific user
router.get('/:id',
  [
    param('id').isUUID().withMessage('Invalid user ID format')
  ],
  auth,
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ 
        error: 'Validation failed',
        details: errors.array()
      });
    }
    
    try {
      const user = await User.findByPk(req.params.id, {
        attributes: { exclude: ['password'] }
      });
      
      if (!user) {
        return res.status(404).json({ 
          error: 'User not found' 
        });
      }
      
      res.json({ data: user });
    } catch (error) {
      res.status(500).json({ error: 'Internal server error' });
    }
  }
);
```

#### FastAPI (Python) Implementation
```python
# api/routes/users.py
from fastapi import APIRouter, HTTPException, Depends, Query
from sqlalchemy.orm import Session
from typing import List, Optional
from ..database import get_db
from ..models import User
from ..schemas import UserCreate, UserResponse, UserUpdate
from ..auth import get_current_user

router = APIRouter(prefix="/api/v1/users", tags=["users"])

@router.get("/", response_model=List[UserResponse])
async def list_users(
    skip: int = Query(0, ge=0),
    limit: int = Query(10, ge=1, le=100),
    search: Optional[str] = None,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """List users with pagination and optional search."""
    query = db.query(User)
    
    if search:
        query = query.filter(User.name.ilike(f"%{search}%"))
    
    users = query.offset(skip).limit(limit).all()
    return users

@router.post("/", response_model=UserResponse, status_code=201)
async def create_user(
    user: UserCreate,
    db: Session = Depends(get_db)
):
    """Create a new user."""
    # Check if user already exists
    existing_user = db.query(User).filter(User.email == user.email).first()
    if existing_user:
        raise HTTPException(
            status_code=409,
            detail="User with this email already exists"
        )
    
    # Create new user
    db_user = User(**user.dict())
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    
    return db_user

@router.get("/{user_id}", response_model=UserResponse)
async def get_user(
    user_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """Get a specific user by ID."""
    user = db.query(User).filter(User.id == user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return user
```

### 3. OpenAPI/Swagger Documentation

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

### 4. API Client Generation

#### TypeScript Client
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

### 5. API Testing

#### Jest Test Suite
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
- RESTful API design principles followed
- Comprehensive input validation and error handling
- Complete OpenAPI documentation
- Generated client SDKs work correctly
- Full test coverage of API endpoints

Generate robust, well-documented APIs with client SDKs and comprehensive testing.