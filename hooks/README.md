# Git Hooks

This directory contains Git hook templates for version management in the project.

## Available Hooks

### pre-commit
- Automatically increments the patch version in `version.txt` when committing directly to master/main branch
- Updates format: `major.minor.patch` (e.g., 2.1.5 → 2.1.6)

### post-merge
- Automatically increments the patch version in `version.txt` when merging into master/main branch
- Creates a new commit with the version bump
- Updates format: `major.minor.patch` (e.g., 2.1.5 → 2.1.6)

## Installation

To install these hooks, copy them to your `.git/hooks` directory and make them executable:

```bash
cp hooks/pre-commit .git/hooks/
cp hooks/post-merge .git/hooks/
chmod +x .git/hooks/pre-commit
chmod +x .git/hooks/post-merge
```
