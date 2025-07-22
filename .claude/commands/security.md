---
description: Analyse code for security vulnerabilities and best practices
argument-hint: [file path or directory]
allowed-tools: Read, Grep, Glob, WebSearch, Task
---

# Security Analysis

You are performing comprehensive security analysis of code to identify vulnerabilities, security anti-patterns, and recommend security best practices.

## Input
**Analysis Target**: $ARGUMENTS (file path, directory, or empty for current directory)

## Your Task

Perform thorough security analysis:

1. **Vulnerability Scanning** - Identify common security issues
2. **Best Practice Review** - Check against security standards
3. **Threat Assessment** - Evaluate potential attack vectors
4. **Remediation Guidance** - Provide specific fixes

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

### 2. Language-Specific Security Checks

#### JavaScript/Node.js
```javascript
// ❌ Security Issues
eval(userInput);                    // Code injection
child_process.exec(userInput);      // Command injection
app.use(cors());                    // Overly permissive CORS
res.send(userInput);                // XSS vulnerability
```

#### Python
```python
# ❌ Security Issues  
eval(user_input)                    # Code execution
exec(user_code)                     # Code execution
cursor.execute(f"SELECT * FROM users WHERE id = {user_id}")  # SQL injection
pickle.loads(untrusted_data)        # Deserialization attack
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

## Security Report Format

```markdown
# 🛡️ Security Analysis Report

**Scope**: [Files/directories analysed]
**Date**: [Analysis date]
**Risk Level**: 🔴 HIGH | 🟡 MEDIUM | 🟢 LOW

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

### Code Quality
- Remove debug statements
- Implement proper logging
- Add error handling

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

### Recommended Tools
```bash
# Static analysis
npm install --save-dev eslint-plugin-security
pip install bandit

# Dependency scanning  
npm audit
pip-audit

# Container scanning
docker scan [image]

# SAST tools
semgrep --config=auto .
```

### CI/CD Integration
```yaml
# GitHub Actions security workflow
- name: Security Scan
  run: |
    npm audit --audit-level high
    semgrep --config=auto --error .
    docker scan ${{ env.IMAGE_NAME }}
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

## Success Criteria
- All critical vulnerabilities identified
- Specific remediation steps provided
- Risk levels accurately assessed
- Actionable recommendations given
- Security best practices highlighted

Perform comprehensive security analysis and provide actionable remediation guidance.