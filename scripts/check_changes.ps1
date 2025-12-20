# Helper script to check if generated files have changed
# Returns 0 if no changes, 1 if changes detected

param(
    [Parameter(Mandatory=$true)]
    [string]$GeneratedDir,

    [string]$GitBranch = "main"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $GeneratedDir)) {
    Write-Host "Generated directory does not exist: $GeneratedDir" -ForegroundColor Yellow
    exit 1
}

# Check if we're in a git repository
try {
    $gitRoot = & git rev-parse --show-toplevel 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Not in a git repository" -ForegroundColor Yellow
        exit 1
    }
} catch {
    Write-Host "Not in a git repository" -ForegroundColor Yellow
    exit 1
}

# Check if there are any uncommitted changes or differences from the branch
$status = & git status --porcelain $GeneratedDir 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to check git status"
    exit 1
}

if ($status) {
    Write-Host "Changes detected in $GeneratedDir" -ForegroundColor Yellow
    Write-Host $status
    exit 1
}

# Also check if branch exists and compare
try {
    $branchExists = & git rev-parse --verify "$GitBranch" 2>&1
    if ($LASTEXITCODE -eq 0) {
        $diff = & git diff --quiet "$GitBranch" -- $GeneratedDir 2>&1
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Differences detected between current state and $GitBranch" -ForegroundColor Yellow
            & git diff --stat "$GitBranch" -- $GeneratedDir
            exit 1
        }
    }
} catch {
    # Branch doesn't exist yet, that's okay
    Write-Host "Branch $GitBranch does not exist yet" -ForegroundColor Gray
}

Write-Host "No changes detected in $GeneratedDir" -ForegroundColor Green
exit 0

