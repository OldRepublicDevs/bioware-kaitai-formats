# Compile all .ksy files to Python

$ErrorActionPreference = "Continue"
$outputDir = "src/python/kaitai_generated"

# Create output directory
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

# Find all .ksy files
$ksyFiles = Get-ChildItem -Path "formats" -Filter "*.ksy" -Recurse | Sort-Object FullName

Write-Host "Found $($ksyFiles.Count) .ksy files"
Write-Host ("=" * 80)

$successes = 0
$failures = 0
$failedFiles = @()

foreach ($file in $ksyFiles) {
    $relPath = $file.FullName.Replace("$PWD\formats\", "")
    Write-Host "Compiling: $relPath... " -NoNewline
    
    $output = & kaitai-struct-compiler -t python -d $outputDir $file.FullName 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        if ($output) {
            Write-Host "OK (with warnings)" -ForegroundColor Yellow
        } else {
            Write-Host "OK" -ForegroundColor Green
        }
        $successes++
    } else {
        Write-Host "FAILED" -ForegroundColor Red
        $failures++
        $failedFiles += [PSCustomObject]@{
            File = $relPath
            Output = $output -join "`n"
        }
    }
}

# Print summary
Write-Host ("=" * 80)
Write-Host "`nSummary: $successes succeeded, $failures failed"

# Print failures
if ($failures -gt 0) {
    Write-Host "`n$("=" * 80)"
    Write-Host "FAILURES:"
    Write-Host ("=" * 80)
    foreach ($failed in $failedFiles) {
        Write-Host "`n$($failed.File):"
        Write-Host $failed.Output
    }
    exit 1
}

exit 0

