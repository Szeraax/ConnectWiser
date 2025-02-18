#
# Module manifest for module 'ConnectWiser'
#
# Generated by: Devin Rich
#
# Generated on: 7/8/2024
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'ConnectWiser.psm1'

    # Version number of this module.
    ModuleVersion     = '0.2407.2.0'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID              = 'd81b770d-e972-4dcf-bb3a-52b614c52184'

    # Author of this module
    Author            = 'Devin Rich'

    # Company or vendor of this module
    CompanyName       = 'Devin Rich'

    # Copyright statement for this module
    Copyright         = '(c) 2024 Devin Rich. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'A better PowerShell wrapper for ConnectWise Control API'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '3.0'

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = 'ConnectWiser.Format.ps1xml'

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @('Get-CWCAuditInfo', 'Get-CWCAuditLog', 'Connect-CWC', 'Get-CWCLauncURL', 'Add-CWCRemoteWorkforceRequiredRole', 'New-CWCRemoteWorkforceAssignment', 'New-CWCMFA', 'Get-CWCLastContact', 'Get-CWCSession', 'Get-CWCSessionDetail', 'Invoke-CWCCommand', 'Invoke-CWCWake', 'New-CWCAccessToken', 'Remove-CWCSession', 'Update-CWCCustomProperty', 'Update-CWCSessionName', 'Get-CWCSecurityConfigurationInfo', 'New-CWCUser', 'Remove-CWCUser', 'Update-CWCUser', 'Get-CWCSessionGroup')

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport   = @()

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport   = @('')

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags         = @('ConnectWise', 'Control', 'ScreenConnect', 'API')

            # A URL to the license for this module.
            LicenseUri   = 'https://github.com/Szeraax/ConnectWiser/blob/master/LICENSE'

            # A URL to the main website for this project.
            ProjectUri   = 'https://github.com/Szeraax/ConnectWiser'

            # A URL to an icon representing this module.
            IconUri      = 'https://raw.githubusercontent.com/Szeraax/ConnectWiser/master/Media/control-logo.webp'

            # ReleaseNotes of this module
            ReleaseNotes = 'https://github.com/Szeraax/ConnectWiser/releases'

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    HelpInfoURI       = 'https://raw.githubusercontent.com/Szeraax/ConnectWiser/master/ConnectWiser/en-US/ConnectWiser-help.xml'

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}
