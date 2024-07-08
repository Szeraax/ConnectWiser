---
external help file: ConnectWiser-help.xml
Module Name: ConnectWiser
online version:
schema: 2.0.0
---

# Get-CWCAuditLog

## SYNOPSIS
Pull audit log information

## SYNTAX

```
Get-CWCAuditLog [[-StartDate] <DateTime>] [[-EndDate] <DateTime>] [[-SessionName] <String>]
 [-IncludeSessionCaptures] [[-EventTypes] <Int32[]>] [[-SecurityTypes] <Int32[]>] [<CommonParameters>]
```

## DESCRIPTION
Returns the same information as the audit search in web

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-CWCAuditLog -StartDate $(Get-Date).AddDays(-1) -EndDate $(Get-Date) -SessionName 'Computer1'
```

Get the audit logs for Computer1 for the last day.

## PARAMETERS

### -EndDate
The latest date to include in the audit log results.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EventTypes
A list of the event types to include in the audit log results. If none, ?defaults to all?

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeSessionCaptures
Switch to also include session captures in audit log results

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

### -SecurityTypes
{{ Fill SecurityTypes Description }}

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SessionName
{{ Fill SessionName Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDate
The earliest date to include in the audit log results.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
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
