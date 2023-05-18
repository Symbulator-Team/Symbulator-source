(â,µn1,µn2)
Prgm
If ok=7. Then
Return 
EndIf
startTmr()→s\tpo
true→αmetagat
If getType(s\verbose)="NONE" Then
true→s\verbose
EndIf

Local αp11,αp12,αp21,αp22
If getMode("Exact/Approx")="APPROXIMATE" Then
exact(µn1)→µn1
exact(µn2)→µn2
EndIf
DelVar βtool
"po"→βtool
s\s0(â,ω,exact(µn1),exact(µn2))
DelVar βtool
If ok=3. Then
0.→ok
DispHome
Return 
EndIf
Lbl again

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
Title "Find 2-port parameters"
DropDown "Type of Analysis",{"DC","AC","FD"},δta
EndDlog
If ok=0. Then
Return 
EndIf
EndIf
If getType(s\dtp)="STR" and getType(s\dtn)="STR" Then
If s\dtp="z" Then
1→δtp
EndIf
If s\dtp="y" Then
2→δtp
EndIf
If s\dtp="h" Then
3→δtp
EndIf
If s\dtp="g" Then
4→δtp
EndIf
If s\dtp="a" Then
5→δtp
EndIf
If s\dtp="b" Then
6→δtp
EndIf
s\dtn→δnm
Else
Dialog
Title "Find 2-port parameters"
DropDown "Desired Parameters",{"z","y","h","g","a","b"},δtp
Request "2-port name",δnm
EndDlog
If ok=0. Then
Return 
EndIf
EndIf

If δnm="" or dim(δnm)>6 Then
Text "Invalid name."
Goto again
EndIf
string(µn1)→µn1
string(µn2)→µn2

If δtp=1 or δtp=5 Then
"jε1,0,"&µn1&",jε1,0;jε2,0,"&µn2&",jε2,0;"&û→û
EndIf
If δtp=2 or δtp=4 Then
"eε1,"&µn1&",0,eε1,0;eε2,"&µn2&",0,eε2,0;"&û→û
EndIf
If δtp=3 or δtp=6 Then
"jε1,0,"&µn1&",jε1,0;eε2,"&µn2&",0,eε2,0;"&û→û
EndIf

If δta=1 Then
"dc"→βtool
s\s5(expr("["&û&"]"),1)
DelVar βtool
EndIf
If δta=2 Then
Dialog
Title "Enter radial frequency"
Request "ω in rad/s",δω
EndDlog
If ok=0. Then
Return 
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
Return 
EndIf
If δtp=1 Then
expr("DelVar z"&δnm&"11,z"&δnm&"12,z"&δnm&"21,z"&δnm&"22")
expr("v"&µn1&"/jε1|jε2=0→z"&δnm&"11")
expr("v"&µn1&"/jε2|jε1=0→z"&δnm&"12")
expr("v"&µn2&"/jε1|jε2=0→z"&δnm&"21")
expr("v"&µn2&"/jε2|jε1=0→z"&δnm&"22")
EndIf
If δtp=2 Then
expr("DelVar y"&δnm&"11,y"&δnm&"12,y"&δnm&"21,y"&δnm&"22")
expr("–ieε1/v"&µn1&"|eε2=0→y"&δnm&"11")
expr("–ieε1/v"&µn2&"|eε1=0→y"&δnm&"12")
expr("–ieε2/v"&µn1&"|eε2=0→y"&δnm&"21")
expr("–ieε2/v"&µn2&"|eε1=0→y"&δnm&"22")
EndIf
If δtp=3 Then
expr("DelVar h"&δnm&"11,h"&δnm&"12,h"&δnm&"21,h"&δnm&"22")
expr("v"&µn1&"/jε1|eε2=0→h"&δnm&"11")
expr("v"&µn1&"/v"&µn2&"|jε1=0→h"&δnm&"12")
expr("–ieε2/jε1|eε2=0→h"&δnm&"21")
expr("–ieε2/v"&µn2&"|jε1=0→h"&δnm&"22")
EndIf
If δtp=4 Then
expr("DelVar g"&δnm&"11,g"&δnm&"12,g"&δnm&"21,g"&δnm&"22")
expr("–ieε1/v"&µn1&"|eε2=0→αp11")
expr("–ieε1/v"&µn2&"|eε1=0→αp12")
expr("–ieε2/v"&µn1&"|eε2=0→αp21")
expr("–ieε2/v"&µn2&"|eε1=0→αp22")
expr("(αp11*αp22-αp12*αp21)/αp22→g"&δnm&"11")
expr("αp12/αp22→g"&δnm&"12")
expr("–αp21/αp22→g"&δnm&"21")
expr("1/αp22→g"&δnm&"22")
EndIf
If δtp=5 Then
expr("DelVar a"&δnm&"11,a"&δnm&"12,a"&δnm&"21,a"&δnm&"22")
expr("v"&µn1&"/jε1|jε2=0→αp11")
expr("v"&µn1&"/jε2|jε1=0→αp12")
expr("v"&µn2&"/jε1|jε2=0→αp21")
expr("v"&µn2&"/jε2|jε1=0→αp22")
expr("αp11/αp21→a"&δnm&"11")
expr("(αp11*αp22-αp12*αp21)/αp21→a"&δnm&"12")
expr("1/αp21→a"&δnm&"21")
expr("αp22/αp21→a"&δnm&"22")
EndIf
If δtp=6 Then
expr("DelVar b"&δnm&"11,b"&δnm&"12,b"&δnm&"21,b"&δnm&"22")
expr("v"&µn1&"/jε1|eε2=0→αp11")
expr("v"&µn1&"/v"&µn2&"|jε1=0→αp12")
expr("–ieε2/jε1|eε2=0→αp21")
expr("–ieε2/v"&µn2&"|jε1=0→αp22")
expr("1/αp12→b"&δnm&"11")
expr("–αp11/αp12→b"&δnm&"12")
expr("αp22/αp12→b"&δnm&"21")
expr("(αp11*αp22-αp12*αp21)/αp12→b"&δnm&"22")
EndIf
s\s4(expr("["&û&"]"))
ClrIO
Disp "Parameters have been found"
Disp "and are stored in memory."
Disp "Elapsed: "&string(checkTmr(exact(s\tpo)))&" seconds."
DelVar s\tpo
Pause "[ENTER] to see one by one:"
If δtp=1 Then
Pause "z"&δnm&"11 is "&string(expr("z"&δnm&"11"))
Pause "z"&δnm&"12 is "&string(expr("z"&δnm&"12"))
Pause "z"&δnm&"21 is "&string(expr("z"&δnm&"21"))
Pause "z"&δnm&"22 is "&string(expr("z"&δnm&"22"))
EndIf
If δtp=2 Then
Pause "y"&δnm&"11 is "&string(expr("y"&δnm&"11"))
Pause "y"&δnm&"12 is "&string(expr("y"&δnm&"12"))
Pause "y"&δnm&"21 is "&string(expr("y"&δnm&"21"))
Pause "y"&δnm&"22 is "&string(expr("y"&δnm&"22"))
EndIf
If δtp=3 Then
Pause "h"&δnm&"11 is "&string(expr("h"&δnm&"11"))
Pause "h"&δnm&"12 is "&string(expr("h"&δnm&"12"))
Pause "h"&δnm&"21 is "&string(expr("h"&δnm&"21"))
Pause "h"&δnm&"22 is "&string(expr("h"&δnm&"22"))
EndIf
If δtp=4 Then
Pause "g"&δnm&"11 is "&string(expr("g"&δnm&"11"))
Pause "g"&δnm&"12 is "&string(expr("g"&δnm&"12"))
Pause "g"&δnm&"21 is "&string(expr("g"&δnm&"21"))
Pause "g"&δnm&"22 is "&string(expr("g"&δnm&"22"))
EndIf
If δtp=5 Then
Pause "a"&δnm&"11 is "&string(expr("a"&δnm&"11"))
Pause "a"&δnm&"12 is "&string(expr("a"&δnm&"12"))
Pause "a"&δnm&"21 is "&string(expr("a"&δnm&"21"))
Pause "a"&δnm&"22 is "&string(expr("a"&δnm&"22"))
EndIf
If δtp=6 Then
Pause "b"&δnm&"11 is "&string(expr("b"&δnm&"11"))
Pause "b"&δnm&"12 is "&string(expr("b"&δnm&"12"))
Pause "b"&δnm&"21 is "&string(expr("b"&δnm&"21"))
Pause "b"&δnm&"22 is "&string(expr("b"&δnm&"22"))
EndIf
DelVar δtp,δta,δnm,dcir,δω,αncc,αnec,αszc,αζ1,αζ2,αζ3,αζ4,αζ5
s\s9()
DelVar û,αmetagat,s\dtn,s\dtp
DispHome
EndPrgm
