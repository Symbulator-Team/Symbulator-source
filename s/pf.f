(pfinput)
Func
If getType(pfinput)="STR" Then
Local elemname,elemsvar
pfinput→elemname
"s"&elemname→elemsvar
If expr("getType("&elemsvar&")")="NONE" Then
Return "Element not recognised."
Else
Local elemtype,comandtx
left(elemname,1)→elemtype
If instring("e",elemtype)≠0 Then
"(angle(v"&elemname&")-angle(–i"&elemname&"))"→comandtx
ElseIf instring("j",elemtype)≠0 Then
"(angle(–v"&elemname&")-angle(i"&elemname&"))"→comandtx
ElseIf instring("r",elemtype)≠0 Then
"(angle(v"&elemname&")-angle(i"&elemname&"))"→comandtx
Else
Return "Element type not right."
EndIf
Local pfvalue,pfanswer,pfside
sign(expr(comandtx))→pfside
expr("cos"&comandtx)→pfvalue
If getType(pfside)="NUM" and getType(pfvalue)="NUM" Then
"pf: "→pfanswer
pfanswer&string(round(abs(pfvalue),5))→pfanswer
If pfside=–1 Then
pfanswer&" leading"→pfanswer
ElseIf pfside=1 Then
pfanswer&" lagging"→pfanswer
EndIf
Return pfanswer
Else
Return "Did not evaluate numerically."
EndIf
EndIf
ElseIf getType(pfinput)="EXPR" Then
Return abs(real(pfinput))/(abs(pfinput))
Else
Return "Input not in usable format."
EndIf
EndFunc
