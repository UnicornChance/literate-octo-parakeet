#!/bin/bash

: '
Script responsible for cloning in external repository docs
to be used in uds docs site. The defined `repos` are the external repositories
that have a defined `docs/` directory and hugo defined markdown files. 

To include a new directory, add the repo followed by the branch or tag followed by
the target directory where that cloned repo should be stored for hugo to access it.

Example:
"<git clone url> <tag or branch> <target directory>"

hugo.toml entry:
[[module.mounts]]
source = "<target directory>/docs"
target = "content/<name of repo>"
'

# Define repositories to clone
repos=(
    "https://github.com/defenseunicorns v0.21.1 ./repo-docs/uds-core"
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
    echo -e "Cloned ${repo[0]}@${repo[1]} into ${repo[2]}\n"
done
