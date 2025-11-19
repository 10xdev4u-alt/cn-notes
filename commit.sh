#!/bin/bash

# Script to commit each modified and untracked file individually
# Run this in your CNx directory
# It will stage and commit one file at a time with a message like "Updated [filename]"

# First, get list of modified files
modified_files=$(git status --porcelain | grep '^ M' | awk '{print $2}')

# Get list of untracked files
untracked_files=$(git status --porcelain | grep '^??' | awk '{print $2}')

# Function to commit a file
commit_file() {
  local file=$1
  git add "$file"
  git commit -m "Updated $file" || echo "Failed to commit $file"
  echo "Committed: $file"
}

# Commit modified files one by one
for file in $modified_files; do
  commit_file "$file"
done

# Commit untracked files one by one
for file in $untracked_files; do
  commit_file "$file"
done

echo "All individual commits done! Run 'git log' to verify."
