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
3. **Suggest Optimizations** - Specific improvements
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

### 2. Optimization Report

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

### 🟡 Optimization Opportunities
1. **[Opportunity Name]**
   - Potential improvement: [X]% faster / [Y]% less memory
   - Trade-offs: [Any downsides]

## Recommended Optimizations

### Optimization 1: [Name]
**Impact**: 🚀 [Expected improvement]

#### Current Code
```[language]
[Current implementation]
```

#### Optimized Code
```[language]
[Optimized implementation]
```

#### Explanation
[Why this is faster/more efficient]

### Optimization 2: [Name]
[Similar structure...]

## Implementation Priority

1. **Quick Wins** (< 1 hour)
   - [ ] [Optimization task]
   - [ ] [Another quick fix]

2. **Medium Effort** (1-4 hours)
   - [ ] [Medium optimization]
   - [ ] [Another medium task]

3. **Major Refactoring** (> 4 hours)
   - [ ] [Large optimization]

## Benchmark Suggestions

### Performance Tests
```[language]
// Benchmark code to measure improvements
[Benchmark example]
```

### Metrics to Track
- Execution time
- Memory usage
- CPU utilization
- Response time
- Throughput

## Additional Considerations

### Caching Strategy
[Suggested caching approach]

### Lazy Loading
[Components/data to lazy load]

### Code Splitting
[Modules to split]

### Database Optimization
[Query improvements, indexing]
```

## Optimization Categories

### Algorithm Optimization
- Better data structures (Array → Set/Map)
- Improved algorithms (O(n²) → O(n log n))
- Early termination conditions
- Memoization/caching

### Database Performance
- Query optimization
- Proper indexing
- Batch operations
- Connection pooling

### Frontend Optimization
- Virtual scrolling
- Debouncing/throttling
- React.memo/useMemo
- Bundle splitting

### Backend Optimization
- Async/parallel processing
- Stream processing
- Resource pooling
- Caching layers

### Memory Optimization
- Object pooling
- Weak references
- Garbage collection
- Memory leak fixes

## Optimization Techniques

### Immediate Fixes
- Remove console.logs in production
- Eliminate unnecessary loops
- Cache computed values
- Use appropriate data structures

### Architectural Changes
- Implement caching layers
- Add pagination
- Use lazy loading
- Optimize build process

### Advanced Techniques
- Web Workers
- Service Workers
- WebAssembly
- GPU acceleration

## Trade-off Analysis

For each optimization, consider:
- **Performance Gain** vs **Code Complexity**
- **Memory Usage** vs **CPU Usage**
- **Development Time** vs **Performance Benefit**
- **Maintainability** vs **Optimization Level**

## Success Criteria
- Bottlenecks clearly identified
- Optimizations are practical
- Trade-offs are explained
- Benchmarks demonstrate improvement
- Code remains maintainable

Analyze the specified code and provide actionable performance optimizations.