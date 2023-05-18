(â,ω)
Prgm

If ok=7. Then
Return 
EndIf

startTmr()→s\tac

If getType(s\verbose)="NONE" Then
true→s\verbose
EndIf

DelVar βtool
"ac"→βtool
s\s0(â,ω,µn1,µn2)
If ok=3. Then
0.→ok
DispHome
Return 
EndIf
s\s5(expr("["&û&"]"),ω)
DelVar βtool
s\s9()
DelVar αmetagat,û
If s\verbose Then
Disp "Elapsed: "&string(checkTmr(exact(s\tac)))&" seconds."
EndIf
DelVar s\tac
DispHome
EndPrgm
