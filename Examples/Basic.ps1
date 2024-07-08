# Your Control server URL
$Server = 'control.domain.com'

# Get Control credential
$Credential = Get-Credential

# Load module
Install-Module ConnectWiser
Import-Module ConnectWiser

# Save connection info
Connect-CWC -Server $Server -Credential $Credential

# Find this machine in Control
$Computer = Get-CWCSession -Type Access -Search $env:COMPUTERNAME -Limit 1

if (!$Computer) { return "Computer not found" }

# We now have some basic information about this session
$Computer

# We can use this to issue other command like getting the machines last contact
Get-CWCLastContact -GUID $Computer.SessionID
