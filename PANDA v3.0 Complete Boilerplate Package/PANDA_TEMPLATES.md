# PANDA v3.0 Templates
*Developed by FatStinkyPanda - Available at Github.com/FatStinkyPanda*

This file contains all the templates needed to implement PANDA v3.0 in your project.

## Table of Contents
1. [TODO.md Template](#todomd-template)
2. [Task File Templates](#task-file-templates)
3. [Index File Templates](#index-file-templates)
4. [Metadata Template](#metadata-template)
5. [README Templates](#readme-templates)
6. [Configuration Template](#configuration-template)

---

## TODO.md Template

```markdown
# TODO Tasks
> Project: [PROJECT_NAME]
> Generated: [YYYY-MM-DD HH:MM:SS]
> Sprint: [Current Sprint Name]
> Total Active Tasks: [COUNT]

## 🎯 Sprint Goal
[Clear description of what this sprint aims to achieve]

## 📊 Sprint Metrics
- **Capacity**: [X] hours
- **Committed**: [Y] hours  
- **Available**: [Z] hours
- **Velocity**: [Tasks/Day]

---

## 🔴 CRITICAL Priority Tasks

### [TASK-001] Task Title Here
- **Priority**: CRITICAL
- **Status**: NOT_STARTED
- **Assigned**: [Developer/AI Name]
- **Estimated**: [X hours]
- **Dependencies**: [TASK-IDs or None]
- **Blocks**: [TASK-IDs that depend on this]

**Description**: 
[Clear description of what needs to be done]

**Acceptance Criteria**:
- [ ] Specific measurable outcome 1
- [ ] Specific measurable outcome 2
- [ ] Specific measurable outcome 3

**Technical Notes**:
[Any implementation guidance, gotchas, or important details]

**Files to Create/Modify**:
- CREATE: /path/to/new/file.ext
- MODIFY: /path/to/existing/file.ext
- DELETE: /path/to/remove/file.ext

---

## 🟡 HIGH Priority Tasks

### [TASK-002] Another Task Title
- **Priority**: HIGH
- **Status**: IN_PROGRESS
- **Started**: 2025-01-28 14:30:00
[Continue with same format...]

---

## 🟢 NORMAL Priority Tasks

[Tasks formatted as above]

---

## 🔵 LOW Priority Tasks

[Tasks formatted as above]

---

## Task Notes
- Tasks are ordered by priority, then by dependencies
- Update status as work progresses
- Move to PENDING when blocked
- Move to COMPLETED when done
```

---

## Task File Templates

### PENDING_XXX.md Template

```markdown
# PENDING Tasks - File [XXX]
> File Created: [YYYY-MM-DD HH:MM:SS]
> Last Updated: [YYYY-MM-DD HH:MM:SS]
> Task Count: [0/25]
> Status: ACTIVE
> Previous File: PENDING_[XXX-1].md or None
> Next File: [To be created when full]

## File Summary
- Total Tasks: 0
- Date Range: [Awaiting first task]
- File Position: [XXX] of [Total Files]
- Primary Blocker Types: [TBD]

## Quick Navigation
- [Tasks 1-5](#tasks-1-5)
- [Tasks 6-10](#tasks-6-10)
- [Tasks 11-15](#tasks-11-15)
- [Tasks 16-20](#tasks-16-20)
- [Tasks 21-25](#tasks-21-25)

---

## Tasks 1-5

<!-- Tasks will be added here as they are moved to pending -->

---
*When this file reaches 25 tasks, PENDING_[XXX+1].md will be created automatically.*
```

### COMPLETED_XXX.md Template

```markdown
# COMPLETED Tasks - File [XXX]
> File Created: [YYYY-MM-DD HH:MM:SS]
> Last Updated: [YYYY-MM-DD HH:MM:SS]
> Task Count: [0/25]
> Status: ACTIVE
> Previous File: COMPLETED_[XXX-1].md or None
> Next File: [To be created when full]

## File Summary
- Total Tasks: 0
- Date Range: [Awaiting first task]
- File Position: [XXX] of [Total Files]
- Completion Time Average: [TBD]

## Quick Navigation
- [Tasks 1-5](#tasks-1-5)
- [Tasks 6-10](#tasks-6-10)
- [Tasks 11-15](#tasks-11-15)
- [Tasks 16-20](#tasks-16-20)
- [Tasks 21-25](#tasks-21-25)

---

## Tasks 1-5

<!-- Tasks will be added here as they are completed -->

---
*When this file reaches 25 tasks, COMPLETED_[XXX+1].md will be created automatically.*
```

### Individual Task Entry Template (for PENDING/COMPLETED files)

```markdown
### Task #[NNN] (File Position: [X]/25)
- **Task ID**: [PROJECT-XXXX]
- **Title**: [Task Title from TODO.md]
- **Added to [Pending|Completed]**: [YYYY-MM-DD HH:MM:SS]
- **[Blocked Since|Completed On]**: [YYYY-MM-DD HH:MM:SS]
- **Status**: [PENDING-BLOCKED|COMPLETED-SUCCESS|COMPLETED-PARTIAL]
- **Priority**: [CRITICAL|HIGH|NORMAL|LOW]
- **Time Tracking**:
  - Estimated: [X hours]
  - Actual: [Y hours]
  - Variance: [+/- Z hours]

#### Files Changed/To Change:
  - **CREATE**: 
    - `/path/to/new/file1.ext` - [Brief description]
    - `/path/to/new/file2.ext` - [Brief description]
  - **MODIFY**: 
    - `/path/to/existing/file1.ext` - [What was changed]
    - `/path/to/existing/file2.ext` - [What was changed]
  - **DELETE**: 
    - `/path/to/removed/file.ext` - [Reason for deletion]
  - **METADATA**: 
    - `/metadata/path/to/file1.metadata.md` - [Created|Updated]

#### Integration Points:
  - **Established**: 
    - `[Component A]` → `[Component B]` ([Connection Type])
  - **Modified**: 
    - `[Service X]` ← `[Module Y]` ([Change Description])
  - **Removed**: 
    - `[Old Integration]` (Replaced by: [New Integration])

#### Task Context:
- **Original Location**: TODO.md (Lines [XXX-YYY])
- **Dependencies Met**: [Yes|No - List unmet dependencies]
- **Spawned Tasks**: [PROJECT-XXXY, PROJECT-XXXZ]
- **Related Tasks**: [PROJECT-XXXA, PROJECT-XXXB]

#### [Blocking Details|Completion Notes]:
[For Pending: Detailed explanation of blockers and requirements]
[For Completed: Summary of implementation and any important notes]

#### Metrics:
- **Lines of Code**: +[XXX] -[YYY]
- **Test Coverage**: [Before: XX%] → [After: YY%]
- **Files Touched**: [X]
- **Integration Points**: [Y]

---
```

---

## Index File Templates

### PENDING_INDEX.md Template

```markdown
# PENDING Tasks Index
> Index Created: [YYYY-MM-DD HH:MM:SS]
> Last Updated: [YYYY-MM-DD HH:MM:SS]
> Total Indexed Files: [X]
> Total Tasks Tracked: [Y]
> Index Entries: [0/100]

## Index Statistics
- Oldest Pending Task: [Date or N/A]
- Newest Pending Task: [Date or N/A]  
- Average Blocking Duration: [X days]
- Most Common Blocker: [Type]

## Quick Navigation
- [By Date Range](#by-date-range)
- [By Task ID](#by-task-id)
- [By Blocking Reason](#by-blocking-reason)
- [By Component](#by-component)

---

## Index Entries

<!-- Entries will be added as tasks are moved to pending -->

---

## By Date Range
<!-- Grouped by month/week -->

## By Task ID
<!-- Alphabetical list -->

## By Blocking Reason
<!-- Grouped by blocker type -->

## By Component
<!-- Grouped by system component -->

---
*When this index reaches 100 entries, it will be archived and a new index created.*
```

### COMPLETED_INDEX.md Template

```markdown
# COMPLETED Tasks Index
> Index Created: [YYYY-MM-DD HH:MM:SS]
> Last Updated: [YYYY-MM-DD HH:MM:SS]
> Total Indexed Files: [X]
> Total Tasks Tracked: [Y]
> Index Entries: [0/100]

## Index Statistics
- First Completion: [Date or N/A]
- Latest Completion: [Date or N/A]
- Average Completion Time: [X hours]
- Success Rate: [XX%]

## Quick Navigation
- [By Date Range](#by-date-range)
- [By Task ID](#by-task-id)
- [By Component](#by-component)
- [By Developer/AI](#by-developer)

---

## Index Entries

<!-- Entries will be added as tasks are completed -->

---

## By Date Range
<!-- Grouped by month/week -->

## By Task ID  
<!-- Alphabetical list -->

## By Component
<!-- Grouped by system component -->

## By Developer/AI
<!-- Grouped by who completed -->

---
*When this index reaches 100 entries, it will be archived and a new index created.*
```

### Index Entry Template

```markdown
### Entry #[NNN]
- **Task ID**: [PROJECT-XXXX]
- **Task Title**: [Concise Title]
- **Task File**: [PENDING|COMPLETED]_[XXX].md
- **Position in File**: [X]/25
- **Date Added**: [YYYY-MM-DD HH:MM:SS]
- **Task Type**: [Feature|Bug|Refactor|Documentation|Test]
- **Component**: [Primary Component]
- **Status**: [PENDING-BLOCKED|COMPLETED-SUCCESS]

#### Files Affected:
  - Created: [X] files
  - Modified: [Y] files  
  - Deleted: [Z] files

#### Quick Summary: 
[One-line description of the task]

#### Cross-References:
  - **Blocks**: [TASK-IDs]
  - **Blocked By**: [TASK-IDs]
  - **Related**: [TASK-IDs]

---
```

---

## Metadata Template

### File: `/metadata/src/components/Example.metadata.md`

```markdown
# Metadata: Example Component
> File: /src/components/Example.tsx
> Created: [YYYY-MM-DD HH:MM:SS]
> Last Modified: [YYYY-MM-DD HH:MM:SS]
> Last Modified By: [Task ID or Developer]

## Component Overview
**Purpose**: [Clear description of what this component does]
**Type**: [Functional Component|Class Component|Hook|Utility|Service]
**Criticality**: [Core|Important|Standard|Utility]

## Dependencies

### Imports
```typescript
import React from 'react';
import { useContext } from 'react';
import { AppContext } from '../contexts/AppContext';
import { Button } from './Button';
import { validateInput } from '../utils/validation';
```

### External Dependencies
- `react`: Core React functionality
- `axios`: HTTP requests (if used)
- [Other npm packages]

### Internal Dependencies
- `AppContext`: Global state management
- `Button`: UI component
- `validateInput`: Input validation utility

## Exports

### Named Exports
```typescript
export { Example };
export type { ExampleProps };
```

### Default Export
```typescript
export default Example;
```

## Integration Points

### State Management
- **Reads**: `user`, `theme` from AppContext
- **Writes**: `updateUser` action
- **Local State**: `isLoading`, `error`

### Events Emitted
- `onSubmit`: Fired when form is submitted
- `onCancel`: Fired when operation cancelled

### Events Handled  
- `onClick`: Button click handler
- `onChange`: Input change handler

### API Connections
- `POST /api/examples`: Create new example
- `GET /api/examples/:id`: Fetch example details

## Props Interface
```typescript
interface ExampleProps {
  id: string;
  title: string;
  onComplete: (result: Result) => void;
  className?: string;
}
```

## Error Handling
- **Try-Catch Blocks**: API calls wrapped
- **Error Boundaries**: Component wrapped in ErrorBoundary
- **Validation**: Input validated before submission
- **User Feedback**: Toast notifications for errors

## Performance Considerations
- **Memoization**: Component wrapped in React.memo
- **Lazy Loading**: Loaded on demand
- **Debouncing**: Search input debounced 300ms
- **Virtual Scrolling**: List items virtualized

## Testing Requirements
- **Unit Tests**: Props, state changes, event handlers
- **Integration Tests**: API calls, context updates
- **E2E Tests**: User flow completion
- **Coverage Target**: 90%

## Accessibility
- **ARIA Labels**: All interactive elements labeled
- **Keyboard Navigation**: Tab order logical
- **Screen Reader**: Announces state changes
- **Color Contrast**: WCAG AA compliant

## Security Considerations
- **Input Sanitization**: All user input sanitized
- **XSS Prevention**: No dangerouslySetInnerHTML
- **CSRF Protection**: Token included in requests

## Related Files
- `/src/components/Example.test.tsx` - Test file
- `/src/styles/Example.module.css` - Styles
- `/docs/components/Example.md` - User documentation

## Change History
- [TASK-001] - Initial creation
- [TASK-045] - Added error handling
- [TASK-089] - Performance optimization

## Notes
[Any additional important information about this file]

---
*This metadata is maintained by PANDA v3.0*
```

---

## README Templates

### MAIN_README.md Template (Project Blueprint)

```markdown
# [PROJECT_NAME]
> PANDA v3.0 Project Blueprint
> Created: [YYYY-MM-DD]
> Type: [Web App|API|Library|CLI|Other]
> Primary Language: [Language]

## Project Vision
[Clear, concise description of what this project aims to achieve. This section should remain stable throughout development.]

## Core Features
1. **[Feature 1]**: [Description]
2. **[Feature 2]**: [Description]
3. **[Feature 3]**: [Description]

## Technical Architecture

### Technology Stack
- **Frontend**: [Framework/Library]
- **Backend**: [Framework/Language]
- **Database**: [Type and Product]
- **Testing**: [Framework]
- **Deployment**: [Platform]

### System Architecture
```
[ASCII or simple diagram showing system components]
```

### Key Design Decisions
1. **[Decision 1]**: [Rationale]
2. **[Decision 2]**: [Rationale]

## Development Standards

### Code Quality Requirements
- TypeScript strict mode enabled
- 90% minimum test coverage
- ESLint + Prettier enforced
- No console.logs in production

### Documentation Requirements
- Every file has metadata
- All APIs documented
- Integration points mapped
- Change history maintained

### Performance Targets
- Initial load: <3 seconds
- API response: <200ms average
- Lighthouse score: 90+

## Project Structure
```
project-root/
├── src/               # Source code
├── tests/             # Test files
├── docs/              # Documentation
├── metadata/          # PANDA metadata files
├── tasks/             # PANDA task management
└── .panda/            # PANDA configuration
```

## Getting Started

### Prerequisites
- [Requirement 1]
- [Requirement 2]

### Installation
```bash
[Installation commands]
```

### Development
```bash
[Development commands]
```

## PANDA Integration

This project uses PANDA v3.0 for development management:
- Task tracking in `/tasks/`
- Metadata in `/metadata/`
- AI development via `START_AI_DEVELOPMENT.txt`

---
*This blueprint defines the project vision and should remain stable. See README.md for current implementation status.*
```

### README.md Template (Living Documentation)

```markdown
# [PROJECT_NAME]
> Current Version: [X.Y.Z]
> Last Updated: [YYYY-MM-DD]
> Development Stage: [Alpha|Beta|RC|Production]

## Current Status

### Completed Features
- ✅ [Feature 1] - [Brief description]
- ✅ [Feature 2] - [Brief description]
- 🚧 [Feature 3] - [In progress, 70% complete]
- ⏳ [Feature 4] - [Not started]

### Recent Changes
- [YYYY-MM-DD]: [Change description] ([TASK-ID])
- [YYYY-MM-DD]: [Change description] ([TASK-ID])

## Quick Start

### Installation
```bash
git clone [repository]
cd [project]
npm install
```

### Running the Project
```bash
npm run dev     # Development mode
npm run build   # Production build
npm test        # Run tests
```

## Development Guide

### Active Development
See `/tasks/TODO.md` for current sprint tasks.

### Contributing
1. Check TODO.md for available tasks
2. Update task status when starting
3. Follow PANDA documentation standards
4. Move task to completed when done

### Project Statistics
- Total Tasks Completed: [X]
- Current Sprint Progress: [Y/Z tasks]
- Test Coverage: [XX%]
- Build Status: [Passing|Failing]

## Architecture Overview

### Current Implementation
[Description of what's actually built, not planned]

### API Endpoints (if applicable)
- `GET /api/resource` - [Description]
- `POST /api/resource` - [Description]

### Database Schema (if applicable)
[Current schema or link to documentation]

## Known Issues
- [Issue 1] - [Description] ([TASK-ID] for fix)
- [Issue 2] - [Description] ([TASK-ID] for fix)

## Deployment

### Current Deployment
- Environment: [Development|Staging|Production]
- URL: [If deployed]
- Last Deploy: [YYYY-MM-DD]

### Deployment Instructions
[Step-by-step deployment guide]

---
*This documentation reflects current implementation. See MAIN_README.md for project vision.*
```

---

## Configuration Template

### .panda/config.json

```json
{
  "version": "3.0.0",
  "project": {
    "name": "[PROJECT_NAME]",
    "type": "[WebApp|API|Library|CLI|Other]",
    "created": "[YYYY-MM-DDTHH:MM:SSZ]",
    "language": "[TypeScript|JavaScript|Python|Java|Other]",
    "framework": "[React|Vue|Express|FastAPI|Other]"
  },
  "limits": {
    "tasksPerFile": 25,
    "entriesPerIndex": 100,
    "maxFileSize": "100KB",
    "maxIndexSize": "200KB"
  },
  "automation": {
    "autoArchive": true,
    "autoIndex": true,
    "compressArchives": false,
    "generateReports": true
  },
  "templates": {
    "task": ".panda/templates/task.md",
    "metadata": ".panda/templates/metadata.md",
    "component": ".panda/templates/component.tsx"
  },
  "development": {
    "testCommand": "npm test",
    "buildCommand": "npm run build",
    "lintCommand": "npm run lint",
    "formatCommand": "npm run format"
  },
  "integrations": {
    "git": {
      "enabled": true,
      "autoCommit": false,
      "commitPrefix": "[PANDA]"
    },
    "ci": {
      "enabled": false,
      "provider": "github|gitlab|jenkins",
      "configPath": ".github/workflows/panda.yml"
    }
  },
  "metadata": {
    "autoGenerate": true,
    "includeTests": true,
    "includePerformance": true,
    "includeSecurity": true
  }
}
```

---

## Using These Templates

### Initial Setup
1. Copy templates to your project
2. Replace placeholders with actual values
3. Remove sections that don't apply
4. Add project-specific sections as needed

### Customization
- Modify templates to match your needs
- Keep core structure intact
- Add custom fields as required
- Save customizations in `.panda/templates/`

### Automation
Create scripts to generate files from templates:
```bash
#!/bin/bash
# create-pending-file.sh
NEXT_NUM=$(ls tasks/pending/PENDING_*.md 2>/dev/null | wc -l | xargs expr 1 +)
PADDED_NUM=$(printf "%03d" $NEXT_NUM)
cp templates/PENDING_XXX.md tasks/pending/PENDING_$PADDED_NUM.md
sed -i "s/\[XXX\]/$PADDED_NUM/g" tasks/pending/PENDING_$PADDED_NUM.md
```

---

*These templates form the foundation of PANDA v3.0 documentation system*
*Developed by FatStinkyPanda*