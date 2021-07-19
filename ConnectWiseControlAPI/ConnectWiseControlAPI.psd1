#
# Module manifest for module 'ConnectWiseControlAPI'
#
# Generated by: Chris Taylor
#
# Generated on: 4/5/2020
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'ConnectWiseControlAPI.psm1'

# Version number of this module.
ModuleVersion = '0.1.5.0'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'f94fa996-0f01-4c5c-9cd9-3227728ebacb'

# Author of this module
Author = 'Chris Taylor'

# Company or vendor of this module
CompanyName = 'ChrisTaylorCodes'

# Copyright statement for this module
Copyright = '(c) 2020 Chris Taylor. All rights reserved.'

# Description of the functionality provided by this module
Description = 'PowerShell wrapper for ConnectWise Control web API'

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
# FormatsToProcess = 'ConnectWiseControlAPI.Format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @('Get-CWCAuditInfo','Connect-CWC','Add-CWCRemoteWorkforceRequiredRole','New-CWCRemoteWorkforceAssignment','New-CWCMFA','Get-CWCLastContact','Get-CWCSession','Get-CWCSessionDetail','Invoke-CWCCommand','Invoke-CWCWake','Remove-CWCSession','Update-CWCCustomProperty','Update-CWCSessionName','Get-CWCSecurityConfigurationInfo','New-CWCUser','Remove-CWCUser','Update-CWCUser','Get-CWCSessionGroup')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @('')

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('ConnectWise', 'Control', 'ScreenConnect', 'API')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/christaylorcodes/ConnectWiseControlAPI/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/christaylorcodes/ConnectWiseControlAPI'

        # A URL to an icon representing this module.
        IconUri = 'https://www.connectwise.com/-/media/icons/color/control-logo.ashx?la=en&hash=D0314ED1B1A5DD67F8C3AA252D53D9ED07B839D7'

        # ReleaseNotes of this module
        ReleaseNotes = 'https://github.com/christaylorcodes/ConnectWiseControlAPI/releases'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://raw.githubusercontent.com/christaylorcodes/ConnectWiseControlAPI/master/ConnectWiseControlAPI/en-US/ConnectWiseControlAPI-help.xml'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

