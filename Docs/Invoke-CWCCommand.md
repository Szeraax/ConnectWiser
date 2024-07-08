---
external help file: ConnectWiser-help.xml
Module Name: ConnectWiser
online version:
schema: 2.0.0
---

# Invoke-CWCCommand

## SYNOPSIS
Will issue a command against a given machine and return the results.

## SYNTAX

```
Invoke-CWCCommand [-GUID] <Guid> [[-Command] <String>] [[-TimeOut] <Int32>] [-MaxLength <Int32>] [-PowerShell]
 [[-Group] <String>] [-NoWait] [<CommonParameters>]
```

## DESCRIPTION
Will issue a command against a given machine and return the results.

## EXAMPLES

### EXAMPLE 1
```powershell
Invoke-CWCCommand -GUID $GUID -Command 'hostname'
```

Will return the hostname of the machine.

### EXAMPLE 2
```powershell
Invoke-CWCCommand -GUID $GUID  -TimeOut 120000 -Command 'iwr -UseBasicParsing "https://bit.ly/ltposh" | iex; Restart-LTService' -PowerShell
```

Will restart the Automate agent on the target machine.

## PARAMETERS

### -GUID
The GUID identifier for the machine you wish to connect to.
You can retrieve session info with the 'Get-CWCSessions' cmdlets

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Command
The command you wish to issue to the machine.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TimeOut
The amount of time in milliseconds that a command can execute.
The default is 10000 milliseconds.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 10000
Accept pipeline input: False
Accept wildcard characters: False
```

### -PowerShell
Issues the command in a powershell session.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Group
Name of session group to use.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: All Machines
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoWait
Will not wait for the output of the command.

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

### -MaxLength
{{ Fill MaxLength Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### The output of the Command provided.
## NOTES
Version:        1.0

Author:         Chris Taylor

Creation Date:  1/20/2016

Purpose/Change: Initial script development

## RELATED LINKS
