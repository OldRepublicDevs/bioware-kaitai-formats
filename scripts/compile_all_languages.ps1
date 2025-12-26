#! /usr/bin/env pwsh
# Compile all .ksy files to ALL supported languages

$ErrorActionPreference = "Continue"

# All Kaitai Struct supported languages
$languages = @(
    "cpp_stl",     # Native tools
    "csharp",      # Andastra, KotOR.NET  
    "go",          # Performance tools
    "java",        # Android tools
    "javascript",  # Web tools, KotOR.js
    "lua",         # Game modding
    "nim",         # Performance + safety
    "perl",        # Legacy tools
    "php",         # Web backend
    "python",      # PyKotor compatibility
    "ruby",        # Scripting
    "rust",        # Safe parsing
    "graphviz",    # Structure diagrams
    "html",        # HTML documentation
    "construct"   # Construct (Python) codegen
)

Write-Host "Compiling all .ksy files to $($languages.Count) languages..."
Write-Host ("=" * 80)

$ksyFiles = Get-ChildItem -Path "formats" -Filter "*.ksy" -Recurse | Where-Object {
    # Exclude failing formats (TODO: FIX LATER, EVERY SINGLE ONE OF THESE ARE HIGH PRIORITY!)
    $_.Name -notin @("DA2S.ksy", "DAS.ksy", "LYT.ksy", "PCC.ksy", "TGA.ksy", "TPC.ksy")
}

Write-Host "Found $($ksyFiles.Count) .ksy files to compile"
Write-Host ""

foreach ($lang in $languages) {
    Write-Host "Compiling to $lang..." -ForegroundColor Cyan
    
    $outputDir = "src/$lang/kaitai_generated"
    New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
    
    $successes = 0
    $failures = 0
    
    foreach ($file in $ksyFiles) {
        $output = & kaitai-struct-compiler -t $lang -d $outputDir $file.FullName 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            $successes++
        } else {
            $failures++
            Write-Host $output -ForegroundColor Red
        }
    }
    
    $color = if ($failures -eq 0) { "Green" } else { "Yellow" }
    Write-Host "  ${lang}: $successes succeeded, $failures failed" -ForegroundColor $color
}

Write-Host ""
Write-Host ("=" * 80)
Write-Host "Compilation complete for all languages!"
Write-Host "Generated code in: src/<language>/kaitai_generated/"

