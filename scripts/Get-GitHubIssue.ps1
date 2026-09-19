Param(
    [Parameter(Mandatory = $true)]
    [int]$IssueNumber
)

$ErrorActionPreference = 'Stop'

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'GitHub CLI (gh) is required but was not found in PATH.'
}

$issue = gh issue view $IssueNumber --json number,title,body,state,url,labels,milestone,assignees,projectItems
if ($LASTEXITCODE -ne 0) {
    throw "Unable to fetch GitHub Issue #$IssueNumber."
}

$issue | ConvertTo-Json -Depth 20
