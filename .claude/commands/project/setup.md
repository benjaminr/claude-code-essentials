---
description: Set up development environment and project configuration
argument-hint: [project description or empty for interactive mode]
allowed-tools: Read, Write, Bash, Glob, TodoWrite
---

# Setup Development Environment

You are helping set up a development environment with all necessary dependencies, configurations, and tools for productive development. You support both simple projects and complex monorepo setups, with interactive guidance when needed.

## Your Task

Set up a complete development environment based on project needs:

1. **Interactive Mode** - If no description provided, ask key questions
2. **Detect Project Structure** - Identify monorepo, languages, frameworks
3. **Install Dependencies** - Set up package managers and dependencies
4. **Configure Environment** - Create config files, Docker setup, env vars
5. **Set Up Tooling** - Pre-commit hooks, testing, CI/CD
6. **Verify Setup** - Ensure everything works correctly

## Setup Process

### 1. Interactive Project Analysis

If no description provided, ask these questions:
```markdown
# 🔧 Project Setup Questions

1. **Project Type**: What are you building?
   - [ ] Web Application (Frontend + Backend)
   - [ ] API Service (REST/GraphQL)
   - [ ] CLI Tool
   - [ ] Library/Package
   - [ ] Monorepo (Multiple services)
   - [ ] Other: ___________

2. **Languages**: Which languages will you use? (select all)
   - [ ] Python
   - [ ] JavaScript/TypeScript
   - [ ] Go
   - [ ] Java
   - [ ] Other: ___________

3. **Infrastructure**: How will you deploy?
   - [ ] Docker containers
   - [ ] Kubernetes
   - [ ] Serverless (Lambda/Vercel)
   - [ ] Traditional server
   - [ ] Not sure yet

4. **Key Features**: What do you need? (select all)
   - [ ] Database (PostgreSQL/MySQL/MongoDB)
   - [ ] Authentication/Authorization
   - [ ] API Documentation
   - [ ] Background jobs/queues
   - [ ] Real-time features (WebSockets)
   - [ ] File storage (S3/local)
```

### 2. Project Structure Detection
```python
def analyze_project_structure():
    """Detect project type and structure."""
    structure = {
        'type': 'unknown',
        'languages': [],
        'monorepo': False,
        'services': []
    }
    
    # Check for monorepo indicators
    if Path('lerna.json').exists() or Path('pnpm-workspace.yaml').exists():
        structure['monorepo'] = True
        structure['type'] = 'javascript-monorepo'
    elif Path('services/').exists() or Path('packages/').exists():
        structure['monorepo'] = True
        
    # Detect languages and frameworks
    for root, dirs, files in os.walk('.'):
        if 'node_modules' in dirs:
            dirs.remove('node_modules')
        if '.venv' in dirs:
            dirs.remove('.venv')
            
        for file in files:
            if file == 'package.json':
                structure['languages'].append('javascript')
            elif file in ['requirements.txt', 'pyproject.toml', 'setup.py']:
                structure['languages'].append('python')
            elif file == 'go.mod':
                structure['languages'].append('go')
            elif file == 'Cargo.toml':
                structure['languages'].append('rust')
                
    return structure
```

### 3. Environment Setup

#### Monorepo Setup
```bash
# For JavaScript monorepo
if [ -f "pnpm-workspace.yaml" ]; then
    pnpm install
elif [ -f "lerna.json" ]; then
    npm install
    npx lerna bootstrap
fi

# For Python monorepo with multiple services
if [ -d "services" ]; then
    for service in services/*/; do
        if [ -f "$service/pyproject.toml" ]; then
            echo "Setting up Python service: $service"
            cd "$service"
            uv venv .venv
            source .venv/bin/activate
            uv pip install -e .
            cd -
        fi
    done
fi
```

#### Python Project Setup (using UV)
```bash
# Modern Python setup with UV
if [ -f "pyproject.toml" ] || [ -f "requirements.txt" ]; then
    # Create virtual environment with UV
    uv venv .venv
    source .venv/bin/activate  # or .venv\Scripts\activate on Windows
    
    # Install dependencies
    if [ -f "pyproject.toml" ]; then
        uv pip install -e ".[dev]"
    elif [ -f "requirements.txt" ]; then
        uv pip install -r requirements.txt
        [ -f "requirements-dev.txt" ] && uv pip install -r requirements-dev.txt
    fi
    
    # Install pre-commit hooks
    uv pip install pre-commit
    pre-commit install
fi
```

#### Environment Variables
Create `.env.example`:
```bash
# Application
APP_ENV=development
APP_PORT=3000
APP_URL=http://localhost:3000

# Database
DB_HOST=localhost
DB_PORT=5432
DB_NAME=myapp_dev
DB_USER=
DB_PASSWORD=

# API Keys (obtain from respective services)
API_KEY=
SECRET_KEY=

# Features
ENABLE_DEBUG=true
LOG_LEVEL=debug
```

Create `.env` from template:
```bash
cp .env.example .env
# Edit .env with your values
```

#### Docker Configuration

**Multi-Service Docker Compose** (`docker-compose.yml`):
```yaml
version: '3.8'

services:
  # Python API Service
  api:
    build:
      context: ./services/api
      dockerfile: Dockerfile
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/appdb
      - REDIS_URL=redis://redis:6379
    ports:
      - "8000:8000"
    volumes:
      - ./services/api:/app
    depends_on:
      - db
      - redis
    command: uvicorn main:app --reload --host 0.0.0.0

  # Frontend Service
  frontend:
    build:
      context: ./services/frontend
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    volumes:
      - ./services/frontend:/app
      - /app/node_modules
    environment:
      - API_URL=http://api:8000

  # Database
  db:
    image: postgres:15-alpine
    environment:
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=pass
      - POSTGRES_DB=appdb
    volumes:
      - postgres_data:/var/lib/postgresql/data
    ports:
      - "5432:5432"

  # Cache
  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

volumes:
  postgres_data:
```

**Python Service Dockerfile**:
```dockerfile
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY pyproject.toml .
RUN pip install --no-cache-dir uv && \
    uv pip install --system .

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

**Git Configuration** (`.gitignore`):
```
# Dependencies
node_modules/
vendor/
.venv/

# Environment
.env
.env.local

# Build outputs
dist/
build/
*.pyc

# IDE
.vscode/
.idea/
*.swp

# OS
.DS_Store
Thumbs.db

# Logs
*.log
logs/

# Testing
coverage/
.coverage
```

### 4. Development Scripts and Tooling

**Makefile for Common Commands**:
```makefile
.PHONY: help install dev test lint format clean docker-up docker-down

help:
	@echo "Available commands:"
	@echo "  make install    - Install all dependencies"
	@echo "  make dev        - Start development servers"
	@echo "  make test       - Run all tests"
	@echo "  make lint       - Run linters"
	@echo "  make format     - Format code"
	@echo "  make docker-up  - Start Docker services"
	@echo "  make docker-down - Stop Docker services"

install:
	@echo "Installing dependencies..."
	@if [ -f "pyproject.toml" ]; then \
		uv venv .venv && \
		. .venv/bin/activate && \
		uv pip install -e ".[dev]"; \
	fi
	@if [ -f "package.json" ]; then \
		npm install; \
	fi

pre-commit:
	pre-commit install
	pre-commit run --all-files

dev:
	@if [ -f "docker-compose.yml" ]; then \
		docker-compose up -d db redis; \
	fi
	@echo "Starting development servers..."
	# Add your dev server commands here

test:
	@echo "Running tests..."
	@if [ -d "services" ]; then \
		for service in services/*/; do \
			echo "Testing $$service"; \
			cd "$$service" && make test; \
			cd -; \
		done; \
	else \
		pytest -v; \
	fi

lint:
	@echo "Running linters..."
	ruff check .
	mypy .

format:
	@echo "Formatting code..."
	ruff format .

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name "*.egg-info" -exec rm -rf {} +
```

### 5. Pre-commit Configuration

**Universal Pre-commit Setup** (`.pre-commit-config.yaml`):
```yaml
repos:
  # Universal hooks
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-json
      - id: check-toml
      - id: check-merge-conflict
      - id: detect-private-key
      - id: check-added-large-files
        args: ['--maxkb=1000']

  # Python
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.1.6
    hooks:
      - id: ruff
        args: [--fix]
      - id: ruff-format
    files: \.py$

  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v1.7.0
    hooks:
      - id: mypy
        files: \.py$
        args: [--strict]

  # Security
  - repo: https://github.com/Yelp/detect-secrets
    rev: v1.4.0
    hooks:
      - id: detect-secrets
        args: ['--baseline', '.secrets.baseline']

  # Docker
  - repo: https://github.com/hadolint/hadolint
    rev: v2.12.0
    hooks:
      - id: hadolint
        files: Dockerfile
```

### 6. CI/CD Pipeline

**GitHub Actions Workflow** (`.github/workflows/ci.yml`):
```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        service: [api, frontend, worker]
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Set up Python
        if: matrix.service != 'frontend'
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      
      - name: Set up Node.js
        if: matrix.service == 'frontend'
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      
      - name: Install dependencies
        run: |
          cd services/${{ matrix.service }}
          if [ -f "pyproject.toml" ]; then
            pip install uv
            uv venv .venv
            source .venv/bin/activate
            uv pip install -e ".[test]"
          elif [ -f "package.json" ]; then
            npm ci
          fi
      
      - name: Run tests
        run: |
          cd services/${{ matrix.service }}
          if [ -f "pyproject.toml" ]; then
            source .venv/bin/activate
            pytest --cov --cov-report=xml
          elif [ -f "package.json" ]; then
            npm test -- --coverage
          fi
      
      - name: Run linters
        run: |
          cd services/${{ matrix.service }}
          if [ -f "pyproject.toml" ]; then
            source .venv/bin/activate
            ruff check .
            mypy .
          elif [ -f "package.json" ]; then
            npm run lint
          fi

  docker:
    needs: test
    runs-on: ubuntu-latest
    if: github.event_name == 'push'
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2
      
      - name: Build and test Docker images
        run: |
          docker-compose build
          docker-compose run --rm api pytest
          docker-compose down
```

### 6. Linting & Formatting

**ESLint** (`.eslintrc.js`):
```javascript
module.exports = {
  env: {
    node: true,
    es2021: true,
    jest: true
  },
  extends: [
    'eslint:recommended',
    'plugin:prettier/recommended'
  ],
  rules: {
    'no-console': 'warn',
    'no-unused-vars': ['error', { 'argsIgnorePattern': '^_' }]
  }
};
```

**Prettier** (`.prettierrc`):
```json
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5",
  "printWidth": 80
}
```

## Verification Checklist

```markdown
## ✅ Setup Verification

### Dependencies
- [ ] All packages installed successfully
- [ ] No version conflicts
- [ ] Lock file created/updated

### Configuration
- [ ] Environment variables configured
- [ ] Database connection working
- [ ] API keys set (if needed)

### Development Tools
- [ ] Linter runs without errors
- [ ] Formatter configured
- [ ] Git hooks installed

### Testing
- [ ] Test suite runs
- [ ] Coverage reporting works
- [ ] Watch mode functional

### Build & Run
- [ ] Development server starts
- [ ] Hot reload working
- [ ] Build completes successfully

## 🚀 Quick Start Commands

Start development:
```bash
npm run dev
```

Run tests:
```bash
npm test
```

Lint and format:
```bash
npm run lint
npm run format
```

## 📚 Additional Resources

- [Project documentation](./docs)
- [API documentation](./api-docs)
- [Contributing guide](./CONTRIBUTING.md)
- [Architecture overview](./ARCHITECTURE.md)
```

## Monorepo Project Structure

### Recommended Structure
```
project-root/
├── services/           # Backend services
│   ├── api/           # Main API service
│   │   ├── src/
│   │   ├── tests/
│   │   ├── Dockerfile
│   │   └── pyproject.toml
│   ├── worker/        # Background job worker
│   │   ├── src/
│   │   ├── tests/
│   │   ├── Dockerfile
│   │   └── pyproject.toml
│   └── frontend/      # Frontend application
│       ├── src/
│       ├── public/
│       ├── Dockerfile
│       └── package.json
├── packages/          # Shared packages
│   ├── common/        # Shared utilities
│   └── types/         # Shared type definitions
├── infrastructure/    # Infrastructure as code
│   ├── docker/
│   ├── k8s/
│   └── terraform/
├── scripts/           # Development scripts
├── docs/              # Documentation
├── docker-compose.yml
├── Makefile
├── .gitignore
├── .pre-commit-config.yaml
└── README.md
```

### Service-Specific Configuration

**Python Service pyproject.toml**:
```toml
[build-system]
requires = ["setuptools>=61.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "my-api-service"
version = "0.1.0"
description = "API service for the application"
requires-python = ">=3.9"
dependencies = [
    "fastapi>=0.104.0",
    "uvicorn[standard]>=0.24.0",
    "pydantic>=2.0.0",
    "sqlalchemy>=2.0.0",
    "alembic>=1.12.0",
    "httpx>=0.25.0",
    "redis>=5.0.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=7.4.0",
    "pytest-asyncio>=0.21.0",
    "pytest-cov>=4.1.0",
    "ruff>=0.1.0",
    "mypy>=1.5.0",
    "pre-commit>=3.4.0",
]

[tool.ruff]
line-length = 88
target-version = "py39"
select = ["E", "F", "I", "N", "UP", "S", "B", "A", "C4", "PT"]

[tool.mypy]
python_version = "3.9"
strict = true
```

## Success Criteria
- Project type correctly identified or determined through questions
- All dependencies installed with appropriate package managers
- Docker environment configured for all services
- Pre-commit hooks installed and working
- CI/CD pipeline configured
- Development scripts (Makefile) ready
- Environment variables properly configured
- Tests passing for all services
- Ready for development

Set up a complete, productive development environment that supports both simple projects and complex monorepo architectures.