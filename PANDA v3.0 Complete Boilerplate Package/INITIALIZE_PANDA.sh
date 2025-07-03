#!/bin/bash

# PANDA v3.0 Project Initialization Script
# Developed by FatStinkyPanda - Available at Github.com/FatStinkyPanda
# 
# This script quickly sets up a PANDA v3.0 project structure
# Usage: ./INITIALIZE_PANDA.sh [project-name]

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Default values
PROJECT_NAME="${1:-my-panda-project}"
PROJECT_TYPE="WebApp"
LANGUAGE="TypeScript"

echo -e "${BLUE}🐼 PANDA v3.0 Project Initializer${NC}"
echo -e "${BLUE}===================================${NC}\n"

# Check if we're in an empty directory or creating a new one
if [ -n "$1" ]; then
    if [ -d "$PROJECT_NAME" ]; then
        echo -e "${RED}Error: Directory '$PROJECT_NAME' already exists${NC}"
        exit 1
    fi
    echo -e "${GREEN}Creating project directory: $PROJECT_NAME${NC}"
    mkdir -p "$PROJECT_NAME"
    cd "$PROJECT_NAME"
else
    # Check if current directory is empty (except for this script and PANDA files)
    FILE_COUNT=$(ls -1a | grep -v '^\.\|PANDA\|INITIALIZE_PANDA.sh' | wc -l)
    if [ $FILE_COUNT -gt 0 ]; then
        echo -e "${YELLOW}Warning: Current directory is not empty${NC}"
        read -p "Continue anyway? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
fi

echo -e "${GREEN}Setting up PANDA v3.0 structure...${NC}\n"

# Create directory structure
echo "📁 Creating directories..."
mkdir -p tasks/pending tasks/completed tasks/indexes
mkdir -p .panda/templates
mkdir -p metadata/src
mkdir -p docs/architecture docs/api docs/guides
mkdir -p src tests

# Create .panda/config.json
echo "⚙️  Creating configuration..."
cat > .panda/config.json << 'EOF'
{
  "version": "3.0.0",
  "project": {
    "name": "PROJECT_NAME_PLACEHOLDER",
    "type": "PROJECT_TYPE_PLACEHOLDER",
    "created": "TIMESTAMP_PLACEHOLDER",
    "language": "LANGUAGE_PLACEHOLDER"
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
  }
}
EOF

# Replace placeholders
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
sed -i.bak "s/PROJECT_NAME_PLACEHOLDER/$PROJECT_NAME/g" .panda/config.json
sed -i.bak "s/PROJECT_TYPE_PLACEHOLDER/$PROJECT_TYPE/g" .panda/config.json
sed -i.bak "s/TIMESTAMP_PLACEHOLDER/$TIMESTAMP/g" .panda/config.json
sed -i.bak "s/LANGUAGE_PLACEHOLDER/$LANGUAGE/g" .panda/config.json
rm .panda/config.json.bak

# Create initial TODO.md
echo "📝 Creating initial task files..."
cat > tasks/TODO.md << EOF
# TODO Tasks
> Project: $PROJECT_NAME
> Generated: $(date '+%Y-%m-%d %H:%M:%S')
> Sprint: Project Initialization
> Total Active Tasks: 3

## 🎯 Sprint Goal
Initialize project structure and set up development environment

---

## 🔴 CRITICAL Priority Tasks

### [INIT-001] Create Project Blueprint (MAIN_README.md)
- **Priority**: CRITICAL
- **Status**: NOT_STARTED
- **Estimated**: 2 hours
- **Dependencies**: None
- **Description**: Create comprehensive project blueprint in MAIN_README.md defining vision, architecture, and standards
- **Acceptance Criteria**:
  - [ ] Project vision clearly defined
  - [ ] Core features listed
  - [ ] Technical architecture documented
  - [ ] Development standards specified

---

## 🟡 HIGH Priority Tasks

### [INIT-002] Set Up Development Environment
- **Priority**: HIGH
- **Status**: NOT_STARTED
- **Estimated**: 3 hours
- **Dependencies**: [INIT-001]
- **Description**: Configure development environment based on project requirements
- **Acceptance Criteria**:
  - [ ] Package manager configured
  - [ ] Build tools set up
  - [ ] Linting and formatting configured
  - [ ] Git repository initialized

### [INIT-003] Create Initial Project Structure
- **Priority**: HIGH
- **Status**: NOT_STARTED
- **Estimated**: 2 hours
- **Dependencies**: [INIT-002]
- **Description**: Create basic project file structure
- **Acceptance Criteria**:
  - [ ] Source directories created
  - [ ] Configuration files added
  - [ ] Basic entry point created
  - [ ] Initial tests set up

---

## Task Notes
- Begin with INIT-001 to establish project vision
- Use PANDA templates for all documentation
- Ensure all code includes proper error handling
- No placeholders or TODO comments in code
EOF

# Create empty index files
echo "📇 Creating index files..."
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

---

## Index Entries

*No pending tasks yet*

---
*When this index reaches 100 entries, it will be archived and a new index created.*
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

---

## Index Entries

*No completed tasks yet*

---
*When this index reaches 100 entries, it will be archived and a new index created.*
EOF

# Create .gitignore if it doesn't exist
if [ ! -f .gitignore ]; then
    echo "📄 Creating .gitignore..."
    cat > .gitignore << 'EOF'
# Dependencies
node_modules/
vendor/
venv/
__pycache__/

# Build outputs
dist/
build/
out/
*.exe
*.dll
*.so
*.dylib

# Environment files
.env
.env.local
.env.*.local

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~

# OS files
.DS_Store
Thumbs.db

# Logs
logs/
*.log

# Test coverage
coverage/
.coverage
*.cover
.pytest_cache/

# PANDA temporary files
.panda/temp/
.panda/cache/

# But keep these PANDA files
!.panda/config.json
!.panda/templates/
EOF
fi

# Create initial README.md
echo "📚 Creating README.md..."
cat > README.md << EOF
# $PROJECT_NAME
> Current Version: 0.0.1
> Last Updated: $(date '+%Y-%m-%d')
> Development Stage: Initialization
> Powered by PANDA v3.0

## Current Status

### Project Setup Phase
- ⏳ Project structure creation
- ⏳ Development environment setup
- ⏳ Initial documentation

### Recent Changes
- [$(date '+%Y-%m-%d')]: Project initialized with PANDA v3.0

## Quick Start

### Prerequisites
- [Specify requirements]

### Installation
\`\`\`bash
# Clone repository
git clone [repository-url]
cd $PROJECT_NAME

# Install dependencies
[package-manager] install
\`\`\`

### Development
See \`/tasks/TODO.md\` for current tasks.

## Project Structure
\`\`\`
$PROJECT_NAME/
├── src/                  # Source code
├── tests/                # Test files
├── docs/                 # Documentation
├── tasks/                # PANDA task management
├── metadata/             # PANDA metadata files
└── .panda/              # PANDA configuration
\`\`\`

## Development Workflow

This project uses PANDA v3.0 for development management:
- Active tasks: \`/tasks/TODO.md\`
- Blocked tasks: \`/tasks/pending/\`
- Completed tasks: \`/tasks/completed/\`

To continue development with AI:
\`\`\`
"Read START_AI_DEVELOPMENT.txt and continue developing this project."
\`\`\`

---
*Powered by PANDA v3.0 - Developed by FatStinkyPanda*
EOF

# Create reminder file
echo "📋 Creating setup reminder..."
cat > COMPLETE_SETUP.md << EOF
# 🐼 PANDA v3.0 Setup Almost Complete!

## ✅ What's Been Done
- Created directory structure
- Initialized task management system
- Created configuration files
- Set up initial documentation

## ⚠️ Required: Copy PANDA Core Files

You need to copy these files from your PANDA boilerplate:
1. **PANDA_SYSTEM_v3.md** - Core system specification
2. **START_AI_DEVELOPMENT.txt** - AI instructions
3. **AI_CONTINUATION_SCRIPT.txt** - Continuation scripts

## 📝 Next Steps

1. Copy the required PANDA files mentioned above
2. Create MAIN_README.md with your project vision
3. Update .panda/config.json with your project details
4. Start development:
   \`\`\`
   Give to AI: "Read START_AI_DEVELOPMENT.txt and begin developing this project"
   \`\`\`

## 🚀 Quick Start Command
\`\`\`bash
echo "Read START_AI_DEVELOPMENT.txt and begin developing this project. Start with task [INIT-001] to create the project blueprint."
\`\`\`

---
*Remember: PANDA's power comes from following the system completely!*
EOF

# Summary
echo -e "\n${GREEN}✅ PANDA v3.0 structure initialized successfully!${NC}\n"
echo -e "${BLUE}📁 Created Structure:${NC}"
echo "   └── tasks/"
echo "       ├── TODO.md (3 initial tasks)"
echo "       ├── pending/"
echo "       │   └── PENDING_INDEX.md"
echo "       └── completed/"
echo "           └── COMPLETED_INDEX.md"
echo "   └── .panda/"
echo "       └── config.json"
echo "   └── metadata/"
echo "   └── docs/"
echo "   └── src/"
echo "   └── tests/"
echo -e "\n${YELLOW}⚠️  IMPORTANT: Read COMPLETE_SETUP.md for required next steps${NC}"
echo -e "\n${BLUE}Required files to copy:${NC}"
echo "   • PANDA_SYSTEM_v3.md"
echo "   • START_AI_DEVELOPMENT.txt"
echo "   • AI_CONTINUATION_SCRIPT.txt"
echo -e "\n${GREEN}🚀 Ready to start development with PANDA v3.0!${NC}\n"

# Open reminder in default editor if available
if command -v code &> /dev/null; then
    code COMPLETE_SETUP.md
elif command -v open &> /dev/null; then
    open COMPLETE_SETUP.md
elif command -v xdg-open &> /dev/null; then
    xdg-open COMPLETE_SETUP.md
fi