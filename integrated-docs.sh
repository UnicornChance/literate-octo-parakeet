#!/bin/bash

# Define repositories to clone
repos=(
    "git@github.com:defenseunicorns/uds-identity-config v0.4.2 ./repo-docs/uds-identity-config"
    "git@github.com:defenseunicorns/uds-core v0.22.0 ./repo-docs/uds-core"
    "git@github.com:defenseunicorns/uds-cli v0.10.3 ./repo-docs/uds-cli"
)

# Function to clone a repository
clone_repo() {
    repo_url="$1"
    branch="$2"
    target_dir="$3"
    
    # Remove existing cloned directory if it exists
    if [ -d "$target_dir" ]; then
        echo "Removing existing cloned dir: $target_dir"
        rm -rf "$target_dir"
    fi
    
    # Clone the repository with specific branch/tag
    git clone --branch "$branch" --single-branch "$repo_url" "$target_dir" > /dev/null 2>&1
}

# Loop through each repository and clone it
for repo_info in "${repos[@]}"; do
    # Split the repo_info string into url, branch, and target_dir
    IFS=' ' read -r -a repo <<< "$repo_info"
    clone_repo "${repo[0]}" "${repo[1]}" "${repo[2]}"
    echo -e "Cloned ${repo[0]} into ${repo[2]}\n"
done
