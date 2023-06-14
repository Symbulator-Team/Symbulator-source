(â)
Prgm
If ok=7. Then
Return 
EndIf
startTmr()→s\tdc

If getType(αmetagat)="NONE" Then
false→αmetagat
EndIf

If getType(s\verbose)="NONE" Then
true→s\verbose
EndIf

DelVar βtool
"dc"→βtool
s\s0(â,ω,µn1,µn2)
If ok=3. Then
0.→ok
DispHome
Return 
EndIf
s\s5(expr("["&û&"]"),1)
DelVar βtool
s\s9()
DelVar û
If s\verbose and not αmetagat Then
Disp "Elapsed: "&string(checkTmr(exact(s\tdc)))&" seconds."
EndIf
DelVar s\tdc,αmetagat
DispHome
EndPrgm
