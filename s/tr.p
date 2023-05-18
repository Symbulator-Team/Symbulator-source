(â)
Prgm
If ok=7. Then
Return 
EndIf
startTmr()→s\ttr

If getType(s\verbose)="NONE" Then
true→s\verbose
EndIf

If getType(dif\ilaplace)≠"FUNC" Then
Dialog
Title "DiffEq is missing!"
Text "DiffEq is required to"
Text "perform this task."
EndDlog
Return 
EndIf
DelVar βtool
"tr"→βtool
s\s0(â,ω,µn1,µn2)
If ok=3. Then
0.→ok
DispHome
Return 
EndIf
s\s5(expr("["&û&"]"),1)
DelVar βtool
s\s9()
DelVar û,αmetagat
Disp "Elapsed: "&string(checkTmr(exact(s\ttr)))&" seconds."
DelVar s\ttr
DispHome
EndPrgm
