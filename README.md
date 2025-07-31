# Claude Code Configuration Repository

This repository contains comprehensive guidelines, best practices, and agent configurations for Claude Code. It's designed to be cloned and used as your `~/.claude` configuration directory.

## Quick Setup

### One-Line Setup

```bash
git clone https://github.com/YOUR_USERNAME/vibe-coding.git ~/.claude
```

### Setup Script

For a complete setup that removes unnecessary files:

```bash
#!/bin/bash
# setup-claude-config.sh

# Clone the repository to ~/.claude
git clone https://github.com/YOUR_USERNAME/vibe-coding.git ~/.claude

# Navigate to the directory
cd ~/.claude

# Remove files not needed for Claude Code configuration
rm -f README.md
rm -rf .git
rm -rf .idea

# Create a local backup of the original CLAUDE.md if one exists
if [ -f ~/CLAUDE.md ]; then
    cp ~/CLAUDE.md ~/CLAUDE.md.backup
    echo "Backed up existing ~/CLAUDE.md to ~/CLAUDE.md.backup"
fi

echo "Claude Code configuration setup complete!"
echo "Your configuration includes:"
echo "  - CLAUDE.md with project instructions"
echo "  - Agent definitions in agents/"
echo "  - Clean code documentation in docs/"
echo "  - Code review checklists in checklists/"
echo "  - Examples in examples/"
```

Save the script as `setup-claude-config.sh` and run:

```bash
chmod +x setup-claude-config.sh
./setup-claude-config.sh
```

## What's Included

### Configuration Files

- **CLAUDE.md**: Project-specific instructions that reference all documentation
- **agents/**: Specialized agent definitions
  - `data-analyst.md`: Data analysis and visualization expert
  - `backend-engineer.md`: Backend API and database specialist
  - `frontend-engineer.md`: UI/UX and web application developer
  - `architect.md`: System design and architecture expert

### Documentation Structure

```
├── CLAUDE.md                    # Main configuration file
├── agents/                      # Agent definitions
│   ├── architect.md
│   ├── backend-engineer.md
│   ├── data-analyst.md
│   └── frontend-engineer.md
├── docs/                        # Comprehensive documentation
│   ├── clean-code/             # Clean code principles
│   ├── development-workflow/   # Development processes
│   ├── tech-stack/            # Technology preferences
│   └── testing/               # Testing approaches
├── examples/                   # Code examples and templates
└── checklists/                # Quick reference checklists
```

## Using the Agents

The configured agents will be automatically available in Claude Code. They will be used proactively when:

- **data-analyst**: Working with data files, creating visualizations, or statistical analysis
- **backend-engineer**: Building APIs, designing databases, or server-side logic
- **frontend-engineer**: Creating UI components, handling state management, or styling
- **architect**: Designing systems, making technology decisions, or creating documentation

## Customization

After setup, you can customize:

1. **Edit CLAUDE.md** to add project-specific instructions
2. **Modify agents** in the `agents/` directory to fit your workflow
3. **Add new agents** by creating new `.md` files in `agents/` following the format
4. **Update documentation** in `docs/` to reflect your standards

## Manual Setup (Alternative)

If you prefer manual setup:

1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/vibe-coding.git
   ```

2. Copy configuration files:
   ```bash
   cp -r vibe-coding/CLAUDE.md ~/.claude/
   cp -r vibe-coding/agents ~/.claude/
   cp -r vibe-coding/docs ~/.claude/
   cp -r vibe-coding/checklists ~/.claude/
   cp -r vibe-coding/examples ~/.claude/
   ```

3. Remove the cloned repository:
   ```bash
   rm -rf vibe-coding
   ```

## Requirements

- Git installed on your system
- Claude Code CLI installed
- Write permissions to your home directory

## Support

For issues or improvements, please open an issue in the repository.