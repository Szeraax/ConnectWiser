---
external help file: ConnectWiser-help.xml
Module Name: ConnectWiser
online version:
schema: 2.0.0
---

# New-CWCMFA

## SYNOPSIS
Will generate an MFA code to use with user creation.

## SYNTAX

```
New-CWCMFA [-DisplayName <Object>] [-UserAccount <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Will generate an MFA code to use with user creation.

## EXAMPLES

### Example 1
```powershell
PS C:\> New-CWCMFA -DisplayName 'My Control Server' -UserAccount 'CTaylor'
```

Creates an MFA OTP code and QR URL with the provided information.

## PARAMETERS

### -DisplayName
Name you want to display in OTP app.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserAccount
User account to display in OTP app.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
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
