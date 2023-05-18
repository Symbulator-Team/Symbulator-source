(â,µn1,µn2)
Prgm

If ok=7. Then
Return 
EndIf

startTmr()→s\tth
true→αmetagat

If getType(s\verbose)="NONE" Then
true→s\verbose
EndIf

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
DelVar req,pmax,vth,ino,zeq,smax,αwantsit

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
ClrIO
Dialog
Title "Thevenin Equivalent"
DropDown "Type of Analysis",{"DC","AC","FD"},δta
EndDlog
If ok=0. Then
Return 
EndIf
EndIf

true→s\select
"{v"&µn1&",v"&µn2&"}"→s\savevars

If s\verbose Then
ClrIO
Disp "Symbulator is running an"
Disp "open-circuit simulation"
Disp "to find the circuit's"
Disp "Thévenin voltage."
Disp ""
Disp "Please wait."
EndIf

If δta=1 Then
"dc"→βtool
s\s5(expr("["&û&"]"),1)
DelVar βtool
EndIf

If δta=2 Then
If getType(s\ω)="STR" Then
s\ω→δω
DelVar s\ω
Else
Dialog
Title "Radial frequency"
Request "ω in rad/s",δω
EndDlog
If ok=0. Then
Return 
EndIf
EndIf
expr(δω)→δω
"ac"→βtool
s\s5(expr("["&û&"]"),δω)
DelVar βtool
EndIf

If δta=3 Then
"fd"→βtool
s\s5(expr("["&û&"]"),1)
DelVar βtool
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
If s\verbose Then
ClrIO
Disp "Thévenin voltage found!"
Disp "vTh is "&string(vth)
Disp "Symbulator will now run a"
Disp "short-circuit simulation"
Disp "to find the Norton current."
Disp "Please wait."
EndIf

û&";sε1,"&µn1&","&µn2&",0,0"→û

true→s\select

"{isε1,v"&µn1&",v"&µn2&"}"→s\savevars

If δta=1 Then
"dc"→βtool
s\s5(expr("["&û&"]"),1)
DelVar βtool
EndIf

If δta=2 Then
"ac"→βtool
s\s5(expr("["&û&"]"),δω)
DelVar βtool
EndIf

If δta=3 Then
"fd"→βtool
s\s5(expr("["&û&"]"),1)
DelVar βtool
EndIf

If ok=4. Then
0.→ok
DispHome
Return 
EndIf
ClrIO
If inString(string(isε1),"@")=0 Then
isε1→ino

If s\verbose Then
Disp "Norton current found!"
Disp "iNo is "&string(ino)
EndIf
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

If s\verbose Then
If δta=1 Then
Disp "Equivalent resistance"
Disp "found!. Req is "&string(req)
Else
Disp "Equivalent impedance"
Disp "found! zEq is "&string(zeq)
EndIf
EndIf

If δta=1 Then
vth*ino/4→pmax
If s\verbose Then
Disp "pMax is "&string(pmax)
EndIf
EndIf
If δta=2 Then
vth*conj(ino)/4→smax
If s\verbose Then
Disp "sMax is "&string(smax)
EndIf
EndIf
Pause "[ENTER] to continue."
ClrIO
Dialog
Title "Is a load next?"
Text "If you are planning to analyze next"
Text "a load connected to this, we can give"
Text "you an equivalent circuit you can use"
Text "and some key equations that will help."
DropDown "Interested?",{"Yes","No"},αwantsit
EndDlog

If αwantsit=1 Then

DelVar eqcir,irl,jn,load,n,prl,re,rl,srl,vrl

If δta=1 Then
"jN,0,n,iNo:rE,n,0,rEq:rL,n,0,Load"→eqcir
ino*req/(load+req)→irl
load*ino*req/(load+req)→vrl
load*ino^2*req^2/(load+req)^2→prl
Else
"jN,0,n,iNo:rE,n,0,zEq:rL,n,0,Load"→eqcir
ino*zeq/(load+zeq)→irl
load*ino*zeq/(load+zeq)→vrl
load*ino^2*zeq^2/(load+zeq)^2→srl
EndIf
EndIf


Lbl clean
s\s4(expr("["&û&"]"))

DelVar δtc,δta,δω,dcir,αncc,αnec,αszc,αζ1,αζ2,αζ3,αζ4,αζ5,isε1
s\s9()

DelVar û,αmetagat,αwantsit
If s\verbose Then
Disp "Elapsed: "&string(checkTmr(exact(s\tth)))&" seconds."
EndIf
DelVar s\tth
DispHome
EndPrgm
