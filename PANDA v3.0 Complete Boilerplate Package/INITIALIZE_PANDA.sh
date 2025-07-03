#!/bin/bash

# PANDA v3.0 Project Initialization Script
# Developed by FatStinkyPanda - Available at Github.com/FatStinkyPanda
# 
# This script sets up a complete PANDA v3.0 project structure and copies
# all necessary files from the boilerplate package
# 
# Usage: ./INITIALIZE_PANDA.sh [project-name] [project-path]
# Example: ./INITIALIZE_PANDA.sh my-awesome-app ~/projects/

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Default values
PROJECT_NAME="${1:-my-panda-project}"
PROJECT_PATH="${2:-.}"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${BLUE}🐼 PANDA v3.0 Complete Project Initializer${NC}"
echo -e "${BLUE}==========================================${NC}\n"

# Function to copy file with backtick handling
copy_file_safe() {
    local source="$1"
    local dest="$2"
    local filename="$3"
    
    # Remove backticks from filename if present
    local clean_filename="${filename//\`/}"
    
    if [ -f "$source/$filename" ]; then
        cp "$source/$filename" "$dest/$clean_filename"
        echo -e "   ${GREEN}✓${NC} Copied: $clean_filename"
    else
        # Try without backticks if not found
        if [ -f "$source/$clean_filename" ]; then
            cp "$source/$clean_filename" "$dest/$clean_filename"
            echo -e "   ${GREEN}✓${NC} Copied: $clean_filename"
        else
            echo -e "   ${YELLOW}⚠${NC}  Not found: $filename"
        fi
    fi
}

# Validate we're in the boilerplate directory or have access to files
echo -e "${CYAN}📍 Checking boilerplate files...${NC}"

# List of required boilerplate files (with backticks as shown in directory listing)
REQUIRED_FILES=(
    "PANDA_SYSTEM_v3\`.md"
    "START_AI_DEVELOPMENT\`.txt"
    "AI_CONTINUATION_SCRIPT\`.txt"
)

# Check if we have access to boilerplate files
BOILERPLATE_FOUND=false
if [ -f "$SCRIPT_DIR/PANDA_SYSTEM_v3\`.md" ] || [ -f "$SCRIPT_DIR/PANDA_SYSTEM_v3.md" ]; then
    BOILERPLATE_FOUND=true
    echo -e "${GREEN}✓ Found boilerplate files in current directory${NC}"
fi

if [ "$BOILERPLATE_FOUND" = false ]; then
    echo -e "${RED}Error: Cannot find PANDA boilerplate files!${NC}"
    echo -e "${YELLOW}Please run this script from the PANDA boilerplate directory${NC}"
    exit 1
fi

# Create project directory
FULL_PROJECT_PATH="$PROJECT_PATH/$PROJECT_NAME"
if [ -d "$FULL_PROJECT_PATH" ]; then
    echo -e "${YELLOW}Warning: Directory '$FULL_PROJECT_PATH' already exists${NC}"
    read -p "Continue and merge with existing directory? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo -e "${GREEN}Creating project directory: $FULL_PROJECT_PATH${NC}"
    mkdir -p "$FULL_PROJECT_PATH"
fi

cd "$FULL_PROJECT_PATH"
echo -e "${CYAN}📁 Working in: $(pwd)${NC}\n"

# Create directory structure
echo -e "${BLUE}📁 Creating PANDA directory structure...${NC}"
mkdir -p tasks/pending tasks/completed tasks/indexes
mkdir -p .panda/templates
mkdir -p metadata/src
mkdir -p docs/architecture docs/api docs/guides
mkdir -p src tests
echo -e "${GREEN}✓ Directory structure created${NC}\n"

# Copy essential PANDA files
echo -e "${BLUE}📄 Copying essential PANDA files...${NC}"
copy_file_safe "$SCRIPT_DIR" "." "PANDA_SYSTEM_v3\`.md"
copy_file_safe "$SCRIPT_DIR" "." "START_AI_DEVELOPMENT\`.txt"
copy_file_safe "$SCRIPT_DIR" "." "AI_CONTINUATION_SCRIPT\`.txt"

# Copy documentation files
echo -e "\n${BLUE}📚 Copying documentation files...${NC}"
for file in "PANDA_README\`.md" "QUICK_START_GUIDE\`.md" "PANDA_TEMPLATES\`.md" \
            "PANDA_TROUBLESHOOTING\`.md" "PANDA_FAQ\`.md" "PANDA_BEST_PRACTICES\`.md" \
            "PANDA_SETUP_GUIDE\`.md" "PANDA_VERSION_HISTORY\`.md"; do
    copy_file_safe "$SCRIPT_DIR" "docs/" "$file"
done

# Copy example files
echo -e "\n${BLUE}📖 Copying example files...${NC}"
mkdir -p docs/examples
for file in "EXAMPLE_MAIN_README\`.md" "EXAMPLE_PROJECT_README\`.md" \
            "EXAMPLE_TODO\`.md" "EXAMPLE_PENDING\`.md" "EXAMPLE_COMPLETED_001\`.md" \
            "EXAMPLE_METADATA\`.md"; do
    copy_file_safe "$SCRIPT_DIR" "docs/examples/" "$file"
done

# Create .panda/config.json
echo -e "\n${BLUE}⚙️  Creating configuration...${NC}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
cat > .panda/config.json << EOF
{
  "version": "3.0.0",
  "project": {
    "name": "$PROJECT_NAME",
    "type": "WebApp",
    "created": "$TIMESTAMP",
    "language": "TypeScript"
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
  }
}
EOF
echo -e "${GREEN}✓ Configuration created${NC}"

# Create initial TODO.md
echo -e "\n${BLUE}📝 Creating initial task files...${NC}"
cat > tasks/TODO.md << EOF
# TODO Tasks
> Project: $PROJECT_NAME
> Generated: $(date '+%Y-%m-%d %H:%M:%S')
> Sprint: Project Initialization
> Total Active Tasks: 5

## 🎯 Sprint Goal
Initialize $PROJECT_NAME with complete architecture and development environment

---

## 🔴 CRITICAL Priority Tasks

### [INIT-001] Create Project Blueprint (MAIN_README.md)
- **Priority**: CRITICAL
- **Status**: NOT_STARTED
- **Estimated**: 2 hours
- **Dependencies**: None
- **Blocks**: All other tasks
- **Description**: Create comprehensive project blueprint in MAIN_README.md defining vision, architecture, and standards
- **Acceptance Criteria**:
  - [ ] Project vision clearly defined
  - [ ] Core features listed with descriptions
  - [ ] Technical architecture documented
  - [ ] Development standards specified
  - [ ] Success metrics defined
  - [ ] Technology stack justified

**Technical Notes**: 
Use the template from docs/examples/EXAMPLE_MAIN_README.md as reference. This document should remain stable throughout development.

---

### [INIT-002] Set Up Development Environment
- **Priority**: CRITICAL
- **Status**: NOT_STARTED
- **Estimated**: 3 hours
- **Dependencies**: [INIT-001]
- **Blocks**: [INIT-003, INIT-004]
- **Description**: Configure complete development environment based on project requirements
- **Acceptance Criteria**:
  - [ ] Package manager configured (npm/yarn/pnpm)
  - [ ] TypeScript configuration created
  - [ ] Build tools set up (Vite/Webpack/etc)
  - [ ] Linting and formatting configured (ESLint + Prettier)
  - [ ] Git repository initialized with .gitignore
  - [ ] Pre-commit hooks configured
  - [ ] Environment variables structure defined

**Technical Notes**: 
Ensure all configurations follow strict mode and production best practices. No warnings allowed in development.

---

## 🟡 HIGH Priority Tasks

### [INIT-003] Create Initial Project Structure
- **Priority**: HIGH
- **Status**: NOT_STARTED
- **Estimated**: 4 hours
- **Dependencies**: [INIT-002]
- **Blocks**: [INIT-005]
- **Description**: Create complete project file structure based on architecture
- **Acceptance Criteria**:
  - [ ] Source directories created with proper organization
  - [ ] Entry point files created
  - [ ] Base configuration files added
  - [ ] Initial test structure set up
  - [ ] Component/module structure defined
  - [ ] Metadata templates created

**Technical Notes**: 
Follow the structure defined in MAIN_README.md. Every source file needs corresponding metadata documentation.

### [INIT-004] Implement Core Architecture
- **Priority**: HIGH
- **Status**: NOT_STARTED
- **Estimated**: 6 hours
- **Dependencies**: [INIT-002]
- **Blocks**: Feature development
- **Description**: Implement foundational architecture patterns and utilities
- **Acceptance Criteria**:
  - [ ] Error handling system implemented
  - [ ] Logging infrastructure created
  - [ ] Base API/service structure defined
  - [ ] Common utilities implemented
  - [ ] Type definitions created
  - [ ] Dependency injection configured (if applicable)

**Technical Notes**: 
Focus on reusable, well-tested foundations. All code must include comprehensive error handling.

---

## 🟢 NORMAL Priority Tasks

### [INIT-005] Set Up Testing Framework
- **Priority**: NORMAL
- **Status**: NOT_STARTED
- **Estimated**: 3 hours
- **Dependencies**: [INIT-003]
- **Blocks**: Test writing
- **Description**: Configure comprehensive testing infrastructure
- **Acceptance Criteria**:
  - [ ] Unit test framework configured
  - [ ] Integration test setup completed
  - [ ] E2E test framework ready (if applicable)
  - [ ] Coverage reporting configured
  - [ ] Test file structure created
  - [ ] Initial smoke tests written

**Technical Notes**: 
Aim for 90% coverage target. Configure CI-friendly test reporting.

---

## Sprint Notes
- Start with INIT-001 immediately - it blocks everything else
- Use example files in docs/examples/ as references
- Maintain PANDA compliance throughout
- No placeholder code - production quality only
- Update documentation with every change

## Definition of Done
- [ ] Code is production-ready (no TODOs or placeholders)
- [ ] All tests pass with >90% coverage
- [ ] Documentation is complete and current
- [ ] Metadata files created for all code
- [ ] Task moved to COMPLETED with full details
- [ ] Integration points documented
- [ ] No linting errors or warnings
EOF
echo -e "${GREEN}✓ Initial TODO.md created with 5 starter tasks${NC}"

# Create empty index files
echo -e "\n${BLUE}📇 Creating index files...${NC}"
cat > tasks/pending/PENDING_INDEX.md << EOF
# PENDING Tasks Index
> Index Created: $(date '+%Y-%m-%d %H:%M:%S')
> Last Updated: $(date '+%Y-%m-%d %H:%M:%S')
> Total Indexed Files: 0
> Total Tasks Tracked: 0
> Index Entries: [0/100]

## Index Statistics
- Oldest Pending Task: N/A
- Newest Pending Task: N/A
- Average Blocking Duration: N/A
- Most Common Blocker: N/A

## Quick Navigation
- [By Date Range](#by-date-range)
- [By Task ID](#by-task-id)
- [By Blocking Reason](#by-blocking-reason)
- [By Component](#by-component)

---

## Index Entries

*No pending tasks yet. Tasks become pending when blocked.*

---

## By Date Range
*No entries yet*

## By Task ID
*No entries yet*

## By Blocking Reason
*No entries yet*

## By Component
*No entries yet*

---
*When this index reaches 100 entries, it will be archived and a new index created.*
*PANDA v3.0 - Developed by FatStinkyPanda*
EOF

cat > tasks/completed/COMPLETED_INDEX.md << EOF
# COMPLETED Tasks Index
> Index Created: $(date '+%Y-%m-%d %H:%M:%S')
> Last Updated: $(date '+%Y-%m-%d %H:%M:%S')
> Total Indexed Files: 0
> Total Tasks Tracked: 0
> Index Entries: [0/100]

## Index Statistics
- First Completion: N/A
- Latest Completion: N/A
- Average Completion Time: N/A
- Success Rate: N/A

## Quick Navigation
- [By Date Range](#by-date-range)
- [By Task ID](#by-task-id)
- [By Component](#by-component)
- [By Developer/AI](#by-developer)

---

## Index Entries

*No completed tasks yet. Tasks appear here when moved from TODO.md.*

---

## By Date Range
*No entries yet*

## By Task ID
*No entries yet*

## By Component
*No entries yet*

## By Developer/AI
*No entries yet*

---
*When this index reaches 100 entries, it will be archived and a new index created.*
*PANDA v3.0 - Developed by FatStinkyPanda*
EOF
echo -e "${GREEN}✓ Index files created${NC}"

# Create .gitignore if it doesn't exist
if [ ! -f .gitignore ]; then
    echo -e "\n${BLUE}📄 Creating .gitignore...${NC}"
    cat > .gitignore << 'EOF'
# Dependencies
node_modules/
vendor/
venv/
__pycache__/
*.pyc

# Build outputs
dist/
build/
out/
target/
*.exe
*.dll
*.so
*.dylib

# Environment files
.env
.env.local
.env.*.local
*.env

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store

# OS files
Thumbs.db
desktop.ini

# Logs
logs/
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Test coverage
coverage/
.coverage
*.cover
.pytest_cache/
.nyc_output/

# PANDA temporary files
.panda/temp/
.panda/cache/
.panda/backup/

# But keep these PANDA files
!.panda/config.json
!.panda/templates/
EOF
    echo -e "${GREEN}✓ .gitignore created${NC}"
fi

# Create initial README.md
echo -e "\n${BLUE}📚 Creating project README.md...${NC}"
cat > README.md << EOF
# $PROJECT_NAME
> Current Version: 0.0.1-alpha
> Last Updated: $(date '+%Y-%m-%d')
> Development Stage: Initialization
> Managed by PANDA v3.0

## 🚧 Current Status

### Project Initialization Phase
- ⏳ **Architecture Design** - Defining project structure and patterns
- ⏳ **Environment Setup** - Configuring development tools
- ⏳ **Core Implementation** - Building foundation components

### Recent Changes
- [$(date '+%Y-%m-%d')]: Project initialized with PANDA v3.0
- [$(date '+%Y-%m-%d')]: Created initial task structure (5 tasks)

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ (or specify your requirements)
- Package manager (npm/yarn/pnpm)
- Git

### Installation
\`\`\`bash
# Clone repository
git clone [repository-url]
cd $PROJECT_NAME

# Install dependencies (after package.json is created)
npm install

# Set up environment
cp .env.example .env
# Edit .env with your configuration
\`\`\`

### Development
\`\`\`bash
# Start development server
npm run dev

# Run tests
npm test

# Build for production
npm run build
\`\`\`

## 📋 Development Workflow

This project uses **PANDA v3.0** for comprehensive development management:

### Task Management
- **Active Tasks**: \`/tasks/TODO.md\` - Current sprint work
- **Blocked Tasks**: \`/tasks/pending/\` - Tasks awaiting resolution
- **Completed Tasks**: \`/tasks/completed/\` - Finished work with details

### Documentation
- **Project Blueprint**: \`MAIN_README.md\` - Stable vision document
- **Living Documentation**: \`README.md\` - Current state (this file)
- **Code Documentation**: \`/metadata/\` - File-level documentation

### AI Development
To continue development with AI:
\`\`\`
"Read START_AI_DEVELOPMENT.txt and continue developing this project using PANDA v3.0."
\`\`\`

## 🏗️ Project Structure
\`\`\`
$PROJECT_NAME/
├── src/                     # Source code
├── tests/                   # Test files
├── docs/                    # Documentation
│   ├── architecture/        # Architecture decisions
│   ├── api/                 # API documentation
│   ├── examples/            # PANDA examples
│   └── guides/              # Development guides
├── tasks/                   # PANDA task management
│   ├── TODO.md              # Active tasks (5 initial)
│   ├── pending/             # Blocked tasks
│   └── completed/           # Finished tasks
├── metadata/                # PANDA code documentation
└── .panda/                  # PANDA configuration
    └── config.json          # Project settings
\`\`\`

## 📊 Project Metrics
- **Total Tasks**: 5
- **Completed**: 0 (0%)
- **Pending**: 0
- **Active**: 5

## 🔗 Resources
- [PANDA Documentation](./docs/PANDA_README.md)
- [Quick Start Guide](./docs/QUICK_START_GUIDE.md)
- [Troubleshooting](./docs/PANDA_TROUBLESHOOTING.md)
- [Examples](./docs/examples/)

---
*Powered by PANDA v3.0 - Developed by FatStinkyPanda*
EOF
echo -e "${GREEN}✓ Project README.md created${NC}"

# Create MAIN_README.md placeholder
echo -e "\n${BLUE}📋 Creating MAIN_README.md placeholder...${NC}"
cat > MAIN_README.md << EOF
# $PROJECT_NAME - Project Blueprint
> PANDA v3.0 Project Blueprint
> Created: $(date '+%Y-%m-%d')
> Type: [Define Project Type]
> Primary Language: [Define Language]

## ⚠️ IMPORTANT: Complete This Blueprint First!

This is your project's blueprint document. Task [INIT-001] requires you to complete this file.
Reference \`docs/examples/EXAMPLE_MAIN_README.md\` for a comprehensive example.

## Project Vision
[DEFINE YOUR PROJECT'S VISION AND PURPOSE]

## Core Features
1. **[Feature 1]**: [Description]
2. **[Feature 2]**: [Description]
3. **[Feature 3]**: [Description]

## Technical Architecture
[DEFINE YOUR TECHNICAL ARCHITECTURE]

## Development Standards
[DEFINE YOUR QUALITY STANDARDS AND PRACTICES]

---
*This blueprint document should remain stable throughout development.*
*See README.md for current implementation status.*
EOF
echo -e "${GREEN}✓ MAIN_README.md placeholder created${NC}"

# Summary
echo -e "\n${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ PANDA v3.0 initialization completed successfully!${NC}"
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

echo -e "${BLUE}📁 Project Location:${NC} $FULL_PROJECT_PATH\n"

echo -e "${BLUE}📋 Created Structure:${NC}"
echo "   ├── 📄 Core PANDA Files"
echo "   │   ├── PANDA_SYSTEM_v3.md"
echo "   │   ├── START_AI_DEVELOPMENT.txt"
echo "   │   └── AI_CONTINUATION_SCRIPT.txt"
echo "   ├── 📁 tasks/"
echo "   │   ├── TODO.md (5 initial tasks)"
echo "   │   ├── pending/"
echo "   │   │   └── PENDING_INDEX.md"
echo "   │   └── completed/"
echo "   │       └── COMPLETED_INDEX.md"
echo "   ├── 📁 docs/ (all documentation)"
echo "   ├── 📁 .panda/"
echo "   │   └── config.json"
echo "   ├── 📄 README.md (current state)"
echo "   └── 📄 MAIN_README.md (blueprint)"

echo -e "\n${YELLOW}🎯 Next Steps:${NC}"
echo "1. ${CYAN}Complete MAIN_README.md${NC} (Task INIT-001)"
echo "   - Define your project vision"
echo "   - Document architecture"
echo "   - Set quality standards"
echo ""
echo "2. ${CYAN}Start AI Development:${NC}"
echo "   Give this to any AI model:"
echo -e "   ${GREEN}\"Read START_AI_DEVELOPMENT.txt and begin developing this project.\"${NC}"
echo ""
echo "3. ${CYAN}Or Continue Manually:${NC}"
echo "   - Work through tasks in TODO.md"
echo "   - Follow PANDA protocols"
echo "   - Update documentation as you go"

echo -e "\n${BLUE}📚 Available Documentation:${NC}"
echo "   • Quick Start: docs/QUICK_START_GUIDE.md"
echo "   • Templates: docs/PANDA_TEMPLATES.md"
echo "   • Examples: docs/examples/"
echo "   • FAQ: docs/PANDA_FAQ.md"

echo -e "\n${GREEN}🚀 Your PANDA v3.0 project is ready for development!${NC}"
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

# Attempt to open project in editor
if command -v code &> /dev/null; then
    read -p "Open in VS Code? (Y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        code "$FULL_PROJECT_PATH"
    fi
fi
