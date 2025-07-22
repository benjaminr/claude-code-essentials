# Development Principles

## Core Philosophy

**Code is written once, read hundreds of times.** Every line you write is a communication to your future self and your teammates. Write for humans first, computers second.

## Fundamental Principles

### 1. Clarity Over Cleverness

**Bad (JavaScript):**
```javascript
const u = users.filter(u => u.a && u.s === 'active').map(u => ({...u, n: u.name.toUpperCase()}));
```

**Good (JavaScript):**
```javascript
const activeUsers = users
  .filter(user => user.isActive && user.status === 'active')
  .map(user => ({
    ...user,
    displayName: user.name.toUpperCase()
  }));
```

**Bad (Python):**
```python
def p(u): return [{'n': x['name'].upper(), **x} for x in u if x.get('a') and x['s'] == 'active']
```

**Good (Python):**
```python
def get_active_users_with_display_names(users):
    """Return active users with formatted display names."""
    active_users = []
    for user in users:
        if user.get('is_active') and user['status'] == 'active':
            user_with_display = {
                **user,
                'display_name': user['name'].upper()
            }
            active_users.append(user_with_display)
    return active_users
```

**Principle**: If you need to think twice about what code does, it's too clever. Optimise for readability.

### Language Consistency in Code

**Bad (Mixed spellings):**
```python
def initialize_user_color(user_data):
    """Initialize user colour preferences."""  # Mixed American/British
    colour = user_data.get('favourite_colour', 'gray')  # American spelling
    return {'color': colour}  # Inconsistent naming
```

**Good (Consistent British English):**
```python
def initialise_user_colour(user_data):
    """Initialise user colour preferences."""
    colour = user_data.get('favourite_colour', 'grey')
    return {'colour': colour}
```

### 2. Avoid Over-Abstraction

**Warning Signs:**
- More than 3 levels of abstraction
- Generic names like `Manager`, `Handler`, `Processor`
- Classes with only one method
- Abstractions that don't eliminate real duplication

**Rule**: Don't abstract until you have 3+ concrete examples of the pattern. Premature abstraction is the root of much evil.

### 3. Modular Design

**JavaScript Example:**
```javascript
// Good: Single responsibility, clear dependencies
function calculateOrderTotal(items, taxRate, shippingCost) {
  const subtotal = calculateSubtotal(items);
  const tax = calculateTax(subtotal, taxRate);
  return subtotal + tax + shippingCost;
}

function calculateSubtotal(items) {
  return items.reduce((total, item) => total + (item.price * item.quantity), 0);
}
```

**Python Example:**
```python
# Good: Single responsibility, clear dependencies
def calculate_order_total(items: List[OrderItem], tax_rate: Decimal, shipping_cost: Decimal) -> Decimal:
    """Calculate total order cost including tax and shipping."""
    subtotal = calculate_subtotal(items)
    tax = calculate_tax(subtotal, tax_rate)
    return subtotal + tax + shipping_cost

def calculate_subtotal(items: List[OrderItem]) -> Decimal:
    """Calculate subtotal from order items."""
    return sum(item.price * item.quantity for item in items)

def calculate_tax(amount: Decimal, rate: Decimal) -> Decimal:
    """Calculate tax amount for given rate."""
    return amount * rate
```

**Principles:**
- Functions do one thing well
- Clear inputs and outputs
- No side effects unless absolutely necessary
- Easy to test in isolation

### 4. Composition Over Inheritance

**Prefer (Python):**
```python
class User:
    """User with composed services rather than inheritance."""
    
    def __init__(self, auth_provider, notification_service, logger):
        self._auth = auth_provider
        self._notifications = notification_service
        self._logger = logger
    
    def login(self, credentials):
        return self._auth.authenticate(credentials)
    
    def notify(self, message):
        return self._notifications.send(message)
    
    def log_event(self, event):
        return self._logger.record(event)
```

**Over (Deep inheritance):**
```python
class User(AuthenticatedEntity, NotificationMixin, LoggableMixin):
    # Deep inheritance hierarchy leads to tight coupling
    pass
```

### 5. Explicit Over Implicit

**Bad:**
```python
def process(data):
    # What does this return? What can go wrong?
    return transform(validate(data))
```

**Good:**
```python
def process_user_data(raw_user_data: Dict[str, Any]) -> Result[User, ValidationError]:
    """
    Process raw user data into a validated User object.
    
    Returns:
        Success with User object, or Failure with validation errors
    """
    validation_result = validate_user_data(raw_user_data)
    if validation_result.is_error():
        return Failure(validation_result.error)
    
    return Success(transform_to_user(validation_result.value))
```

## Anti-Patterns to Avoid

### The God Object
```javascript
// ❌ Don't: One class that does everything
class UserManager {
  authenticate() {}
  validateInput() {}
  sendEmail() {}
  logActivity() {}
  generateReports() {}
  handlePayments() {}
  // ... 50 more methods
}
```

### Spaghetti Code
- Functions that do multiple unrelated things
- Deep nesting (more than 3 levels)
- Long parameter lists (more than 3-4 parameters)
- Global state mutations

### Premature Optimisation
- Micro-optimisations that hurt readability
- Complex caching before measuring performance
- Over-engineered solutions for simple problems

### Magic Numbers and Strings

**JavaScript Example:**
```javascript
// ❌ Bad
if (user.status === 3) {
  setTimeout(() => sendReminder(), 86400000);
}

// ✅ Good
const USER_STATUS = {
  PENDING: 1,
  ACTIVE: 2,
  SUSPENDED: 3
};

if (user.status === USER_STATUS.SUSPENDED) {
  setTimeout(() => sendReminder(), ONE_DAY_MS);
}
```

**Python Example:**
```python
# ❌ Bad
if user.status == 3:
    schedule_reminder(delay=86400)

# ✅ Good
from enum import Enum
from datetime import timedelta

class UserStatus(Enum):
    PENDING = 1
    ACTIVE = 2
    SUSPENDED = 3

ONE_DAY = timedelta(days=1)

if user.status == UserStatus.SUSPENDED:
    schedule_reminder(delay=ONE_DAY)
```

## Error Handling Wisdom

### 1. Fail Fast and Loud
```javascript
function processPayment(amount, currency) {
  if (!amount || amount <= 0) {
    throw new Error(`Invalid payment amount: ${amount}`);
  }
  if (!['USD', 'EUR', 'GBP'].includes(currency)) {
    throw new Error(`Unsupported currency: ${currency}`);
  }
  // Process payment...
}
```

### 2. Use Result Types for Expected Failures
```javascript
// Don't use exceptions for control flow
async function fetchUser(id) {
  try {
    const user = await api.getUser(id);
    return { success: true, data: user };
  } catch (error) {
    if (error.status === 404) {
      return { success: false, error: 'User not found' };
    }
    throw error; // Re-throw unexpected errors
  }
}
```

### 3. Context in Error Messages
```javascript
// ❌ Useless
throw new Error('Invalid input');

// ✅ Actionable
throw new Error(`User validation failed: email '${email}' is not valid format. Expected format: user@domain.com`);
```

## Testing Philosophy

### Test the Behaviour, Not the Implementation
```javascript
// ❌ Testing implementation details
test('should call validateEmail once', () => {
  const spy = jest.spyOn(validator, 'validateEmail');
  createUser(userData);
  expect(spy).toHaveBeenCalledTimes(1);
});

// ✅ Testing behaviour
test('should reject invalid email addresses', () => {
  const result = createUser({ ...userData, email: 'invalid' });
  expect(result.success).toBe(false);
  expect(result.error).toContain('email');
});
```

### Test Names Should Describe Business Value

**JavaScript Example:**
```javascript
// ❌ Technical test name
test('validateUser returns false');

// ✅ Business-focused test name
test('should prevent account creation when email is already registered');
```

**Python Example:**
```python
# ❌ Technical test name
def test_validate_user_returns_false():
    pass

# ✅ Business-focused test name
def test_prevents_account_creation_when_email_already_registered():
    # Given an existing user with email
    existing_user = create_user(email="test@example.com")
    
    # When attempting to create another user with same email
    result = create_user(email="test@example.com")
    
    # Then creation should fail
    assert result.is_error()
    assert "email already registered" in result.error_message
```

## Performance Principles

### 1. Measure Before Optimising
- Use profilers to find real bottlenecks
- Optimise the biggest impact items first
- Keep optimisations readable when possible

### 2. Big O Matters at Scale
```javascript
// ❌ O(n²) - will hurt at scale
function findDuplicates(items) {
  return items.filter((item, index) => 
    items.findIndex(other => other.id === item.id) !== index
  );
}

// ✅ O(n) - scales linearly
function findDuplicates(items) {
  const seen = new Set();
  return items.filter(item => {
    if (seen.has(item.id)) return true;
    seen.add(item.id);
    return false;
  });
}
```

### 3. Memory Matters
- Clean up event listeners
- Avoid memory leaks in closures
- Use weak references when appropriate

## Code Review Guidelines

### What to Look For
1. **Correctness**: Does it solve the right problem?
2. **Clarity**: Can you understand it in 30 seconds?
3. **Completeness**: Are edge cases handled?
4. **Consistency**: Does it follow project conventions?
5. **Performance**: Will it scale with expected load?

### What to Ignore
- Style issues (let tools handle this)
- Personal preferences about implementation
- Micro-optimisations unless proven necessary

## Modern Python Guidelines

### Python 3.9+ Best Practices

#### Use Built-in Generics (Python 3.9+)
```python
# ❌ Old way - importing from typing
from typing import List, Dict, Set, Optional

def process_users(users: List[dict]) -> Dict[str, Set[int]]:
    pass

# ✅ Modern way - use built-ins
def process_users(users: list[dict]) -> dict[str, set[int]]:
    pass

# ✅ For Optional, still use typing until Python 3.10+
from typing import Optional

def get_user(user_id: int) -> Optional[dict]:
    pass

# ✅ Python 3.10+ - use union operator
def get_user(user_id: int) -> dict | None:
    pass
```

#### Structural Pattern Matching (Python 3.10+)
```python
# ✅ Use match/case for complex conditionals
def handle_api_response(response):
    match response.status_code:
        case 200:
            return response.json()
        case 404:
            raise NotFoundError("Resource not found")
        case 500 | 502 | 503:
            raise ServerError("Server unavailable")
        case _:
            raise APIError(f"Unexpected status: {response.status_code}")

# ✅ Pattern matching with data structures
def process_event(event):
    match event:
        case {"type": "user_login", "user_id": user_id}:
            handle_login(user_id)
        case {"type": "user_logout", "user_id": user_id}:
            handle_logout(user_id)
        case {"type": "error", "message": msg}:
            logger.error(f"Event error: {msg}")
        case _:
            logger.warning(f"Unknown event type: {event}")
```

#### Modern String Formatting
```python
# ❌ Avoid old formatting methods
name = "Alice"
age = 30
message = "Hello %s, you are %d years old" % (name, age)  # Very old
message = "Hello {}, you are {} years old".format(name, age)  # Old

# ✅ Use f-strings (Python 3.6+)
message = f"Hello {name}, you are {age} years old"

# ✅ For complex expressions
user = {"name": "Alice", "details": {"age": 30}}
message = f"Hello {user['name']}, you are {user['details']['age']} years old"

# ✅ For debugging (Python 3.8+)
user_count = 42
logger.debug(f"{user_count=}")  # Outputs: user_count=42
```

#### Dataclasses and Modern Class Definition
```python
# ✅ Use dataclasses for data containers (Python 3.7+)
from dataclasses import dataclass, field
from datetime import datetime

@dataclass
class User:
    name: str
    email: str
    created_at: datetime = field(default_factory=datetime.now)
    is_active: bool = True
    
    def __post_init__(self):
        """Validate data after initialisation."""
        if "@" not in self.email:
            raise ValueError(f"Invalid email: {self.email}")

# ✅ For immutable data (Python 3.7+)
@dataclass(frozen=True)
class Config:
    database_url: str
    debug_mode: bool = False

# ✅ Use properties for computed values
@dataclass
class Circle:
    radius: float
    
    @property
    def area(self) -> float:
        return 3.14159 * self.radius ** 2
```

#### Context Managers and Resource Handling
```python
# ✅ Use context managers for resource handling
from contextlib import contextmanager
import sqlite3

@contextmanager
def database_transaction(db_path: str):
    """Context manager for database transactions."""
    conn = sqlite3.connect(db_path)
    trans = conn.begin()
    try:
        yield conn
        trans.commit()
    except Exception:
        trans.rollback()
        raise
    finally:
        conn.close()

# Usage
with database_transaction("app.db") as conn:
    conn.execute("INSERT INTO users (name) VALUES (?)", ("Alice",))

# ✅ Suppress specific exceptions when appropriate
from contextlib import suppress

with suppress(FileNotFoundError):
    os.remove("temp_file.txt")
```

#### Modern Async/Await Patterns
```python
# ✅ Modern async patterns (Python 3.7+)
import asyncio
from typing import AsyncGenerator

async def fetch_user_data(user_ids: list[int]) -> list[dict]:
    """Fetch multiple users concurrently."""
    async with httpx.AsyncClient() as client:
        tasks = [client.get(f"/users/{user_id}") for user_id in user_ids]
        responses = await asyncio.gather(*tasks, return_exceptions=True)
        
        results = []
        for response in responses:
            if isinstance(response, Exception):
                logger.error(f"Failed to fetch user: {response}")
                continue
            results.append(response.json())
        
        return results

# ✅ Async generators for streaming data
async def stream_log_lines(file_path: str) -> AsyncGenerator[str, None]:
    """Stream log lines asynchronously."""
    async with aiofiles.open(file_path, 'r') as file:
        async for line in file:
            yield line.strip()
```

#### Pathlib for File Operations
```python
# ❌ Old string-based paths
import os
config_path = os.path.join(os.path.dirname(__file__), "config", "settings.ini")

# ✅ Modern pathlib approach
from pathlib import Path

config_path = Path(__file__).parent / "config" / "settings.ini"

# ✅ Pathlib methods
if config_path.exists():
    content = config_path.read_text(encoding="utf-8")
    backup_path = config_path.with_suffix(".ini.bak")
    config_path.rename(backup_path)
```

#### Exception Groups (Python 3.11+)
```python
# ✅ Handle multiple exceptions with ExceptionGroup
def process_batch(items: list) -> None:
    errors = []
    
    for item in items:
        try:
            process_item(item)
        except ValidationError as e:
            errors.append(e)
        except ProcessingError as e:
            errors.append(e)
    
    if errors:
        raise ExceptionGroup("Batch processing failed", errors)

# ✅ Catch exception groups
try:
    process_batch(items)
except* ValidationError as eg:
    handle_validation_errors(eg.exceptions)
except* ProcessingError as eg:
    handle_processing_errors(eg.exceptions)
```

#### Modern Environment and Dependency Management with UV

**Default to UV for all Python projects** - UV is significantly faster and more reliable than pip/venv.

```bash
# ✅ Use UV for environment management (replaces venv)
uv venv .venv                    # Create virtual environment
source .venv/bin/activate        # Activate (Linux/Mac)
# or: .venv\Scripts\activate     # Activate (Windows)

# ✅ Use UV for dependency installation (replaces pip)
uv pip install fastapi          # Install package
uv pip install -r requirements.txt  # Install from requirements
uv pip install -e .            # Install in development mode

# ✅ Use UV for dependency resolution and locking
uv pip compile pyproject.toml          # Generate requirements.txt
uv pip compile requirements.in         # Compile .in to .txt with hashes
uv pip sync requirements.txt           # Install exact locked versions

# ✅ UV project initialisation (creates pyproject.toml structure)
uv init my-project              # Create new project structure
cd my-project
uv add fastapi                  # Add dependency to pyproject.toml
uv add pytest --dev           # Add development dependency
uv remove requests             # Remove dependency
```

**Project Structure with UV:**
```
my-project/
├── .venv/                     # UV-managed virtual environment
├── pyproject.toml            # Project configuration
├── requirements.txt          # Locked production dependencies (UV-generated)
├── requirements-dev.txt      # Locked development dependencies (UV-generated)
└── src/
    └── my_project/
        └── __init__.py
```

**pyproject.toml with UV best practices:**
```toml
# ✅ Modern pyproject.toml structure
[build-system]
requires = ["setuptools>=61.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "your-package"
version = "1.0.0"
description = "Package description"
requires-python = ">=3.9"
dependencies = [
    "fastapi>=0.104.0",
    "httpx>=0.24.0",
    "pydantic>=2.0.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=7.4.0",
    "ruff>=0.1.0",
    "mypy>=1.5.0",
    "pre-commit>=3.4.0",
]
test = [
    "pytest-cov>=4.1.0",
    "factory-boy>=3.3.0",
]

[tool.uv]
dev-dependencies = [
    "pytest>=7.4.0",
    "ruff>=0.1.0",
    "mypy>=1.5.0",
]

[tool.ruff]
line-length = 88
target-version = "py39"

[tool.mypy]
python_version = "3.9"
strict = true
```

**UV Workflow Commands:**
```bash
# ✅ Daily development workflow
uv pip sync requirements-dev.txt    # Sync to exact dev dependencies
uv run pytest                       # Run tests in UV environment
uv run ruff check .                 # Lint with ruff
uv run mypy src/                    # Type check with mypy

# ✅ Production deployment
uv pip sync requirements.txt        # Install only production deps

# ✅ Dependency updates
uv pip compile --upgrade requirements.in    # Update all dependencies
uv pip compile --upgrade-package fastapi requirements.in  # Update specific package

# ✅ Lock file generation for CI/CD
uv pip compile pyproject.toml --output-file requirements.txt
uv pip compile pyproject.toml --extra dev --output-file requirements-dev.txt
```

**Why UV over pip/poetry/pipenv:**
- **Speed**: 10-100x faster than pip
- **Reliability**: Better dependency resolution
- **Simplicity**: Drop-in replacement for pip with same commands
- **Standards Compliant**: Works with standard pyproject.toml
- **No Lock-in**: Generate standard requirements.txt files

#### Pre-commit Hooks - Essential Quality Gates

**Always set up pre-commit hooks on every Python project** - catch issues before they reach the repository.

**Installation and Setup:**
```bash
# ✅ Install pre-commit in your UV environment
uv add pre-commit --dev

# ✅ Install the git hook scripts
pre-commit install

# ✅ Run against all files initially
pre-commit run --all-files
```

**.pre-commit-config.yaml - Essential Configuration:**
```yaml
# ✅ Comprehensive pre-commit configuration
repos:
  # Code formatting
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.1.6
    hooks:
      - id: ruff
        args: [--fix, --exit-non-zero-on-fix]
      - id: ruff-format

  # Type checking
  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v1.7.0
    hooks:
      - id: mypy
        additional_dependencies: [types-requests]
        args: [--strict]

  # Security and secrets scanning
  - repo: https://github.com/Yelp/detect-secrets
    rev: v1.4.0
    hooks:
      - id: detect-secrets
        args: ['--baseline', '.secrets.baseline']

  - repo: https://github.com/PyCQA/bandit
    rev: 1.7.5
    hooks:
      - id: bandit
        args: ['-r', 'src/', '-f', 'json']
        exclude: ^tests/

  # General code quality
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-json
      - id: check-toml
      - id: check-merge-conflict
      - id: check-added-large-files
        args: ['--maxkb=1000']
      - id: debug-statements
      - id: name-tests-test

  # Documentation and comments
  - repo: https://github.com/pycqa/pydocstyle
    rev: 6.3.0
    hooks:
      - id: pydocstyle
        args: [--convention=google]

  # Dependency security scanning
  - repo: https://github.com/pyupio/safety
    rev: 2.3.5
    hooks:
      - id: safety
        args: [--json, --ignore=51668]  # Ignore specific non-critical issues

  # Python-specific checks
  - repo: https://github.com/asottile/pyupgrade
    rev: v3.15.0
    hooks:
      - id: pyupgrade
        args: [--py39-plus]

  # Import sorting
  - repo: https://github.com/pycqa/isort
    rev: 5.12.0
    hooks:
      - id: isort
        args: ["--profile", "black", "--filter-files"]
```

**Essential Pre-commit Hook Categories:**

**1. Code Formatting (Non-negotiable)**
```yaml
# ✅ Ruff for linting and formatting (replaces black + flake8 + isort)
- repo: https://github.com/astral-sh/ruff-pre-commit
  rev: v0.1.6
  hooks:
    - id: ruff          # Linting
      args: [--fix, --exit-non-zero-on-fix]
    - id: ruff-format   # Formatting
```

**2. Security Scanning (Critical for production)**
```yaml
# ✅ Secret detection
- repo: https://github.com/Yelp/detect-secrets
  rev: v1.4.0
  hooks:
    - id: detect-secrets
      args: ['--baseline', '.secrets.baseline']

# ✅ Security vulnerability scanning
- repo: https://github.com/PyCQA/bandit
  rev: 1.7.5
  hooks:
    - id: bandit
      args: ['-r', 'src/', '-ll']  # Only medium and high severity
```

**3. Type Checking (Highly recommended)**
```yaml
# ✅ Static type checking
- repo: https://github.com/pre-commit/mirrors-mypy
  rev: v1.7.0
  hooks:
    - id: mypy
      args: [--strict, --ignore-missing-imports]
```

**4. Testing (Must-have)**
```yaml
# ✅ Run tests before commit
- repo: local
  hooks:
    - id: pytest
      name: pytest
      entry: uv run pytest
      language: system
      types: [python]
      pass_filenames: false
      args: [--tb=short, --maxfail=1]
```

**Project Setup Script:**
```bash
#!/bin/bash
# setup-project.sh - Initial project setup with pre-commit

set -e

echo "🚀 Setting up Python project with modern tooling..."

# Create UV environment and install dependencies
uv venv .venv
source .venv/bin/activate
uv add pre-commit ruff mypy pytest --dev

# Install pre-commit hooks
pre-commit install

# Create initial secrets baseline
detect-secrets scan --baseline .secrets.baseline

# Create basic configuration files
cat > .ruff.toml << EOF
target-version = "py39"
line-length = 88
select = ["E", "F", "I", "N", "W", "B", "C4", "S"]
ignore = ["E501"]  # Line too long (handled by formatter)

[per-file-ignores]
"tests/*" = ["S101"]  # Allow assert in tests
EOF

cat > pyproject.toml << 'EOF'
[tool.mypy]
python_version = "3.9"
strict = true
ignore_missing_imports = true

[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = "test_*.py"
python_functions = "test_*"
addopts = "-v --tb=short"
EOF

echo "✅ Project setup complete!"
echo "📝 Next steps:"
echo "   1. Review and customise .pre-commit-config.yaml"
echo "   2. Run: pre-commit run --all-files"
echo "   3. Commit your initial configuration"
```

**Advanced Pre-commit Configuration:**

**Conditional Hooks (for larger projects):**
```yaml
# ✅ Only run expensive checks on certain file changes
- repo: local
  hooks:
    - id: type-check-changed
      name: Type check changed files only
      entry: uv run mypy
      language: system
      types: [python]
      require_serial: false
    
    - id: test-changed-modules
      name: Test modules with changes
      entry: bash -c 'uv run pytest $(git diff --cached --name-only | grep "\.py$" | sed "s/src\///g" | sed "s/\.py$/.py/g" | head -10)'
      language: system
      pass_filenames: false
```

**Performance Optimisations:**
```yaml
# ✅ Speed up pre-commit with parallel execution
default_install_hook_types: [pre-commit, pre-push]
default_stages: [commit, push]
fail_fast: false  # Run all hooks even if one fails
```

**Team Guidelines:**
- **Always install pre-commit** on new repositories
- **Never commit** with `--no-verify` unless absolutely necessary
- **Fix issues locally** rather than disabling hooks
- **Update hook versions** monthly in team sync
- **Document exceptions** in project README when hooks must be skipped

#### Performance and Memory Optimisations
```python
# ✅ Use __slots__ for memory-efficient classes
@dataclass
class Point:
    __slots__ = ['x', 'y']
    x: float
    y: float

# ✅ Generator expressions for memory efficiency
large_numbers = (x for x in range(1000000) if x % 2 == 0)
sum_of_evens = sum(large_numbers)

# ✅ Use functools.cache for memoisation (Python 3.9+)
from functools import cache

@cache
def fibonacci(n: int) -> int:
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)
```

## Architecture Wisdom

### 1. Dependencies Should Flow Inward
```
UI Layer → Business Logic → Data Access
```
- UI depends on business logic, not vice versa
- Business logic should not know about databases or APIs
- Keep core logic independent of frameworks

### 2. Use Domain Language
```javascript
// ❌ Technical naming
class DataProcessor {
  processItems(items) {}
}

// ✅ Domain naming  
class OrderCalculator {
  calculateTotalCost(orderItems) {}
}
```

### 3. Embrace Boring Technology
- Choose proven, well-documented technologies
- New ≠ better
- Consider maintenance burden over shiny features

## Final Wisdom

### The Three Questions
Before writing any code, ask:
1. **What problem am I solving?** (Be specific)
2. **What's the simplest solution?** (Start simple, evolve)
3. **How will I know it works?** (Think about testing)

### The Two Rules
1. **Make it work** (Solve the problem correctly)
2. **Make it right** (Clean, readable, maintainable)

Only then consider making it fast.

### Remember
- **Perfect is the enemy of good** - Ship working software
- **Premature optimisation is evil** - Measure first
- **Code is temporary** - Requirements change, rewrites happen
- **Simplicity is sophisticated** - The best code is code you don't write

---

*"Any fool can write code that a computer can understand. Good programmers write code that humans can understand."* - Martin Fowler

## Project-Specific Guidelines

When using this spec-driven development toolkit:

### Specifications First
- Write requirements before code
- Use EARS notation for clarity
- Validate each stage before proceeding
- Keep specifications updated as code evolves

### Memory Usage
- Document team conventions in CLAUDE.md
- Reference architectural patterns consistently
- Import common standards with `@filename.md`
- Update project memory as standards evolve

### Command Usage
- Use `/validate` frequently to catch issues early
- Leverage `/review` for systematic code quality
- Run `/security` on sensitive code paths
- Keep `/todo` items actionable and specific

### Language Standards
- **British English Only**: All code comments, documentation, variable names, and commit messages must use British spellings
- **Examples**: `colour` not `color`, `initialise` not `initialize`, `behaviour` not `behavior`, `centre` not `center`
- **Consistency Matters**: Language consistency demonstrates professional attention to detail and team coordination

### Python Environment Standards
- **UV First**: Always use UV for Python environments and dependency management
- **Standard Structure**: Use `src/` layout with UV-managed `.venv/` directories
- **Lock Files**: Generate and commit `requirements.txt` for reproducible builds
- **Modern Tools**: Default to ruff (linting), mypy (type checking), pytest (testing)
- **Pre-commit Mandatory**: Every Python project must have pre-commit hooks for quality gates
- **Security Scanning**: Use detect-secrets and bandit to prevent credential leaks and vulnerabilities