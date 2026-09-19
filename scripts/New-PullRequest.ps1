Param(
    [Parameter(Mandatory = $true)]
    [int]$IssueNumber
)

$ErrorActionPreference = 'Stop'

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'GitHub CLI (gh) is required but was not found in PATH.'
}

$currentBranch = git branch --show-current
if ($currentBranch -eq 'main') {
    throw 'Pull requests must be created from a feature branch, not from main.'
}

Write-Host "Pushing branch '$currentBranch' to origin..."
git push --set-upstream origin $currentBranch
if ($LASTEXITCODE -ne 0) {
    throw 'Failed to push the feature branch to origin.'
}

$prTitle = "Implement issue #$IssueNumber"
$prBody = @"
## Validation

- /speckit-analyze completed successfully
- /speckit-implement completed
- Local validation completed
- CI will run on this Pull Request

Closes #$IssueNumber
"@

gh pr create --title $prTitle --body $prBody --fill
if ($LASTEXITCODE -ne 0) {
    throw 'Pull request creation failed.'
}

./scripts/Set-GitHubProjectStatus.ps1 -IssueNumber $IssueNumber -Status 'Review'
Write-Host "Pull request created and issue #$IssueNumber moved to Review."
