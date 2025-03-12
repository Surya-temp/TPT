#!/bin/bash

# Navigate to the repository directory
cd /home/dev078/SURYA/ || { echo "Failed to navigate to repository directory."; exit 1; }

# Ensure we're on the master branch (if not already)
git checkout master || { echo "Failed to switch to master branch."; exit 1; }

# Stage all changes
git add . || { echo "Failed to stage changes."; exit 1; }

# Commit changes with a timestamp message
git commit -m "N8 Push: $(date '+%Y-%m-%d %H:%M:%S')" || { echo "Commit failed."; exit 1; }

# Push changes to the remote repository
git push origin master || { echo "Push failed. Please check for errors."; exit 1; }

echo "Changes successfully pushed."

