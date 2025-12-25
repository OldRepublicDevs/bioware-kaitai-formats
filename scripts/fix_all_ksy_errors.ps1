# Fix all .ksy compilation errors

$ErrorActionPreference = "Stop"

Write-Host "Fixing all .ksy compilation errors..."
Write-Host ("=" * 80)

# Fix 1: XML variant imports (lowercase to uppercase)
Write-Host "Fix 1: Updating XML variant imports..."
$xmlFiles = Get-ChildItem -Path "formats\GFF\Generics" -Filter "*_XML.ksy" -Recurse

foreach ($file in $xmlFiles) {
    $content = Get-Content $file.FullName -Raw
    $content = $content -replace '- \.\./\.\./gff/gff', '- ../../GFF/GFF'
    $content = $content -replace '- \.\./\.\./xml/gff_xml', '- ../../GFF/XML/GFF_XML'
    Set-Content $file.FullName -Value $content -NoNewline
    Write-Host "  Fixed: $($file.Name)"
}

# Fix 2: Boolean operators (&&  and ||  -> and/or)
Write-Host "`nFix 2: Replacing boolean operators..."
$allKsyFiles = Get-ChildItem -Path "formats" -Filter "*.ksy" -Recurse

foreach ($file in $allKsyFiles) {
    $content = Get-Content $file.FullName -Raw
    $original = $content
    
    # Replace && with and
    $content = $content -replace '(\s)&&(\s)', '$1and$2'
    
    # Replace || with or
    $content = $content -replace '(\s)\|\|(\s)', '$1or$2'
    
    if ($content -ne $original) {
        Set-Content $file.FullName -Value $content -NoNewline
        Write-Host "  Fixed: $($file.Name)"
    }
}

# Fix 3: TLK_XML and LIP_XML imports
Write-Host "`nFix 3: Fixing TLK_XML and LIP_XML..."
$tlkXml = "formats\TLK\TLK_XML.ksy"
if (Test-Path $tlkXml) {
    $content = Get-Content $tlkXml -Raw
    # Remove invalid imports section
    $content = $content -replace 'imports:\s*\r?\n', ''
    Set-Content $tlkXml -Value $content -NoNewline
    Write-Host "  Fixed: TLK_XML.ksy"
}

$lipXml = "formats\LIP\LIP_XML.ksy"
if (Test-Path $lipXml) {
    $content = Get-Content $lipXml -Raw
    # Remove invalid imports section
    $content = $content -replace 'imports:\s*\r?\n', ''
    Set-Content $lipXml -Value $content -NoNewline
    Write-Host "  Fixed: LIP_XML.ksy"
}

Write-Host "`n$("=" * 80)"
Write-Host "All fixes applied!"
Write-Host "Run compile_all_ksy.ps1 to verify..."

