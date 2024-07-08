#Requires -modules InvokeBuild
#Requires -modules Pester
#Requires -modules platyPS
#Requires -modules posh-git
#Requires -modules Assert
#Requires -modules PSScriptAnalyzer
#Requires -modules Configuration

[CmdletBinding()]
param(
    # How to increment
    [ValidateSet("Major", "MajorReset", "Minor", "MinorReset", "Build", "Reset")]
    [string]$Increment = "Build"
)

$Script:ModuleName = $MyInvocation.MyCommand -replace ".build.ps1"
$Script:PsmPath = "$PSScriptRoot\$ModuleName\$ModuleName.psm1"
$Script:PsdPath = "$PSScriptRoot\$ModuleName\$ModuleName.psd1"

function Clear-Workspace {
    "docs", "en-US" | ForEach-Object {
        if (Test-Path $PSScriptRoot\$_) { Remove-Item $PSScriptRoot\$_ -Recurse }
    }
}

function New-Workspace {
    mkdir $PSScriptRoot\src
    mkdir $PSScriptRoot\src\Public
    mkdir $PSScriptRoot\src\Private
    mkdir $PSScriptRoot\src\Tests
    "function Get-Value {}" | Out-File $PSScriptRoot\src\Public\Get-Value.ps1
    if (-not (Test-Path $PSScriptRoot\.git)) { git init }
}

Add-BuildTask Init { Clear-Workspace }, {
    if (-not (Test-Path $PsdPath) ) {
        New-Item -ItemType Directory -Path $PSScriptRoot\$ModuleName -ea silent
        $Splat = @{
            Path              = "$PSScriptRoot\$ModuleName\$ModuleName.psd1"
            RootModule        = "$ModuleName.psm1"
            ModuleVersion     = "0.0.0"
            FunctionsToExport = @()
            CmdletsToExport   = @()
            PowerShellVersion = '5.0'
            Description       = ''
        }
        # Any params for New-ModuleManifest can be stored as JSON into the ENV:MODULE_TEMPLATE variable
        # so that you don't have to manually set these things for each module that you create. Example:
        # New-Item ENV:MODULE_TEMPLATE -Value '{"Author":"Devin Rich","ProjectUri":"https://gitlab.com/devirich/ModuleName"}'
        if ($ENV:MODULE_TEMPLATE) {
            $Splat += $ENV:MODULE_TEMPLATE -replace "ModuleName", $ModuleName | ConvertFrom-Json -AsHashtable
        }
        New-ModuleManifest @Splat
    }

    if (-not (Test-Path $PSScriptRoot\src\)) {
        New-Workspace
    }
    $Script:PsdData = Import-Metadata $PsdPath
}

Add-BuildTask Test Init, {
    # Currently unused - Need to look at pester v5 and add it back in.
    # $CoverageFolder = Get-ChildItem "src\" | Where-Object Name -In "Public", "Private" |
    # Sort-Object -Descending FullName |
    # ForEach-Object {
    #     $_.FullName + "\*.ps1"
    # }
}

Add-BuildTask Analyze {
    Invoke-ScriptAnalyzer -Path $PSScriptRoot\src\*\*.ps1 -IncludeDefaultRules -Fix
}

Add-BuildTask Build Init, Test, Analyze, {
    $ModuleFiles = "Public", "Private" | ForEach-Object { Get-ChildItem $PSScriptRoot\src\$_\ -Recurse -File -ea silent }
    $PowerShellFiles, $OtherFiles = $ModuleFiles.Where( { $_.Extension -eq ".ps1" }, "Split")

    Get-ChildItem $PSScriptRoot\$ModuleName\* -Recurse |
    Where-Object Name -NE "$ModuleName.psd1" |
    Remove-Item -ErrorAction SilentlyContinue -Recurse

    $PowerShellFiles | ForEach-Object {
        Get-Content $_.FullName |
        Out-File $PsmPath -Append -Encoding utf8
    }
    $OtherFiles | ForEach-Object {
        Copy-Item $_.FullName $PSScriptRoot\$ModuleName\
    }

    # I like this method of versions compared to Update-Metadata's style for major versions.
    [version]$V = $PsdData['ModuleVersion']
    switch ($Increment) {
        "Major" { $V = [version]::new(($V.Major + 1), [datetime]::now.ToString('yyMM'), ($V.Build + 1)) }
        "MajorReset" { $V = [version]::new(($v.Major + 1), [datetime]::now.ToString('yyMM'), 0) }
        "Build" { $V = [version]::new($v.Major, [datetime]::now.ToString('yyMM'), ($V.Build + 1)) }

        "Reset" { $V = [version]::new(0, [datetime]::now.ToString('yyMM'), 1) }
    }
    Update-Metadata -Path $PsdPath -PropertyName ModuleVersion -Value $V.ToString()

    $FunctionsToExport = Get-ChildItem $PSScriptRoot\src\Public\*.ps1 -Recurse | Select-Object -expand Basename | Sort-Object
    if (Compare-Object $FunctionsToExport $PsdData['FunctionsToExport'] -SyncWindow 0) {
        Update-Metadata -Path $PsdPath -PropertyName FunctionsToExport -Value $FunctionsToExport
    }
}

Add-BuildTask Validate-Documentation Build, {
    # Undocumented commands and parameters will result in a line with the following text on their line:
    # {{ Fill InputObject Description}} or similar
    # Check docs folder and see if any files contain {{. Fail if so.
    Import-Module $PsmPath -Force
    if ($PsdData.FunctionsToExport) {
        New-MarkdownHelp -Command $PsdData.FunctionsToExport -OutputFolder $PSScriptRoot\docs -Force | Out-Null
        Get-ChildItem $PSScriptRoot\Docs\* | ForEach-Object {
            Get-Content $_.FullName |
            Select-String "{{ Fill|{{ Add Example" -Context 10, 0 | Select-Object -First 1 | ForEach-Object {
                #Throw "Help not complete. Missing required documentation begins on line $($_.ReadCount)"
                Write-Warning "Help not complete. Missing required documentation near section:"
                $_.Context.PreContext | Select-String "^#" | ForEach-Object { Write-Warning $_ }
            }
        }
    }
    #Don't know why I need external help. But, I have an XML file I could use if this were binary I guess?
    # New-ExternalHelp $PSScriptRoot\docs -OutputPath en-US\ -Force | Out-Null
}, { Clear-Workspace }

Add-BuildTask Publish Init, {
    if (-not [string]::IsNullOrWhiteSpace($ENV:PSGALLERY_API_KEY)) {
        $Splat = @{
            ApiKey = $ENV:PSGALLERY_API_KEY
            Path   = "$PSScriptRoot\$ModuleName\"
        }
        Publish-PSResource @Splat
    }
    else {
        throw "API was not found"
    }
}

Add-BuildTask Template {
    # Add in dynamic template?
    # Not currently.
}

#region Module customization
# Anything that needs edited in the build process for this SPECIFIC module
# Should be placed bere
function Clear-Workspace {
    "AutoGenDocs", "en-US" | ForEach-Object {
        if (Test-Path $PSScriptRoot\$_) { Remove-Item $PSScriptRoot\$_ -Recurse }
    }
}

Add-BuildTask Validate-Documentation Build, {
    # Undocumented commands and parameters will result in a line with the following text on their line:
    # {{ Fill InputObject Description}} or similar
    # Check docs folder and see if any files contain {{. Fail if so.
    New-ExternalHelp -Path .\Docs\ -OutputPath .\ConnectWiser\en-US\ -Force
    Import-Module $PsmPath -Force
    if ($PsdData.FunctionsToExport) {
        New-MarkdownHelp -Command $PsdData.FunctionsToExport -OutputFolder $PSScriptRoot\AutogenDocs -Force | Out-Null
        Get-ChildItem $PSScriptRoot\AutogenDocs\* | ForEach-Object {
            Get-Content $_.FullName |
            Select-String "{{ Fill|{{ Add Example" -Context 10, 0 | Select-Object -First 1 | ForEach-Object {
                #Throw "Help not complete. Missing required documentation begins on line $($_.ReadCount)"
                Write-Warning "Help not complete. Missing required documentation near section:"
                $_.Context.PreContext | Select-String "^#" | ForEach-Object { Write-Warning $_ }
            }
        }
    }
    #Don't know why I need external help. But, I have an XML file I could use if this were binary I guess?
    # New-ExternalHelp $PSScriptRoot\docs -OutputPath en-US\ -Force | Out-Null
}, { Clear-Workspace }
#endRegion Module customization

# Synopsis: Build and validate.
Add-BuildTask . Validate-Documentation
