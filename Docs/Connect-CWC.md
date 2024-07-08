---
external help file: ConnectWiser-help.xml
Module Name: ConnectWiser
online version:
schema: 2.0.0
---

# Connect-CWC

## SYNOPSIS
Initializes the connection parameters for the module.

## SYNTAX

```
Connect-CWC [-Server] <String> [-Credential] <PSCredential> [-Force] [<CommonParameters>]
```

## DESCRIPTION
Initializes the connection parameters used by other commands in the module.

## EXAMPLES

### Example 1
```powershell
PS C:\> Connect-CWC -Server 'contoso.screenconnect.com' -Credential $Credential -Force
```

Sets connection information used by the module and overwrites any previously set information.

## PARAMETERS

### -Credential
A credential used to authenticate with the control server.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Used to overwrite any information already loaded in the session.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableSessionTrust
Used to make it so that the OTP code will be required for each new session

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OtpCode
When you already know what your OtpCode will be prior to login (auth token, yubikey, etc.), you can make it part of invocation rather than an interactive element

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server
The URL to your control server.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
