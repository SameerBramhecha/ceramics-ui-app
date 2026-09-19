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
    throw 'You must not create a feature branch while checked out on main. Switch to a non-main branch first.'
}

$issueTitle = gh issue view $IssueNumber --json title --jq '.title'
if ($LASTEXITCODE -ne 0) {
    throw "Issue #$IssueNumber does not exist or is not accessible."
}

$slug = ($issueTitle.ToLowerInvariant() -replace '[^a-z0-9]+', '-') -replace '-{2,}', '-' -replace '^-|-$', ''
$branchName = "feature/$IssueNumber-$slug"

if ($branchName.Length -gt 60) {
    $branchName = "feature/$IssueNumber-$($slug.Substring(0, [Math]::Min(40, $slug.Length)))"
}

git checkout -b $branchName
Write-Host "Created branch '$branchName' from '$currentBranch'."
