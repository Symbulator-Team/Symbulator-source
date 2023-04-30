(â,µn1,µn2)
Prgm
If ok=7. Then
Return 
EndIf
startTmr()→s\ter
false→s\verbose
If getMode("Exact/Approx")="APPROXIMATE" Then
exact(µn1)→µn1
exact(µn2)→µn2
EndIf
DelVar βtool
"th"→βtool
s\s0(â,ω,exact(µn1),exact(µn2))
DelVar βtool
If ok=3. Then
0.→ok
DispHome
Return 
EndIf
DelVar req
string(µn1)→µn1
string(µn2)→µn2

If getType(s\toa)="STR" Then
If s\toa="DC" Then
1→δta
EndIf
If s\toa="AC" Then
2→δta
EndIf
If s\toa="FD" Then
3→δta
EndIf
EndIf
DelVar s\toa

If getType(δta)="NONE" Then
Dialog
Title "Equivalent Resistance/Impedance"
DropDown "Type of Analysis",{"DC","AC","FD"},δta
EndDlog
If ok=0. Then
Return 
EndIf
EndIf

true→s\select
"{v"&µn1&",v"&µn2&"}"→s\savevars

ClrIO
Disp "Symbulator is running a"
Disp "simulation with a 1 ampere"
Disp "current source to find"
Disp "the equivalent resistance."
Disp "Please wait..."

If δta=1 Then
"jε1,"&µn2&","&µn1&",1,0;"&û→û
"dc"→βtool
s\s5(expr("["&û&"]"),1)
DelVar βtool
EndIf
If δta=2 Then
Dialog
Title "Radial frequency"
Request "ω in rad/s",δω
EndDlog
If ok=0. Then
Return 
EndIf
expr(δω)→δω
"jε1,"&µn2&","&µn1&",1,0;"&û→û
"ac"→βtool
s\s5(expr("["&û&"]"),δω)
DelVar βtool
EndIf
If δta=3 Then
"jε1,"&µn2&","&µn1&",jε1,0;"&û→û
"fd"→βtool
s\s5(expr("["&û&"]"),1)
DelVar βtool
EndIf
If ok=4. Then
0.→ok
DispHome
Return 
EndIf
If δta=1 Then
expr("–vjε1→req")
EndIf
If δta=2 Then
expr("–vjε1→zEq")
EndIf
If δta=3 Then
expr("–vjε1/jε1→zEq")
EndIf
s\s4(expr("["&û&"]"))
ClrIO
If δta=1 Then
Disp "Equivalent Resistance is"
Disp string(req)
Else
Disp "Equivalent Impedance is"
Disp string(zeq)
EndIf
DelVar δtc,δta,δω,dcir,αncc,αnec,αszc,αζ1,αζ2,αζ3,αζ4,αζ5
s\s9()
DelVar û,s\verbose
Disp "Elapsed: "&string(checkTmr(exact(s\ter)))&" seconds."
DelVar s\ter
DispHome
EndPrgm
