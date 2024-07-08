# Your Control server URL
$Server = 'control.domain.com'

# Get Control credential
$Credential = Get-Credential

# Load module
Install-Module ConnectWiser
Import-Module ConnectWiser

# Save connection info
Connect-CWC -Server $Server -Credential $Credential

# Generate a new MFA token
$MFA = New-CWCMFA
$NewUser = @{
    UserName       = $DomainUser.Email
    Password       = $MFA.OTP
    Email          = $DomainUser.Email
    DisplayName    = $DomainUser.AccountName
    OTP            = $MFA.OTP
    SecurityGroups = 'Remote Workforce'
}
New-CWCUser @NewUser -Verbose

# You now have a new Remote Workforce user created with MFA enabled
# If you need a QR
$MFA.QR
