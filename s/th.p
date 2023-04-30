(â,µn1,µn2)
Prgm

If ok=7. Then
Return 
EndIf

startTmr()→s\tth
false→s\verbose
If getMode("Exact/Approx")="APPROXIMATE" Then
exact(µn1)→µn1
exact(µn2)→µn2
EndIf

expr("DelVar βtool")
"th"→βtool
s\s0(â,ω,exact(µn1),exact(µn2))
expr("DelVar βtool")

If ok=3. Then
0.→ok
DispHome
Return 
EndIf

DelVar eqcir,ino,irl,jn,l,n,pmax,prl,re,req,rl,smax,srl,vrl,vth,zeq

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
Disp "Symbulator is running an"
Disp "open-circuit simulation"
Disp "to find the circuit's"
Disp "Thévenin voltage."
Disp "Please wait..."
If δta=1 Then
"dc"→βtool
s\s5(expr("["&û&"]"),1)
expr("DelVar βtool")
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
"ac"→βtool
s\s5(expr("["&û&"]"),δω)
expr("DelVar βtool")
EndIf

If δta=3 Then
"fd"→βtool
s\s5(expr("["&û&"]"),1)
expr("DelVar βtool")
EndIf

If ok=4. Then
0.→ok
DispHome
Return 
EndIf

expr("v"&µn1&"-v"&µn2&"→Vth")
s\s4(expr("["&û&"]"))

If string(vth)="0" or string(vth)="0." Then
ClrIO
Disp "This circuit is not active."
Pause "Try the ER tool instead."
DispHome
3.→ok
Return 
Else
ClrIO
Disp "Thévenin voltage found!"
Disp "vTh is "&string(vth)

Disp "Symbulator will now run a"
Disp "short-circuit simulation"
Disp "to find the Norton current."
Disp "Please wait..."
û&";sε1,"&µn1&","&µn2&",0,0"→û

true→s\select
"{isε1,v"&µn1&",v"&µn2&"}"→s\savevars

If δta=1 Then
"dc"→βtool
s\s5(expr("["&û&"]"),1)
expr("DelVar βtool")
EndIf

If δta=2 Then
"ac"→βtool
s\s5(expr("["&û&"]"),δω)
expr("DelVar βtool")
EndIf

If δta=3 Then
"fd"→βtool
s\s5(expr("["&û&"]"),1)
expr("DelVar βtool")
EndIf

If ok=4. Then
0.→ok
DispHome
Return 
EndIf
ClrIO
If inString(string(isε1),"@")=0 Then
isε1→ino
Disp "Norton current found!"
Disp "iNo is "&string(ino)
Else
Disp "Short simulation failed"
Pause "to find a Norton current."
Goto clean
EndIf

If δta=1 Then
vth/ino→req
Else
vth/ino→zeq
EndIf

EndIf

If δta=1 Then
Disp "Equivalent resistance found!"
Disp "Req is "&string(req)
Else
Disp "Equivalent impedance found!"
Disp "zEq is "&string(zeq)
EndIf

If δta=1 Then
vth*ino/4→pmax
Disp "pMax is "&string(pmax)
EndIf
If δta=2 Then
vth*conj(ino)/4→smax
Disp "sMax is "&string(smax)
EndIf
If δta=1 Then
"jN,0,n,iNo:rE,n,0,rEq:rL,n,0,L"→eqcir
ino*req/(l+req)→irl
l*ino*req/(l+req)→vrl
l*ino^2*req^2/(l+req)^2→prl
Else
"jN,0,n,iNo:rE,n,0,zEq:rL,n,0,L"→eqcir
ino*zeq/(l+zeq)→irl
l*ino*zeq/(l+zeq)→vrl
l*ino^2*zeq^2/(l+zeq)^2→srl
EndIf

Lbl clean
s\s4(expr("["&û&"]"))

DelVar δtc,δta,δω,dcir,αncc,αnec,αszc,αζ1,αζ2,αζ3,αζ4,αζ5,isε1
s\s9()
Disp "Elapsed: "&string(checkTmr(exact(s\tth)))&" seconds."
DelVar s\tth,s\verbose,û
DispHome
EndPrgm
