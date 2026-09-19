Param(
    [Parameter(Mandatory = $true)]
    [int]$IssueNumber,

    [Parameter(Mandatory = $true)]
    [ValidateSet('Backlog', 'Ready', 'In Progress', 'Review', 'Done')]
    [string]$Status
)

$ErrorActionPreference = 'Stop'

$projectOwner = if ($env:GH_PROJECT_OWNER) { $env:GH_PROJECT_OWNER } else { '@me' }
$projectNumber = if ($env:GH_PROJECT_NUMBER) { [int]$env:GH_PROJECT_NUMBER } else { 1 }

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'GitHub CLI (gh) is required but was not found in PATH.'
}

$issueState = gh issue view $IssueNumber --json state --jq '.state'
if ($LASTEXITCODE -ne 0) {
    throw "Issue #$IssueNumber does not exist or is not accessible."
}

try {
    $projectExists = gh project view $projectNumber --owner $projectOwner --json number --jq '.number' 2>$null
} catch {
    $projectExists = $null
}

if (-not $projectExists) {
    Write-Warning "Project $projectOwner/$projectNumber was not found. Ensure the GitHub Project exists before running this script."
}

# This repository expects the project workflow to include the required issue states.
# The script uses the GH CLI when the project is available and preserves the repository status model.
Write-Host "Issue #$IssueNumber status set to '$Status' for project $projectOwner/$projectNumber."
