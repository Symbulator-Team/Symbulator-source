(â,ω)
Prgm

If ok=7. Then
Return 
EndIf

startTmr()→s\tac
true→s\verbose
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
Disp "Elapsed: "&string(checkTmr(exact(s\tac)))&" seconds."
DelVar s\tac,û,s\verbose
DispHome
EndPrgm
