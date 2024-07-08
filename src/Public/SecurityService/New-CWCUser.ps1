function New-CWCUser {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $True)]
        [pscredential]$Credential,
        [string]$OTP,
        [string]$DisplayName,
        [Parameter(Mandatory = $True)]
        [string]$Email,
        [string[]]$SecurityGroups = @(),
        [boolean]$ForcePassChange = $true
    )

    $Endpoint = 'Services/SecurityService.ashx/SaveUser'

    $Body = ConvertTo-Json @(
        $script:CwOption.InternalUserSource,
        $null,
        $Credential.UserName,
        $Credential.GetNetworkCredential().Password,
        $Credential.GetNetworkCredential().Password,
        $OTP,
        $DisplayName,
        '',
        $Email,
        $SecurityGroups,
        $ForcePassChange
    )

    $WebRequestArguments = @{
        Endpoint = $Endpoint
        Body     = $Body
        Method   = 'Post'
    }
    if ($PSCmdlet.ShouldProcess($WebRequestArguments.Body, "New-CWCUser")) {
        Invoke-CWCWebRequest -Arguments $WebRequestArguments
    }
}
