# Simplify XML variant .ksy files - remove problematic imports
# XML variants just store XML as strings, they don't need GFF imports

$ErrorActionPreference = "Stop"

Write-Host "Simplifying XML variant files..."

$xmlFiles = Get-ChildItem -Path "formats" -Filter "*_XML.ksy" -Recurse

foreach ($file in $xmlFiles) {
    Write-Host "Processing: $($file.Name)"
    
    $content = Get-Content $file.FullName -Raw
    
    # Remove imports section entirely
    $content = $content -replace '  imports:\s*\r?\n(\s*-[^\r\n]+\r?\n)+', ''
    
    Set-Content $file.FullName -Value $content -NoNewline
    Write-Host "  Removed imports from $($file.Name)"
}

Write-Host "`nDone! XML variants simplified."

