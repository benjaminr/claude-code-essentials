---
description: Set up development environment and project configuration
allowed-tools: Read, Write, Bash, Glob
---

# Setup Development Environment

You are helping set up a development environment with all necessary dependencies, configurations, and tools for productive development.

## Your Task

Analyze the project and set up a complete development environment:

1. **Detect Project Type** - Identify tech stack and requirements
2. **Install Dependencies** - Set up all required packages
3. **Configure Environment** - Create necessary config files
4. **Verify Setup** - Ensure everything works correctly

## Setup Process

### 1. Project Analysis
```markdown
# 🔧 Development Setup

## Project Detection
**Type**: [Web App/API/Library/CLI Tool]
**Language**: [JavaScript/Python/Ruby/etc]
**Framework**: [React/Django/Rails/etc]
**Package Manager**: [npm/yarn/pip/bundler]

## Current Status
✅ **Found**:
- [Config files present]
- [Dependencies defined]

❌ **Missing**:
- [Required files not found]
- [Configurations needed]
```

### 2. Environment Setup

#### Dependencies Installation
```bash
# Install project dependencies
[package-manager] install

# Install global tools if needed
[package-manager] install -g [tools]

# Install pre-commit hooks
[pre-commit install command]
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

#### Development Tools Configuration

**VS Code Settings** (`.vscode/settings.json`):
```json
{
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  },
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[python]": {
    "editor.defaultFormatter": "ms-python.black-formatter"
  }
}
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

### 3. Database Setup
```bash
# Create database
[db-command] create [dbname]

# Run migrations
[migration-command]

# Seed development data
[seed-command]
```

### 4. Development Scripts

Add to `package.json` or equivalent:
```json
{
  "scripts": {
    "dev": "nodemon src/index.js",
    "test": "jest --watch",
    "lint": "eslint . --fix",
    "format": "prettier --write .",
    "build": "webpack --mode production",
    "pre-commit": "lint-staged"
  }
}
```

### 5. Testing Setup

**Jest Configuration** (`jest.config.js`):
```javascript
module.exports = {
  testEnvironment: 'node',
  coverageDirectory: 'coverage',
  collectCoverageFrom: [
    'src/**/*.js',
    '!src/index.js',
  ],
  testMatch: [
    '**/__tests__/**/*.js',
    '**/*.test.js'
  ]
};
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

## Platform-Specific Setup

### Docker Setup
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 3000
CMD ["node", "src/index.js"]
```

### CI/CD Configuration
```yaml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
      - run: npm ci
      - run: npm test
      - run: npm run lint
```

## Success Criteria
- All dependencies installed
- Environment properly configured
- Development tools working
- Tests passing
- Ready for development

Set up a complete, productive development environment for the project.