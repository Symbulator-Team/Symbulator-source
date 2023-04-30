(â)
Prgm
If ok=7. Then
Return 
EndIf
startTmr()→s\tdc
true→s\verbose
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
Disp "Elapsed: "&string(checkTmr(exact(s\tdc)))&" seconds."
DelVar s\tdc,û,s\verbose
DispHome
EndPrgm
