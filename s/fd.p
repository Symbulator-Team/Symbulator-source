(â)
Prgm
If ok=7. Then
Return 
EndIf
startTmr()→s\tfd
true→s\verbose
If getType(dif\laplace)≠"FUNC" Then
Dialog
Title "DiffEq is missing!"
Text "DiffEq is required to"
Text "perform this task."
EndDlog
Return 
EndIf
DelVar βtool
"fd"→βtool
s\s0(â,ω,µn1,µn2)
If ok=3. Then
0.→ok
DispHome
Return 
EndIf
s\s5(expr("["&û&"]"),1)
DelVar βtool
s\s9()
Disp "Elapsed: "&string(checkTmr(exact(s\tfd)))&" seconds."
DelVar s\tfd,û,s\verbose
DispHome
EndPrgm
