Param(
    [Parameter(Mandatory = $true)]
    [int]$IssueNumber,

    [Parameter(Mandatory = $true)]
    [ValidateSet('Backlog', 'Ready', 'In Progress', 'Review', 'Done')]
    [string]$Status,

    [string]$ProjectOwner = $env:GH_PROJECT_OWNER,
    [int]$ProjectNumber = $env:GH_PROJECT_NUMBER
)

$ErrorActionPreference = 'Stop'

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw 'GitHub CLI (gh) is required but was not found in PATH.'
}

$configPath = Join-Path (Split-Path -Parent $PSScriptRoot) '.specify/project-config.json'
$projectConfig = $null
if (Test-Path $configPath) {
    try {
        $projectConfig = Get-Content -Path $configPath -Raw | ConvertFrom-Json
    } catch {
        $projectConfig = $null
    }
}

if ([string]::IsNullOrWhiteSpace($ProjectOwner)) {
    $ProjectOwner = if ($projectConfig -and $projectConfig.projectOwner) { [string]$projectConfig.projectOwner } else { '@me' }
}

if (-not $ProjectNumber) {
    if ($projectConfig -and $projectConfig.projectNumber) {
        $ProjectNumber = [int]$projectConfig.projectNumber
    } else {
        $ProjectNumber = 2
    }
}

$statusFieldName = if ($projectConfig -and $projectConfig.statusField) { [string]$projectConfig.statusField } else { 'Status' }

$issueState = gh issue view $IssueNumber --json state,url --jq '{state: .state, url: .url}' 2>$null
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($issueState)) {
    throw "Issue #$IssueNumber does not exist or is not accessible."
}

$issue = $issueState | ConvertFrom-Json
if ($issue.state -eq 'CLOSED') {
    throw "Issue #$IssueNumber is already closed; it cannot be moved to a new project status."
}

$projectLookup = gh project view $ProjectNumber --owner $ProjectOwner --format json 2>$null
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($projectLookup)) {
    throw "Project $ProjectOwner/$ProjectNumber was not found. Ensure the GitHub Project exists before running this script."
}

$project = $projectLookup | ConvertFrom-Json
$projectId = $project.id

# Add the issue to the project if it is not already linked.
$issueUrl = $issue.url
$itemList = gh project item-list $ProjectNumber --owner $ProjectOwner --format json 2>$null
if ($LASTEXITCODE -eq 0 -and -not [string]::IsNullOrWhiteSpace($itemList)) {
    $itemPayload = $itemList | ConvertFrom-Json
    $items = if ($itemPayload.PSObject.Properties.Name -contains 'items') { $itemPayload.items } else { $itemPayload }
    $existingItem = $items | Where-Object {
        $_.content -and $_.content.url -eq $issueUrl
    } | Select-Object -First 1
} else {
    $existingItem = $null
}

if (-not $existingItem) {
    $addResult = gh project item-add $ProjectNumber --owner $ProjectOwner --url $issueUrl --format json 2>$null
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($addResult)) {
        throw "Failed to add issue #$IssueNumber to project $ProjectOwner/$ProjectNumber."
    }

    $newItem = $addResult | ConvertFrom-Json
    $existingItem = $newItem
}

$itemId = $existingItem.id
if ([string]::IsNullOrWhiteSpace($itemId)) {
    throw "Could not determine the project item ID for issue #$IssueNumber."
}

$fieldList = gh project field-list $ProjectNumber --owner $ProjectOwner --format json 2>$null
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($fieldList)) {
    throw "Failed to load fields for project $ProjectOwner/$ProjectNumber."
}

$fieldPayload = $fieldList | ConvertFrom-Json
$fields = if ($fieldPayload.PSObject.Properties.Name -contains 'fields') { $fieldPayload.fields } else { $fieldPayload }
$statusField = $fields | Where-Object { $_.name -eq $statusFieldName } | Select-Object -First 1
if (-not $statusField) {
    throw "Project field '$statusFieldName' was not found in $ProjectOwner/$ProjectNumber."
}

$statusOption = $statusField.options | Where-Object { $_.name -eq $Status } | Select-Object -First 1
if (-not $statusOption) {
    throw "Project field '$statusFieldName' does not contain the option '$Status'."
}

$update = gh project item-edit --id $itemId --project-id $projectId --field-id $statusField.id --single-select-option-id $statusOption.id --format json 2>$null
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($update)) {
    throw "Failed to update issue #$IssueNumber to '$Status' in project $ProjectOwner/$ProjectNumber."
}

Write-Host "Issue #$IssueNumber status set to '$Status' in project $ProjectOwner/$ProjectNumber."
