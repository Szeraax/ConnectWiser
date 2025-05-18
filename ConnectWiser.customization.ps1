#region Module customization
# Anything that needs edited in the build process for this SPECIFIC module
# Should be placed bere
function Clear-Workspace {
    "AutoGenDocs", "en-US" | ForEach-Object {
        if (Test-Path $PSScriptRoot\$_) { Remove-Item $PSScriptRoot\$_ -Recurse }
    }
}

Add-BuildTask Validate-Documentation Build, Test, Analyze, {
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
