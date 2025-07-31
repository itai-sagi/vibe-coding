#!/bin/bash
# setup-claude-config.sh
# Setup script for Claude Code configuration

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the repository URL from command line or use a default
REPO_URL="${1:-https://github.com/itai-sagi/vibe-coding.git}"

echo -e "${GREEN}Claude Code Configuration Setup${NC}"
echo "================================"

# Check if ~/.claude already exists
if [ -d ~/.claude ]; then
    echo -e "${YELLOW}Warning: ~/.claude directory already exists.${NC}"
    read -p "Do you want to backup and replace it? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        backup_dir=~/.claude.backup.$(date +%Y%m%d_%H%M%S)
        mv ~/.claude "$backup_dir"
        echo -e "${GREEN}Backed up existing ~/.claude to $backup_dir${NC}"
    else
        echo -e "${RED}Setup cancelled.${NC}"
        exit 1
    fi
fi

# Clone the repository
echo -e "${GREEN}Cloning repository...${NC}"
if git clone "$REPO_URL" ~/.claude; then
    echo -e "${GREEN}Repository cloned successfully!${NC}"
else
    echo -e "${RED}Failed to clone repository. Please check the URL and try again.${NC}"
    exit 1
fi

# Navigate to the directory
cd ~/.claude || exit 1

# Remove files not needed for Claude Code configuration
echo -e "${GREEN}Cleaning up unnecessary files...${NC}"
rm -f README.md
rm -rf .git
rm -rf .idea
rm -f setup-claude-config.sh  # Remove this script if it was cloned

# Create a local backup of any existing CLAUDE.md in home directory
if [ -f ~/CLAUDE.md ]; then
    cp ~/CLAUDE.md ~/CLAUDE.md.backup.$(date +%Y%m%d_%H%M%S)
    echo -e "${YELLOW}Backed up existing ~/CLAUDE.md${NC}"
fi

# Verify the setup
echo -e "${GREEN}Verifying installation...${NC}"
if [ -f ~/.claude/CLAUDE.md ] && [ -d ~/.claude/agents ]; then
    echo -e "${GREEN}✓ CLAUDE.md found${NC}"
    echo -e "${GREEN}✓ Agent definitions found:${NC}"
    for agent in ~/.claude/agents/*.md; do
        if [ -f "$agent" ]; then
            agent_name=$(basename "$agent" .md)
            echo -e "  - $agent_name"
        fi
    done
    echo
    echo -e "${GREEN}Claude Code configuration setup complete!${NC}"
    echo
    echo "Your configuration includes:"
    echo "  - CLAUDE.md with project instructions"
    echo "  - Agent definitions in agents/"
    echo "  - Clean code documentation in docs/"
    echo "  - Code review checklists in checklists/"
    echo
    echo -e "${GREEN}You can now use Claude Code with your custom configuration!${NC}"
else
    echo -e "${RED}Setup verification failed. Please check the installation.${NC}"
    exit 1
fi