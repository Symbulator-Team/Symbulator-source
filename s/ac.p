(â,ω)
Prgm

If ok=7. Then
Return 
EndIf

startTmr()→s\tac
If getType(s\rms)="NONE" Then
false→s\rms
EndIf
If getType(αmetagat)="NONE" Then
false→αmetagat
EndIf
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
DelVar û
If s\verbose and not αmetagat Then
Disp "Elapsed: "&string(checkTmr(exact(s\tac)))&" seconds."
If s\rms Then
Disp "Solved assuming voltages &"
Disp "currents are all in RMS."
EndIf
EndIf
DelVar αmetagat,s\tac
DispHome
EndPrgm
