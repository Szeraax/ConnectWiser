function Connect-CWC {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Server,
        [Parameter(Mandatory = $True)]
        [pscredential]$Credentials,
        [switch]$Force,
        [switch]$DisableSessionTrust
    )

    if ($script:CWCServerConnection -and !$Force) {
        Write-Verbose "Using cached Authentication information."
        return
    }

    $Server = $Server -replace ("http.*:\/\/", '')
    $Headers = @{
        'content-type' = "application/json; charset=utf-8"
        'origin'       = "https://$Server"
    }

    $frontPage_param = @{
        Uri             = "https://$Server/Login"
        Headers         = $Headers
        UseBasicParsing = $true
    }
    if ($script:CWCServerConnection.WebSession) { $frontPage_param.WebSession = $script:CWCServerConnection.WebSession }
    else { $frontPage_param.SessionVariable = "session" }
    $FrontPage = Invoke-WebRequest @frontPage_param

    $Regex = [Regex]'(?<=antiForgeryToken":")(.*)(?=","isUserAdministrator)'
    $Match = $Regex.Match($FrontPage.content)
    if ($Match.Success) { $Headers.'x-anti-forgery-token' = $Match.Value.ToString() }
    else { Write-Verbose 'Unable to find anti forgery token. Some commands may not work.' }

    $otp = $null
    # Each login session has to keep its own consistent nonce between retries so that the server can keep them straight.
    # Remove this GUID and OTP will never work.
    $trackingGuid = [guid]::NewGuid().ToString()
    # Setting a sane default: Everyone loves to have fewer MFA prompts.
    if ($DisableSessionTrust) { $sessionTrust = $false }
    else { $sessionTrust = $true }
    do {
        $response = Invoke-RestMethod "https://$Server/Services/AuthenticationService.ashx/TryLogin" -WebSession $session -Body (@(
                $Credentials.UserName
                $Credentials.GetNetworkCredential().Password
                $otp
                $sessionTrust
                $trackingGuid
            ) | ConvertTo-Json) -ContentType application/json -Method Post
        Write-Verbose "Response from server '$response'"
        if ($response -ne 1) {
            $otp = Read-Host -Prompt "Please enter your OTP code"
        }
    } until ($response -eq 1)

    $script:CWCServerConnection = @{
        Server     = $Server
        WebSession = $session
    }
    Write-Verbose ($script:CWCServerConnection | Out-String)

    try {
        $null = Get-CWCSessionGroup -ErrorAction Stop
        Write-Verbose '$CWCServerConnection, variable initialized.'
    }
    catch {
        Remove-Variable CWCServerConnection -Scope script
        Write-Verbose 'Authentication failed.'
        Write-Error $_
    }
}
