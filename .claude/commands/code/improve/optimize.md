---
description: Analyse code performance and suggest optimisations
argument-hint: [file path or function name]
allowed-tools: Read, Write, Grep, Glob, Task
---

# Optimise Performance

You are analysing code for performance bottlenecks and suggesting optimisations to improve speed, memory usage, and scalability.

## Input
**Code to Optimise**: $ARGUMENTS (file path, function name, or component)

## Your Task

Perform comprehensive performance analysis:

1. **Identify Bottlenecks** - Find performance issues
2. **Analyze Complexity** - Time and space complexity
3. **Suggest Optimisations** - Specific improvements
4. **Provide Benchmarks** - Measure improvements

## Analysis Approach

### 1. Performance Audit

#### Time Complexity Analysis
- Loop analysis (nested loops, iterations)
- Recursive calls and depth
- Algorithm efficiency
- Database query performance

#### Space Complexity Analysis  
- Memory allocations
- Data structure choices
- Caching opportunities
- Memory leaks

#### Common Bottlenecks
- N+1 queries
- Unnecessary re-renders
- Blocking operations
- Inefficient algorithms
- Large bundle sizes

### 2. Optimisation Report

```markdown
# ⚡ Performance Analysis

## Current Performance Profile
**File**: `[file:line]`
**Time Complexity**: O([complexity])
**Space Complexity**: O([complexity])
**Main Bottlenecks**: [List key issues]

## Identified Issues

### 🔴 Critical Issues
1. **[Issue Name]**
   - Impact: [High/Medium/Low]
   - Current implementation:
   ```[language]
   [Current code]
   ```
   - Why it's slow: [Explanation]

### 🟡 Optimisation Opportunities
1. **[Opportunity Name]**
   - Potential improvement: [X]% faster / [Y]% less memory
   - Trade-offs: [Any downsides]

## Recommended Optimisations

### Optimisation 1: [Name]
**Impact**: 🚀 [Expected improvement]

#### Current Code
```[language]
[Current implementation]
```

#### Optimised Code
```[language]
[Optimised implementation]
```

#### Explanation
[Why this is faster/more efficient]

### Optimisation 2: [Name]
[Similar structure...]

## Implementation Priority

1. **Quick Wins** (< 1 hour)
   - [ ] [Optimisation task]
   - [ ] [Another quick fix]

2. **Medium Effort** (1-4 hours)
   - [ ] [Medium optimisation]
   - [ ] [Another medium task]

3. **Major Refactoring** (> 4 hours)
   - [ ] [Large optimisation]

## Benchmark Suggestions

### Performance Tests
```[language]
// Benchmark code to measure improvements
[Benchmark example]
```

### Metrics to Track
- Execution time
- Memory usage
- CPU utilisation
- Response time
- Throughput

## Additional Considerations

### Caching Strategy
[Suggested caching approach]

### Lazy Loading
[Components/data to lazy load]

### Code Splitting
[Modules to split]

### Database Optimisation
[Query improvements, indexing]
```

## Optimisation Categories

### Algorithm Optimisation
- Better data structures (Array → Set/Map)
- Improved algorithms (O(n²) → O(n log n))
- Early termination conditions
- Memoization/caching

### Database Performance
- Query optimisation
- Proper indexing
- Batch operations
- Connection pooling

### Frontend Optimisation
- Virtual scrolling
- Debouncing/throttling
- React.memo/useMemo
- Bundle splitting

### Backend Optimisation
- Async/parallel processing
- Stream processing
- Resource pooling
- Caching layers

### Memory Optimisation
- Object pooling
- Weak references
- Garbage collection
- Memory leak fixes

## Optimisation Techniques

### Immediate Fixes
- Remove console.logs in production
- Eliminate unnecessary loops
- Cache computed values
- Use appropriate data structures

### Architectural Changes
- Implement caching layers
- Add pagination
- Use lazy loading
- Optimise build process

### Advanced Techniques
- Web Workers
- Service Workers
- WebAssembly
- GPU acceleration

## Trade-off Analysis

For each optimisation, consider:
- **Performance Gain** vs **Code Complexity**
- **Memory Usage** vs **CPU Usage**
- **Development Time** vs **Performance Benefit**
- **Maintainability** vs **Optimisation Level**

## Success Criteria
- Bottlenecks clearly identified
- Optimisations are practical
- Trade-offs are explained
- Benchmarks demonstrate improvement
- Code remains maintainable

Analyse the specified code and provide actionable performance optimisations.