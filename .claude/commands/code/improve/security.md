---
description: Analyse code for security vulnerabilities and best practices
argument-hint: [file path or directory]
allowed-tools: Read, Grep, Glob, WebSearch, Task, Bash
---

# Security Analysis

You are performing comprehensive security analysis of code to identify vulnerabilities, security anti-patterns, and recommend security best practices. You automatically detect the project's languages, frameworks, and tools to provide targeted security analysis.

## Input
**Analysis Target**: $ARGUMENTS (file path, directory, or empty for current directory)

## Your Task

Perform thorough security analysis:

1. **Project Analysis** - Detect languages, frameworks, and package managers
2. **Automated Scanning** - Run appropriate security tools for detected stack
3. **Vulnerability Detection** - Identify language-specific and general security issues
4. **Secret Detection** - Find hardcoded credentials, API keys, tokens
5. **Dependency Analysis** - Check for vulnerable packages and supply chain risks
6. **Best Practice Review** - Check against security standards and anti-patterns
7. **Threat Assessment** - Evaluate potential attack vectors
8. **Remediation Guidance** - Provide specific fixes with code examples

## Security Analysis Framework

### 1. Common Vulnerabilities (OWASP Top 10)

#### Injection Attacks
- SQL injection patterns
- Command injection risks
- NoSQL injection vulnerabilities
- LDAP injection possibilities

#### Broken Authentication
- Weak password policies
- Session management flaws
- Multi-factor authentication gaps
- JWT security issues

#### Sensitive Data Exposure
- Hardcoded secrets/credentials
- Unencrypted sensitive data
- Insecure data transmission
- Information leakage

#### Security Misconfiguration
- Default configurations
- Unnecessary features enabled
- Missing security headers
- Verbose error messages

### 2. Language-Adaptive Security Checks

#### Detection Strategy
```bash
# Detect project languages and frameworks
find . -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.java" -o -name "*.go" -o -name "*.rb" | head -5
test -f package.json && echo "Node.js project detected"
test -f requirements.txt && echo "Python project detected"
test -f Gemfile && echo "Ruby project detected"
test -f go.mod && echo "Go project detected"
test -f pom.xml && echo "Java/Maven project detected"
```

#### Common Security Patterns (All Languages)
```
# Universal Vulnerabilities
- Hardcoded secrets (API keys, passwords, tokens)
- SQL/NoSQL injection via string concatenation
- Command injection through shell execution
- Path traversal vulnerabilities
- Insecure deserialisation
- Weak cryptography or hashing
- Insufficient input validation
- Improper error handling exposing internals
- Debug code in production
- Insecure random number generation
- Time-of-check time-of-use (TOCTOU) bugs
- Logging sensitive information
```

#### Python Security Vulnerabilities
```python
# ❌ Code Execution Risks
eval(user_input)                    # Never use with untrusted input
exec(user_code)                     # Arbitrary code execution
__import__(user_module)             # Dynamic import risks

# ❌ Injection Vulnerabilities
cursor.execute(f"SELECT * FROM users WHERE id = {user_id}")  # SQL injection
os.system(f"echo {user_input}")    # Command injection
subprocess.call(user_cmd, shell=True)  # Shell injection risk

# ❌ Deserialisation Attacks
pickle.loads(untrusted_data)        # Arbitrary code execution
yaml.load(user_yaml)                # Use yaml.safe_load() instead
json.loads(user_json, object_hook=dangerous_hook)  # Hook exploitation

# ❌ Path Traversal
with open(f"/data/{user_file}") as f:  # No path validation
    content = f.read()

# ❌ Insecure Randomness
import random
token = random.randint(1000, 9999)  # Predictable, use secrets module

# ❌ Hardcoded Secrets
API_KEY = "sk-1234567890abcdef"    # Never hardcode secrets
db_password = "admin123"            # Use environment variables

# ❌ Weak Cryptography
import hashlib
password_hash = hashlib.md5(password.encode()).hexdigest()  # MD5 is broken

# ❌ TOCTOU (Time-of-check Time-of-use)
if os.path.exists(file_path):      # File could be changed between
    with open(file_path) as f:      # check and use
        data = f.read()

# ❌ Logging Sensitive Data
logger.info(f"User {username} logged in with password {password}")  # Never log passwords
logger.debug(f"API response: {response_with_tokens}")  # May contain secrets

# ❌ Exception Handling Issues
try:
    risky_operation()
except:  # Bare except catches everything including SystemExit
    pass  # Silent failure hides issues
```

#### Django-Specific Vulnerabilities
```python
# ❌ Django Security Issues
# Template injection
return render_template_string(user_template)  # User controls template

# SQL injection via raw queries
User.objects.raw(f"SELECT * FROM users WHERE name = '{name}'")

# Missing CSRF protection
@csrf_exempt  # Only if absolutely necessary
def payment_view(request):
    pass

# Insecure direct object reference
def view_document(request, doc_id):
    # No permission check
    return Document.objects.get(id=doc_id)
```

#### Flask-Specific Vulnerabilities
```python
# ❌ Flask Security Issues
# Debug mode in production
app.run(debug=True)  # Information disclosure

# Weak secret key
app.secret_key = 'dev'  # Predictable session cookies

# Template injection
return render_template_string(request.args.get('template'))

# Missing input validation
@app.route('/search')
def search():
    query = request.args.get('q')  # No sanitisation
    return run_search(query)
```

#### API Security
```javascript
// ❌ Missing validation
app.post('/api/user', (req, res) => {
  const user = req.body;  // No input validation
  User.create(user);      // Mass assignment
});

// ❌ Missing authentication
app.get('/admin/users', (req, res) => {
  // No auth check
  res.json(users);
});
```

## Automated Security Scanning

### 1. Language Detection and Tool Selection
```python
def detect_and_run_security_tools(project_path):
    """Detect project stack and run appropriate security tools."""
    tools_to_run = []
    
    # Universal tools
    tools_to_run.append({
        'name': 'secrets',
        'commands': [
            'detect-secrets scan --baseline .secrets.baseline',
            'truffleHog --regex --entropy .'
        ]
    })
    
    # Language-specific detection
    if Path('package.json').exists():
        tools_to_run.append({
            'name': 'nodejs',
            'commands': [
                'npm audit --json',
                'eslint --plugin security .',
                'snyk test'
            ]
        })
    
    if Path('requirements.txt').exists() or Path('pyproject.toml').exists():
        tools_to_run.append({
            'name': 'python',
            'commands': [
                'bandit -r . -f json -o bandit_report.json',
                'safety check --json',
                'pip-audit --format json'
            ]
        })
    
    if Path('Gemfile').exists():
        tools_to_run.append({
            'name': 'ruby',
            'commands': [
                'bundle audit check',
                'brakeman -q -f json'
            ]
        })
    
    if Path('go.mod').exists():
        tools_to_run.append({
            'name': 'go',
            'commands': [
                'gosec -fmt json ./...',
                'nancy go.sum'
            ]
        })
    
    # Run semgrep for all languages
    tools_to_run.append({
        'name': 'semgrep',
        'commands': ['semgrep --config=auto --json .']
    })
    
    return tools_to_run
```

### 2. Universal Security Checks
```bash
# Check .gitignore for sensitive patterns
SENSITIVE_PATTERNS=(
    '.env' '.env.*' '*.pem' '*.key' '*.p12' '*.pfx'
    '.secrets' 'secrets/' '*_rsa' '*.ppk'
    '*.log' 'logs/' '.DS_Store' 'Thumbs.db'
    '__pycache__/' '*.pyc' 'node_modules/' '.venv/'
)

for pattern in "${SENSITIVE_PATTERNS[@]}"; do
    grep -q "$pattern" .gitignore || echo "⚠️  Missing '$pattern' in .gitignore"
done
```

### 2. Parse and Analyse Results
```python
import json
import subprocess
from pathlib import Path

def run_security_scan(target_path):
    """Run comprehensive security analysis."""
    results = {
        'bandit': run_bandit(target_path),
        'safety': run_safety(),
        'secrets': run_detect_secrets(target_path),
        'gitignore': check_gitignore_security()
    }
    return results

def check_gitignore_security():
    """Ensure sensitive files are gitignored."""
    required_patterns = [
        '.env', '.env.*', '*.pem', '*.key', 
        '*.p12', '*.pfx', '.secrets', 'secrets/',
        '__pycache__/', '*.pyc', '.coverage',
        '*.log', 'logs/', '.DS_Store'
    ]
    
    gitignore_path = Path('.gitignore')
    if not gitignore_path.exists():
        return {'error': 'No .gitignore file found!'}
    
    content = gitignore_path.read_text()
    missing = [p for p in required_patterns if p not in content]
    
    return {
        'missing_patterns': missing,
        'recommendation': 'Add missing patterns to .gitignore'
    }
```

## Security Report Format

### Output Adaptation
The report format adapts based on context:
- **CI/CD Pipeline**: SARIF format for integration
- **Command Line**: Markdown for readability  
- **API/Automation**: JSON for processing

### SARIF Format (CI/CD)
```json
{
  "$schema": "https://raw.githubusercontent.com/oasis-tcs/sarif-spec/master/Schemata/sarif-schema-2.1.0.json",
  "version": "2.1.0",
  "runs": [{
    "tool": {
      "driver": {
        "name": "SecurityAnalysis",
        "version": "1.0.0",
        "rules": [
          {
            "id": "PY001",
            "name": "HardcodedSecret",
            "shortDescription": {
              "text": "Hardcoded secret detected"
            },
            "fullDescription": {
              "text": "A hardcoded secret was found in the code. This could lead to unauthorized access if the code is exposed."
            },
            "defaultConfiguration": {
              "level": "error"
            }
          }
        ]
      }
    },
    "results": [
      {
        "ruleId": "PY001",
        "level": "error",
        "message": {
          "text": "Hardcoded API key found"
        },
        "locations": [{
          "physicalLocation": {
            "artifactLocation": {
              "uri": "src/config.py"
            },
            "region": {
              "startLine": 15,
              "startColumn": 1,
              "endLine": 15,
              "endColumn": 50
            }
          }
        }]
      }
    ]
  }]
}
```

### Markdown Format (Human-Readable)
```markdown
# 🛡️ Security Analysis Report

**Scope**: [Files/directories analysed]
**Date**: [Analysis date]
**Risk Level**: 🔴 CRITICAL | 🟡 HIGH | 🟠 MEDIUM | 🟢 LOW
**Format**: Markdown (Human-Readable)

## Executive Summary
- **Critical Issues**: [X] found
- **High Risk**: [Y] found  
- **Medium Risk**: [Z] found
- **Overall Security Score**: [X]/100

## 🔴 Critical Vulnerabilities

### 1. [Vulnerability Type] in [file:line]
**Risk**: 🔴 Critical
**Impact**: [Data breach/System compromise/etc.]

#### Vulnerable Code:
```[language]
[Code snippet showing the issue]
```

#### Threat Vector:
[How an attacker could exploit this]

#### Remediation:
```[language]
[Secure code example]
```

#### Prevention:
- [Specific preventive measure 1]
- [Specific preventive measure 2]

## 🟡 Medium Risk Issues

### Input Validation Gaps
**Files Affected**: [List]
**Impact**: Data integrity, potential injection

#### Recommendations:
- Implement input sanitisation
- Add type validation
- Use parameterised queries

### Authentication Weaknesses
**Issues Found**:
- Missing rate limiting on login endpoints
- Weak password requirements
- No account lockout mechanism

## 🟢 Low Risk / Best Practice Improvements

### Security Headers
Missing recommended headers:
- Content-Security-Policy
- X-Frame-Options
- X-Content-Type-Options

### Code Quality Security
- Remove debug statements that expose internals
- Implement secure logging (no passwords/tokens)
- Add proper error handling (no information leakage)
- Check for insecure random number generation
- Validate all external inputs
- Use parameterised queries for databases

## 🛠️ Immediate Actions Required

### Priority 1 (Fix Today)
- [ ] Patch SQL injection in [file:line]
- [ ] Remove hardcoded API key in [file:line]
- [ ] Fix authentication bypass in [file:line]

### Priority 2 (Fix This Week)
- [ ] Add input validation to [endpoints]
- [ ] Implement rate limiting
- [ ] Update vulnerable dependencies

### Priority 3 (Plan for Next Sprint)
- [ ] Security headers implementation
- [ ] Comprehensive input sanitisation
- [ ] Security testing pipeline

## 📋 Security Checklist

### Authentication & Authorisation
- [ ] Strong password policy enforced
- [ ] Multi-factor authentication available
- [ ] Session management secure
- [ ] Proper access controls implemented

### Data Protection
- [ ] Sensitive data encrypted at rest
- [ ] Data encrypted in transit (TLS)
- [ ] No secrets in code/logs
- [ ] Data retention policies followed

### Input Handling
- [ ] All inputs validated and sanitised
- [ ] Parameterised queries used
- [ ] File upload restrictions
- [ ] Size limits enforced

### Error Handling
- [ ] No sensitive data in error messages
- [ ] Proper error logging
- [ ] Generic error responses to users
- [ ] Security monitoring in place

## 🔧 Security Tools Integration

### Multi-Language Security Tools

#### Universal Tools (All Languages)
```bash
# Secret Detection
pip install detect-secrets    # Works for any language
npm install -g truffleHog    # Git history secret scanning
brew install git-secrets     # Git hook-based protection

# SAST - Semgrep (Multi-language)
pip install semgrep
semgrep --config=auto .      # Auto-detects languages
semgrep --config=security-audit .

# Container Security
docker scan <image>          # If using containers
trivy image <image>          # Comprehensive vulnerability scanner
```

#### Language-Specific Tools

**Python**
```bash
pip install bandit safety pip-audit
bandit -r . -ll              # Security linter
safety check                 # Dependency vulnerabilities
pip-audit                    # PyPA vulnerability scanner
```

**JavaScript/TypeScript**
```bash
npm install -g eslint-plugin-security snyk
npm audit                    # Built-in dependency scanning
eslint --plugin security .   # Security linting
snyk test                    # Vulnerability testing
```

**Ruby**
```bash
gem install brakeman bundler-audit
brakeman -q                  # Static analysis security scanner
bundle audit                 # Dependency vulnerabilities
```

**Go**
```bash
go install github.com/securego/gosec/v2/cmd/gosec@latest
go install github.com/sonatype-nexus-community/nancy@latest
gosec ./...                  # Go security checker
nancy go.sum                 # Dependency vulnerabilities
```

**Java**
```bash
# OWASP Dependency Check
mvn org.owasp:dependency-check-maven:check
# SpotBugs with Find Security Bugs
mvn com.github.spotbugs:spotbugs-maven-plugin:spotbugs
```

### Pre-commit Integration (Multi-Language)
```yaml
# .pre-commit-config.yaml
repos:
  # Universal hooks
  - repo: https://github.com/Yelp/detect-secrets
    rev: v1.4.0
    hooks:
      - id: detect-secrets
        args: ['--baseline', '.secrets.baseline']
        exclude: package\.lock\.json
  
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: detect-private-key
      - id: check-added-large-files
        args: ['--maxkb=1000']
      - id: check-merge-conflict
      - id: check-yaml
      - id: check-json
  
  # Language-specific hooks (auto-enabled based on files)
  - repo: https://github.com/PyCQA/bandit
    rev: 1.7.5
    hooks:
      - id: bandit
        args: ['-ll']
        files: \.py$
  
  - repo: https://github.com/hadolint/hadolint
    rev: v2.12.0
    hooks:
      - id: hadolint
        files: Dockerfile
  
  - repo: https://github.com/koalaman/shellcheck-precommit
    rev: v0.9.0
    hooks:
      - id: shellcheck
        files: \.sh$
```

### CI/CD Integration (Multi-Language)
```yaml
# GitHub Actions multi-language security workflow
name: Security Analysis

on: [push, pull_request]

jobs:
  detect-languages:
    runs-on: ubuntu-latest
    outputs:
      languages: ${{ steps.detect.outputs.languages }}
    steps:
      - uses: actions/checkout@v3
      - id: detect
        run: |
          languages='[]'
          [ -f package.json ] && languages=$(echo $languages | jq '. + ["nodejs"]')
          [ -f requirements.txt ] || [ -f pyproject.toml ] && languages=$(echo $languages | jq '. + ["python"]')
          [ -f go.mod ] && languages=$(echo $languages | jq '. + ["go"]')
          [ -f Gemfile ] && languages=$(echo $languages | jq '. + ["ruby"]')
          [ -f pom.xml ] && languages=$(echo $languages | jq '. + ["java"]')
          echo "languages=$languages" >> $GITHUB_OUTPUT

  security:
    needs: detect-languages
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      # Universal security checks
      - name: Run Semgrep
        uses: returntocorp/semgrep-action@v1
        with:
          config: auto
          generateSarif: true
      
      - name: Upload Semgrep SARIF
        uses: github/codeql-action/upload-sarif@v2
        with:
          sarif_file: semgrep.sarif
        if: always()
      
      - name: Detect Secrets
        uses: trufflesecurity/trufflehog@main
        with:
          path: ./
          base: ${{ github.event.repository.default_branch }}
          head: HEAD
      
      # Python-specific
      - name: Python Security
        if: contains(needs.detect-languages.outputs.languages, 'python')
        run: |
          pip install bandit safety pip-audit
          bandit -r . -f sarif -o bandit.sarif || true
          safety check --json
          pip-audit
      
      # Node.js-specific  
      - name: Node.js Security
        if: contains(needs.detect-languages.outputs.languages, 'nodejs')
        run: |
          npm audit --json
          npm install -g snyk
          snyk test || true
      
      # Check .gitignore
      - name: Validate .gitignore
        run: |
          for pattern in '.env' '*.key' '*.pem' '.secrets' 'node_modules' '__pycache__' '.venv'; do
            grep -q "$pattern" .gitignore || echo "⚠️ Missing: $pattern"
          done
```

## 📚 Security Training Recommendations

### For Development Team
- OWASP Top 10 awareness training
- Secure coding practices workshop
- Threat modelling sessions
- Security code review guidelines

### Resources
- [OWASP Secure Coding Practices](https://owasp.org/www-project-secure-coding-practices-quick-reference-guide/)
- [Security testing methodology](https://owasp.org/www-project-web-security-testing-guide/)
```

## Threat Modelling

### STRIDE Analysis
- **Spoofing**: Identity verification mechanisms
- **Tampering**: Data integrity protection
- **Repudiation**: Audit logging completeness
- **Information Disclosure**: Data access controls
- **Denial of Service**: Resource exhaustion protection
- **Elevation of Privilege**: Access control bypass prevention

### Attack Surface Analysis
- Entry points identification
- Trust boundaries mapping
- Data flow analysis
- Privilege escalation paths

## Secure Coding Patterns

### Language-Agnostic Security Principles
```
1. Never hardcode secrets - use environment variables or secret managers
2. Always validate and sanitise user input
3. Use parameterised queries for database access
4. Implement proper authentication and authorisation
5. Use cryptographically secure random generators
6. Handle errors gracefully without exposing internals
7. Log security events but never log sensitive data
8. Keep dependencies updated and scan for vulnerabilities
9. Use the principle of least privilege
10. Implement defense in depth
```

### Secure Alternatives by Language

#### Python
```python
# ✅ Secure Random Generation
import secrets
token = secrets.token_urlsafe(32)  # Cryptographically secure
password = secrets.token_hex(16)

# ✅ Secure Password Hashing
from argon2 import PasswordHasher
ph = PasswordHasher()
hashed = ph.hash(password)
ph.verify(hashed, password)  # Raises exception if wrong

# ✅ Safe YAML Loading
import yaml
data = yaml.safe_load(user_input)  # No arbitrary object creation

# ✅ Parameterised Queries
cursor.execute(
    "SELECT * FROM users WHERE id = %s",
    (user_id,)  # Properly escaped
)

# ✅ Subprocess with Care
import subprocess
import shlex
result = subprocess.run(
    shlex.split(f"echo {shlex.quote(user_input)}"),
    capture_output=True,
    text=True,
    check=True
)

# ✅ Secure File Operations
from pathlib import Path
base_dir = Path("/safe/directory")
requested = base_dir / user_filename
# Ensure path doesn't escape base directory
if base_dir in requested.resolve().parents:
    with open(requested) as f:
        content = f.read()

# ✅ Environment-based Configuration
import os
from dotenv import load_dotenv
load_dotenv()
API_KEY = os.environ.get('API_KEY')  # Never hardcode
if not API_KEY:
    raise ValueError("API_KEY environment variable not set")

# ✅ Secure Logging
import logging
logger = logging.getLogger(__name__)
# Configure to avoid logging sensitive data
class SensitiveFilter(logging.Filter):
    def filter(self, record):
        # Redact sensitive patterns
        if hasattr(record, 'msg'):
            record.msg = record.msg.replace(password, '[REDACTED]')
        return True

logger.addFilter(SensitiveFilter())
```

#### JavaScript/TypeScript
```javascript
// ✅ Secure Random Generation
const crypto = require('crypto');
const token = crypto.randomBytes(32).toString('hex');

// ✅ Secure Password Hashing (bcrypt)
const bcrypt = require('bcrypt');
const hash = await bcrypt.hash(password, 10);
const valid = await bcrypt.compare(password, hash);

// ✅ Parameterised Queries (PostgreSQL)
const query = 'SELECT * FROM users WHERE id = $1';
const result = await client.query(query, [userId]);

// ✅ Input Validation
const validator = require('validator');
if (!validator.isEmail(email)) {
    throw new Error('Invalid email');
}

// ✅ Environment Variables
require('dotenv').config();
const apiKey = process.env.API_KEY;
if (!apiKey) throw new Error('API_KEY not configured');
```

#### Go
```go
// ✅ Secure Random Generation
import "crypto/rand"
token := make([]byte, 32)
_, err := rand.Read(token)

// ✅ Secure Password Hashing
import "golang.org/x/crypto/bcrypt"
hash, _ := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
err := bcrypt.CompareHashAndPassword(hash, []byte(password))

// ✅ Parameterised Queries
rows, err := db.Query("SELECT * FROM users WHERE id = ?", userID)

// ✅ Input Validation
import "regexp"
emailRegex := regexp.MustCompile(`^[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,4}$`)
if !emailRegex.MatchString(email) {
    return errors.New("invalid email")
}
```

## Success Criteria
- Project languages and frameworks automatically detected
- Appropriate security tools run for each detected language
- Secrets and credentials detected across all file types
- Dependencies scanned for known vulnerabilities
- .gitignore properly configured for security
- Code quality issues with security impact found
- Language-specific vulnerabilities identified
- Output format adapted to context (SARIF/Markdown/JSON)
- Specific remediation steps provided with examples
- Actionable recommendations given

Perform comprehensive security analysis by detecting the project stack, running appropriate tools, and providing actionable remediation guidance with secure code examples in the relevant languages.