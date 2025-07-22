---
description: Build complete prototypes from high-level ideas using intelligent feature breakdown and pipeline orchestration
argument-hint: [app-idea] [mvp|full] [tech-stack]
allowed-tools: Task, Write, Read, LS, Glob, TodoWrite
---

# Prototype Builder Pipeline

You are orchestrating the complete prototype development process from a high-level app idea to working code. This command intelligently breaks down generic ideas into features, prioritises them for MVP development, and executes the full SDD pipeline.

## Memory Integration
- Check project CLAUDE.md for technology preferences and patterns
- Use any existing architectural templates or conventions
- Maintain consistency with established project standards

## Input
- **App Idea**: $ARGUMENTS (first argument - high-level description like "user facing coffee app")
- **Scope**: $ARGUMENTS (second argument - "mvp" or "full", defaults to "mvp")  
- **Tech Stack**: $ARGUMENTS (third argument - optional technology preferences)

## Your Task

### Phase 1: Intelligent Feature Analysis

**Break down the high-level idea into concrete features:**

```
Example: "user facing coffee app"
↓
Core Features Analysis:
- User authentication (login/register)
- Coffee menu browsing
- Order placement system
- Payment processing
- Order tracking
- User profile management
- Store locator
- Reviews and ratings
- Loyalty program
- Admin dashboard
```

**Feature Categorisation:**
- **MVP Core** (Essential for basic functionality)
- **MVP Enhanced** (Important for user experience)
- **Future Features** (Nice-to-have for full version)

### Phase 2: MVP Prioritisation Matrix

**Evaluate each feature using:**
- **User Impact** (High/Medium/Low)
- **Technical Complexity** (High/Medium/Low)
- **Business Value** (High/Medium/Low)
- **Development Time** (Days estimate)

**Create prioritised feature list:**

```markdown
# MVP Feature Priority Matrix

## Phase 1 - Core MVP (Week 1-2)
1. **User Authentication** - High Impact, Medium Complexity
2. **Coffee Menu Display** - High Impact, Low Complexity
3. **Basic Order Placement** - High Impact, High Complexity

## Phase 2 - Enhanced MVP (Week 3-4)
4. **Payment Integration** - High Value, High Complexity
5. **Order Status Tracking** - Medium Impact, Medium Complexity
6. **User Profile** - Medium Impact, Low Complexity

## Future Phases
- Store Locator, Reviews, Loyalty Program, Admin Dashboard
```

### Phase 3: Technology Stack Selection

**Analyse requirements and suggest optimal stack:**

```javascript
// Frontend Options Analysis
const techOptions = {
  simple: "React + Vite + TailwindCSS",
  mobile: "React Native + Expo",
  fullstack: "Next.js + TypeScript",
  rapid: "HTML + CSS + Vanilla JS"
};

// Backend Options
const backendOptions = {
  simple: "Node.js + Express + SQLite", 
  scalable: "Python + FastAPI + PostgreSQL",
  rapid: "Supabase + PostgREST",
  serverless: "Vercel Functions + PlanetScale"
};
```

### Phase 4: Pipeline Orchestration

**Execute coordinated command pipeline using Task tool:**

#### 4.1 Feature Specification Generation
```
For each MVP feature, spawn subagent:
- Task: "Generate detailed spec for {feature} in {app-context}"
- Use /spec command with feature-specific requirements
- Include user stories, acceptance criteria, and technical considerations
```

#### 4.2 Parallel Architecture Design  
```
- Task: "Design system architecture for {app-idea} MVP"
- Use /design command for overall system design
- Include database schema, API design, component structure
- Consider chosen technology stack constraints
```

#### 4.3 Implementation Planning
```
- Task: "Create implementation roadmap for {app-idea} MVP"
- Use /plan command for development task breakdown  
- Prioritise by dependency order and complexity
- Include testing and deployment considerations
```

#### 4.4 Code Generation
```
- Task: "Build {feature} implementation"
- Use /build command for each core feature
- Generate production-ready code with proper structure
- Include error handling and basic security
```

### Phase 5: Prototype Assembly

**Coordinate final prototype delivery:**

```markdown
# Prototype Delivery Structure

app-prototype/
├── README.md              # Setup and running instructions
├── ARCHITECTURE.md        # System design overview
├── MVP-PLAN.md           # Development roadmap
├── frontend/             # Client application
│   ├── src/
│   ├── public/
│   └── package.json
├── backend/              # Server application  
│   ├── api/
│   ├── models/
│   ├── tests/
│   └── requirements.txt
├── docs/                 # Generated specifications
│   ├── user-stories.md
│   ├── api-spec.md
│   └── deployment.md
└── scripts/              # Setup and deployment
    ├── setup.sh
    ├── dev.sh
    └── deploy.sh
```

## Feature Analysis Templates

### E-commerce App Template
```yaml
core_features:
  - user_authentication
  - product_catalog
  - shopping_cart
  - checkout_process
  - payment_integration

enhanced_features:
  - user_profiles
  - order_history
  - search_filtering
  - reviews_ratings
  
future_features:
  - wishlist
  - recommendations
  - admin_dashboard
  - analytics
```

### Social App Template  
```yaml
core_features:
  - user_registration
  - profile_creation
  - content_posting
  - social_feed
  - basic_interactions

enhanced_features:
  - messaging_system
  - friend_connections
  - notifications
  - content_discovery

future_features:
  - groups_communities
  - live_features
  - advanced_privacy
  - monetisation
```

### Productivity App Template
```yaml
core_features:
  - task_creation
  - task_management
  - basic_organisation
  - progress_tracking

enhanced_features:
  - collaboration
  - reminders_notifications
  - file_attachments
  - reporting

future_features:
  - automation
  - integrations
  - advanced_analytics
  - team_management
```

## Pipeline Execution Strategies

### MVP-First Approach (Default)
```bash
# 1. Rapid feature identification and prioritisation
# 2. Core feature specs only
# 3. Minimal viable architecture
# 4. Basic implementation with working prototype
# 5. Clear roadmap for enhancement
```

### Full Prototype Approach
```bash
# 1. Comprehensive feature analysis
# 2. Complete specification suite
# 3. Scalable architecture design
# 4. Full implementation pipeline
# 5. Production-ready codebase
```

### Rapid Validation Approach
```bash
# 1. Core user journey identification
# 2. Single-feature deep implementation
# 3. User feedback integration points
# 4. Iterative enhancement pathway
```

## Quality Gates

### Specification Quality
- [ ] All core features have clear user stories
- [ ] EARS notation requirements are complete
- [ ] Acceptance criteria are testable
- [ ] Non-functional requirements defined

### Architecture Quality
- [ ] Technology stack is appropriate for scope
- [ ] Database design supports core features
- [ ] API design follows REST principles
- [ ] Security considerations documented

### Implementation Quality  
- [ ] Code follows project standards
- [ ] Core features are functional
- [ ] Basic error handling implemented
- [ ] Setup documentation is clear

## Advanced Features

### Market Research Integration
```markdown
Before feature analysis, research:
- Competitor analysis for similar apps
- Market trends and user expectations
- Platform-specific considerations
- Monetisation strategies
```

### User Journey Mapping
```markdown
Map critical user flows:
- Onboarding experience
- Core value delivery path
- Engagement and retention hooks  
- Conversion optimisation points
```

### Technical Debt Prevention
```markdown
Build with future in mind:
- Modular architecture patterns
- Scalability considerations
- Testing framework setup
- Documentation standards
```

## Success Criteria

1. **Functional Prototype** - Core features working end-to-end
2. **Clear Architecture** - Well-documented system design
3. **Development Roadmap** - Prioritised feature enhancement plan
4. **Quality Standards** - Code meets project guidelines
5. **User Experience** - Intuitive interface and interactions
6. **Technical Foundation** - Scalable and maintainable codebase

## Example Execution

```bash
# Generate coffee app MVP
/prototype "user facing coffee app" mvp "React + Node.js"

# Full e-commerce prototype  
/prototype "online marketplace for handmade goods" full

# Rapid social app validation
/prototype "local community events app" mvp "mobile-first"
```

Execute the complete prototype development pipeline, from intelligent feature breakdown through working code delivery.