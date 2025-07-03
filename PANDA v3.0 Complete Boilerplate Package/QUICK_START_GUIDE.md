# PANDA v3.0 Quick Start Guide
*Developed by FatStinkyPanda - Available at Github.com/FatStinkyPanda*

## Start Using PANDA in 5 Minutes

### For New Projects

#### Step 1: Create Your Project Folder
```bash
mkdir my-awesome-project
cd my-awesome-project
```

#### Step 2: Copy PANDA Files
Copy these essential files into your project:
- `PANDA_SYSTEM_v3.md` - The complete system specification
- `START_AI_DEVELOPMENT.txt` - AI instructions
- `AI_CONTINUATION_SCRIPT.txt` - Continuation scripts

#### Step 3: Create Initial Structure
```bash
# Create task directories
mkdir -p tasks/pending tasks/completed tasks/indexes
mkdir -p .panda/templates
mkdir -p metadata
mkdir -p docs

# Create config file
echo '{
  "version": "3.0.0",
  "project": {
    "name": "my-awesome-project",
    "type": "WebApp",
    "created": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'",
    "language": "TypeScript"
  },
  "limits": {
    "tasksPerFile": 25,
    "entriesPerIndex": 100
  }
}' > .panda/config.json
```

#### Step 4: Start Development with AI
Give this to any AI model (GPT-4, Claude, etc.):
```
I want to create a [describe your project]. Please read START_AI_DEVELOPMENT.txt 
and initialize this as a new PANDA v3.0 project. Create all necessary files 
and begin development.
```

### For Existing Projects

#### Step 1: Add PANDA to Your Project
Copy the PANDA files into your existing project root.

#### Step 2: Create MAIN_README.md
Document your project's current state, architecture, and goals.

#### Step 3: Initialize Task System
Create `tasks/TODO.md` with your current tasks:
```markdown
# TODO Tasks
> Project: My Existing Project
> Generated: 2025-01-28

### [PROJ-001] Add User Authentication
- **Priority**: HIGH
- **Status**: NOT_STARTED
- **Description**: Implement JWT-based authentication
```

#### Step 4: Continue with AI
```
This is an existing project. Please read START_AI_DEVELOPMENT.txt and continue 
development using PANDA v3.0. The current tasks are in TODO.md.
```

## Understanding PANDA Structure

### Essential Files

```
your-project/
├── PANDA_SYSTEM_v3.md          # System specification (reference)
├── START_AI_DEVELOPMENT.txt    # AI instructions
├── AI_CONTINUATION_SCRIPT.txt  # Continuation scripts
├── MAIN_README.md             # Your project blueprint
├── README.md                  # Living documentation
├── tasks/
│   ├── TODO.md               # Active tasks
│   ├── pending/              # Blocked tasks
│   │   ├── PENDING_INDEX.md
│   │   └── PENDING_001.md
│   └── completed/            # Finished tasks
│       ├── COMPLETED_INDEX.md
│       └── COMPLETED_001.md
└── .panda/
    └── config.json          # PANDA configuration
```

### How Tasks Flow

1. **Active Development**: Tasks in `TODO.md`
2. **Blocked**: Move to `tasks/pending/PENDING_XXX.md`
3. **Completed**: Move to `tasks/completed/COMPLETED_XXX.md`
4. **Automatic Management**: New files created at 25 tasks

## Common Commands for AI

### Start Fresh Project
```
Create a new [project type] using PANDA v3.0. Initialize all files and begin 
development.
```

### Continue Development
```
Continue developing this project using PANDA v3.0. Read START_AI_DEVELOPMENT.txt 
and work autonomously until production ready.
```

### Add New Feature
```
Add [feature description] to this PANDA project. Create appropriate tasks and 
implement following PANDA protocols.
```

### Fix Issues
```
Review this PANDA project for any issues or incomplete features. Generate tasks 
and fix problems following PANDA protocols.
```

## Best Practices

### 1. Let AI Handle File Management
- Don't manually edit task files
- Let AI move tasks between states
- Trust the automatic file creation

### 2. Provide Clear Requirements
- Be specific about what you want
- Include technical preferences
- Mention any constraints

### 3. Use Capable AI Models
- GPT-4 or Claude 3 recommended
- Provide sufficient context window
- Don't truncate files

### 4. Review Generated Code
- AI creates production-ready code
- Still review for your specific needs
- Test thoroughly before deployment

## Troubleshooting

### AI Seems Lost?
```
You're working on a PANDA v3.0 project. Please read PANDA_SYSTEM_v3.md and 
START_AI_DEVELOPMENT.txt to understand the system, then continue development.
```

### Tasks Not Moving?
```
Please move completed tasks from TODO.md to the appropriate COMPLETED file 
following PANDA v3.0 task management protocols.
```

### Need Fresh Tasks?
```
TODO.md is empty. Please analyze the project and generate new tasks based on 
missing features, test coverage, and documentation needs.
```

## Example: Web App in 30 Seconds

```bash
# Create project
mkdir task-tracker && cd task-tracker

# Copy PANDA files (assuming you have them in ~/panda-boilerplate)
cp ~/panda-boilerplate/* .

# Give to AI
"Create a task tracking web application using React and TypeScript. 
Use PANDA v3.0 to manage development. Initialize the project and 
begin implementation."
```

The AI will:
1. Create complete project structure
2. Set up React with TypeScript
3. Initialize PANDA task management
4. Create TODO.md with all tasks
5. Begin implementing features
6. Document everything properly

## Advanced Usage

### Custom Templates
Create `.panda/templates/` for your specific needs:
- `task-template.md` - Custom task format
- `metadata-template.md` - Custom metadata structure
- `component-template.tsx` - Code templates

### Automation Scripts
Add to `package.json`:
```json
{
  "scripts": {
    "panda:continue": "echo 'Copy AI_CONTINUATION_SCRIPT.txt content'",
    "panda:status": "head -20 tasks/TODO.md",
    "panda:completed": "ls -la tasks/completed/"
  }
}
```

### Integration with IDEs
- Use file watchers to track changes
- Set up snippets for task creation
- Configure search to include metadata

## Next Steps

1. **Try It Out**: Start with a small project
2. **Read the Docs**: Review PANDA_SYSTEM_v3.md for deep understanding
3. **Share Results**: Let others know about your experience
4. **Contribute**: Share improvements and templates

## Get Help

- **Documentation**: PANDA_SYSTEM_v3.md has complete details
- **Examples**: Review the example files included
- **Updates**: Check Github.com/FatStinkyPanda

---

*Start building better software with PANDA v3.0 today!*