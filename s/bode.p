()
Prgm
If ok=7. Then
Return
EndIf
If right(left(string(getConfg()),14),12)≠"Product Name" Then
Dialog
Title "Notice!"
Text "Symbulator requires you to"
Text "set English as language in"
Text "MODE. Sorry!"
EndDlog
3.→ok
Return
EndIf
DelVar y1,y2
ClrGraph
getMode("all")→savemode
setMode("Complex Format","RECTANGULAR"):setMode("Angle","RADIAN"):setMode("Graph","FUNCTION"):setGraph("Axes","On"):setGraph("Labels","Off"):setGraph("Coordinates","Rect"):

PopUp {"Bode Plot","Clean & Exit"},Πp

©Bode
If Πp=1 Then
Lbl reenter
Dialog
Title "Symbulator Bode Plot"
Request "Transfer function",Πf
DropDown "Plot type",{"Gain Plot","Phase Plot","Both Plots"},Πt
Request "Minimal frequency",Πi,0
Request "Maximal frequency",Πo,0
DropDown "Frequencies given",{"in rad/sec","in Hz"},Πx
EndDlog
If ok=0. Then
Return
EndIf
Πf→s\sit:s\si():s\sit→Πf
Πi→s\sit:s\si():s\sit→Πi
Πo→s\sit:s\si():s\sit→Πo
If Πi="" Then
"1–2"→Πi
EndIf
If Πo="" Then
"12"→Πo
EndIf

If not (expr(Πi)>0) Then
Dialog
Title "Notice!"
Text "Minimal frequency can't be"
Text "0. Please, enter it again."
EndDlog
Goto reenter
EndIf
log(#Πi)→xmin
If not (#Πi<#Πo) Then
Dialog
Title "Notice!"
Text "Minimal frequency must be"
Text "smaller than Maximal freq."
Text "Please, enter them again."
EndDlog
Goto reenter
EndIf
log(#Πo)→xmax
(xmax-xmin)/10→xscl

DelVar Πv

If getType(ω)≠"NONE" Then
Dialog
Title "ω will be erased"
Text "This program requires ω to be empty."
Text "If you proceed, var ω will be erased."
DropDown "Proceed?",{"Yes","No"},Πdelω
EndDlog
If ok=0. Then
Return
EndIf
If Πdelω=1 Then
DelVar ω
EndIf
EndIf

If getType(s)≠"NONE" Then
Dialog
Title "s will be erased"
Text "This program requires s to be empty."
Text "If you proceed, var s will be erased."
DropDown "Proceed?",{"Yes","No"},Πdels
EndDlog
If ok=0. Then
Return
EndIf
If Πdels=1 Then
DelVar s
EndIf
EndIf

string(expr(Πf))→Πf

If inString(Πf,"ω")≠0 Then
real(expr(Πf)|ω=1.)→Πe
If getType(Πe)="NUM" Then
"ω"→Πv
EndIf
EndIf
If inString(Πf,"s")≠0 Then
expr(Πf)|s=1.→Πe
If getType(Πe)="NUM" Then
"s"→Πv
EndIf
EndIf
If getType(Πv)="NONE" Then
Dialog
Title "Notice!"
Text "Symbulator requires you to"
Text "enter a function of s or ω."
Text "Please revise the function."
EndDlog
3.→ok
Return
EndIf

If Πt=1 and Πx=1 Then

If Πv="s" Then
expr("Define y1(x)=(20*log(abs("&Πf&")))|s=*10^(x)")
ElseIf Πv="ω" Then
expr("Define y1(x)=(20*log(abs("&Πf&")))|ω=10^(x)")
EndIf
setMode("Split Screen","FULL")
Dialog
Title "Axis units"
Text "Vertical axis = dB"
Text "Horizontal axis = log(rad/sec)"
EndDlog
If ok=0. Then
Return
EndIf
PlotsOff :PlotsOn 1:ZoomFit
EndIf
If Πt=1 and Πx=2 Then
If Πv="s" Then
expr("Define y1(x)=(20*log(abs("&Πf&")))|s=*10^(x)*(2*π)")
ElseIf Πv="ω" Then
expr("Define y1(x)=(20*log(abs("&Πf&")))|ω=10^(x)*(2*π)")
EndIf
setMode("Split Screen","FULL")
Dialog
Title "Axis units"
Text "Vertical axis = dB"
Text "Horizontal axis = log(Hz)"
EndDlog
If ok=0. Then
Return
EndIf
PlotsOff :PlotsOn 1:ZoomFit
EndIf
If Πt=2 and Πx=1 Then

If Πv="s" Then
expr("Define y2(x)=angle("&Πf&")|s=*10^(x)")
ElseIf Πv="ω" Then
expr("Define y2(x)=angle("&Πf&")|ω=10^(x)")
EndIf
setMode("Split Screen","FULL")
Dialog
Title "Axis units"
Text "Vertical axis = rad"
Text "Horizontal axis = log(rad/sec)"
EndDlog
If ok=0. Then
Return
EndIf
PlotsOff :PlotsOn 1:ZoomFit
EndIf
If Πt=2 and Πx=2 Then
If Πv="s" Then
expr("Define y2(x)=angle("&Πf&")|s=*10^(x)*(2*π)")
ElseIf Πv="ω" Then
expr("Define y2(x)=angle("&Πf&")|ω=10^(x)*(2*π)")
EndIf
setMode("Split Screen","FULL")
Dialog
Title "Axis units"
Text "Vertical axis = rad"
Text "Horizontal axis = log(Hz)"
EndDlog
If ok=0. Then
Return
EndIf
PlotsOff :PlotsOn 1:ZoomFit
EndIf
If Πt=3 and Πx=1 Then
setMode("Split Screen","TOP-BOTTOM"):setMode("Number of Graphs","2"):setMode("Graph 2","FUNCTION")
Dialog
Title "Axis units"
Text "Vertical axis - Top = dB"
Text "Vertical axis - Bottom = rad"
Text "Horizontal axis = log(rad/sec)"
EndDlog
If ok=0. Then
Return
EndIf
If Πv="s" Then
switch(1):PlotsOff :PlotsOn 1:expr("Define y1(x)=(20*log(abs("&Πf&")))|s=*10^(x)"):ZoomFit
switch(2):PlotsOff :PlotsOn 2:expr("Define y2(x)=angle("&Πf&")|s=*10^(x)"):ZoomFit
ElseIf Πv="ω" Then
switch(1):PlotsOff :PlotsOn 1:expr("Define y1(x)=(20*log(abs("&Πf&")))|ω=10^(x)"):ZoomFit
switch(2):PlotsOff :PlotsOn 2:expr("Define y2(x)=angle("&Πf&")|ω=10^(x)"):ZoomFit
EndIf
EndIf
If Πt=3 and Πx=2 Then
If Πv="s" Then
expr("Define y1(x)=(20*log(abs("&Πf&")))|s=*10^(x)*(2*π)")
expr("Define y2(x)=angle("&Πf&")|s=*10^(x)*(2*π)")
ElseIf Πv="ω" Then
expr("Define y1(x)=(20*log(abs("&Πf&")))|ω=10^(x)*(2*π)")
expr("Define y2(x)=angle("&Πf&")|ω=10^(x)*(2*π)")
EndIf
setMode("Split Screen","TOP-BOTTOM"):setMode("Number of Graphs","2"):setMode("Graph 2","FUNCTION")
Dialog
Title "Axis units"
Text "Vertical axis - Top = dB"
Text "Vertical axis - Bottom = rad"
Text "Horizontal axis = log(Hz)"
EndDlog
If ok=0. Then
Return
EndIf
switch(1):PlotsOff :PlotsOn 1:ZoomFit
switch(2):PlotsOff :PlotsOn 2:ZoomFit
EndIf
EndIf

©Exit
If Πp=2 Then
PlotsOff :ClrGraph:
setMode(savemode)
DelVar y1,y2,Πp,Πf,Πv,Πt,Πi,Πo,Πx,Πe,Πdels,Πdelω,savemode
EndIf
EndPrgm
