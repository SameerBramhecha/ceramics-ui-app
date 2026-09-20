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
$repoRoot = Split-Path -Parent $PSScriptRoot
$templatePath = Join-Path $repoRoot '.github/PULL_REQUEST_TEMPLATE.md'
$prBody = @"
## Stage
- [ ] specify
- [x] implement

## Description
This PR addresses issue #$IssueNumber and completes the implementation work for the requested change.

Notes:
- Use this as a soft enforcement mechanism: CI or workflows can add a failing check if Stage is missing later.
- Optionally auto-add labels based on the Stage via a GitHub Action.

Closes #$IssueNumber
"@

if (Test-Path $templatePath) {
    $templateContent = Get-Content -Path $templatePath -Raw
    $templateContent = $templateContent -replace '(?m)^\s*-\s*\[ \]\s*specify\s*$', '- [ ] specify'
    $templateContent = $templateContent -replace '(?m)^\s*-\s*\[ \]\s*implement\s*$', '- [x] implement'
    $templateContent = $templateContent -replace '\(Describe what this PR changes and why\)', "This PR addresses issue #$IssueNumber and completes the implementation work for the requested change."
    $templateContent = $templateContent.TrimEnd()
    $prBody = "$templateContent`n`nCloses #$IssueNumber"
}

$tmpFile = [System.IO.Path]::GetTempFileName()
try {
    Set-Content -Path $tmpFile -Value $prBody -Encoding UTF8
    gh pr create --title $prTitle --body-file $tmpFile
    if ($LASTEXITCODE -ne 0) {
        throw 'Pull request creation failed.'
    }
} finally {
    if (Test-Path $tmpFile) {
        Remove-Item $tmpFile -Force
    }
}

./scripts/Set-GitHubProjectStatus.ps1 -IssueNumber $IssueNumber -Status 'Review'
Write-Host "Pull request created and issue #$IssueNumber moved to Review."
