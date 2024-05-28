// integrated-docs.js
const { execSync } = require('child_process');
const simpleGit = require('simple-git');
const fs = require('fs');

// Define repositories and their branches/tags, renovate depends on url and then branch being defined
const repos = [
    {
        url: 'defenseunicorns/uds-identity-config.git',
        branch: 'uds-identity-docs',
        name: 'uds-identity-config'
    },
    {
        url: 'UnicornChance/redesigned-lamp.git',
        branch: 'v1.0.7',
        name: 'uds-core'
    },
    {
        url: 'defenseunicorns/uds-cli.git',
        branch: 'uds-cli-docs',
        name: 'uds-cli'
    }
];

const targetFolder = './repo-docs/';

// Function to clone a repository
const cloneRepo = async (repoUrl, branch, name) => {
    const targetDir = targetFolder + name;
    const git = simpleGit();
    if (fs.existsSync(targetDir)) {
        execSync(`rm -rf ${targetDir}`);
    }
    await git.clone('git@github.com:'+repoUrl, targetDir, ['--branch', branch, '--single-branch']);
};

// Clone each repository
(async () => {
    for (const repo of repos) {
        await cloneRepo(repo.url, repo.branch, repo.name);
        console.log(`Cloned ${repo.url} into ${targetFolder}${repo.name}`);
    }
})();



// NOTES

// Make sure to update the hugo.toml file with a module mount for each new repo
// could also add the logic here to create that mount

// original npm script poc
//"setup": "rm -rf ./repo-docs && git clone --branch uds-identity-docs --single-branch git@github.com:defenseunicorns/uds-identity-config.git ./repo-docs/uds-identity-config && git clone --branch v1.0.7 --single-branch git@github.com:UnicornChance/redesigned-lamp.git ./repo-docs/uds-core && git clone --branch uds-cli-docs --single-branch git@github.com:defenseunicorns/uds-cli.git ./repo-docs/uds-cli && npm run start",