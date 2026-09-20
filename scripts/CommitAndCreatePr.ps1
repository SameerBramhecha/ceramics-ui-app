Param(
    [Parameter(Mandatory = $true)]
    [int]$IssueNumber,

    [string]$CommitMessage,

    [switch]$SkipPr
)

$ErrorActionPreference = 'Stop'

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw 'Git is required but was not found in PATH.'
}

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'GitHub CLI (gh) is required but was not found in PATH.'
}

$currentBranch = git branch --show-current
if ([string]::IsNullOrWhiteSpace($currentBranch) -or $currentBranch -eq 'main') {
    throw 'You must be on a feature branch to commit and create a pull request.'
}

$issueTitle = gh issue view $IssueNumber --json title --jq '.title' 2>$null
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($issueTitle)) {
    throw "Issue #$IssueNumber does not exist or is not accessible."
}

$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host 'No working tree changes to commit.'
    return
}

$message = if ([string]::IsNullOrWhiteSpace($CommitMessage)) {
    "Implement issue #$IssueNumber"
} else {
    $CommitMessage
}

git add -A
git commit -m $message
if ($LASTEXITCODE -ne 0) {
    throw 'Git commit failed.'
}

Write-Host "Committed changes on '$currentBranch' with message: $message"

if (-not $SkipPr) {
    ./scripts/New-PullRequest.ps1 -IssueNumber $IssueNumber
}
