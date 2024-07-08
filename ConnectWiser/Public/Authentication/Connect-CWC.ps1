function Connect-CWC {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$Server,
        [Parameter(Mandatory = $True)]
        [pscredential]$Credentials,
        [switch]$Force
    )

    if ($script:CWCServerConnection -and !$Force) {
        Write-Verbose "Using cached Authentication information."
        return
    }

    $Server = $Server -replace("http.*:\/\/",'')
    $Headers = @{
        'content-type' = "application/json; charset=utf-8"
        'origin' = "https://$Server"
    }

    $FrontPage = Invoke-WebRequest "https://$Server/Login" -Headers $Headers -UseBasicParsing -SessionVariable session
    $Regex = [Regex]'(?<=antiForgeryToken":")(.*)(?=","isUserAdministrator)'
    $Match = $Regex.Match($FrontPage.content)
    if($Match.Success){ $Headers.'x-anti-forgery-token' = $Match.Value.ToString() }
    else{ Write-Verbose 'Unable to find anti forgery token. Some commands may not work.' }

    $trackingGuid = [guid]::NewGuid().ToString()
    $otp = $null
    do {
        $response = Invoke-RestMethod "https://$Server/Services/AuthenticationService.ashx/TryLogin" -WebSession $session -Body (@(
                $Credentials.UserName
                $Credentials.GetNetworkCredential().Password
                $otp
                $null
                $trackingGuid
            ) | ConvertTo-Json) -ContentType application/json -Method Post
        Write-Verbose "Response from server '$response'"
        if ($response -ne 1) {
            $otp = Read-Host -Prompt "Please enter your OTP code"
        }
    } until ($response -eq 1)
    # $FrontPage = Invoke-WebRequest -Uri $Headers.origin -Headers $Headers -UseBasicParsing

    $script:CWCServerConnection = @{
        Server = $Server
        WebSession = $session
    }
    Write-Verbose ($script:CWCServerConnection | Out-String)

    try{
        $null = Get-CWCSessionGroup -ErrorAction Stop
        Write-Verbose '$CWCServerConnection, variable initialized.'
    }
    catch{
        Remove-Variable CWCServerConnection -Scope script
        Write-Verbose 'Authentication failed.'
        Write-Error $_
    }
}
