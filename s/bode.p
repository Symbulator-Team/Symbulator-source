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
DelVar y1,y2:ClrGraph:setMode("Complex Format","RECTANGULAR"):setMode("Angle","RADIAN"):setMode("Graph","FUNCTION"):setGraph("Axes","On"):setGraph("Labels","Off"):setGraph("Coordinates","Rect"):
PopUp {"Bode Plot","Clean & Exit"},Πp

©Bode
If Πp=1 Then
Lbl reenter
Dialog
Title "Symbulator Bode Plot"
Request "Transfer function",Πf
Request "Indepen. variable",Πv
DropDown "Plot type",{"Gain Plot","Phase Plot","Both Plots"},Πt
Request "Minimal frequency",Πi
Request "Maximal frequency",Πo
DropDown "Frequencies given",{"in rad/sec","in Hz"},Πx
EndDlog
If ok=0. Then
Return 
EndIf
If not (#Πi>0) Then
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
DelVar #Πv
If Πt=1 and Πx=1 Then
Define y1(x)=(20*log(abs(#Πf)))|#Πv=*10^(x)
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
Define y1(x)=(20*log(abs(#Πf)))|#Πv=*10^(x)*(2*π)
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
Define y2(x)=angle(#Πf)|#Πv=*10^(x)
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
Define y2(x)=angle(#Πf)|#Πv=*10^(x)*(2*π)
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
switch(1):PlotsOff :PlotsOn 1:Define y1(x)=(20*log(abs(#Πf)))|#Πv=*10^(x):ZoomFit
switch(2):PlotsOff :PlotsOn 2:Define y2(x)=angle(#Πf)|#Πv=*10^(x):ZoomFit
EndIf
If Πt=3 and Πx=2 Then
Define y1(x)=(20*log(abs(#Πf)))|#Πv=*10^(x)*(2*π)
Define y2(x)=angle(#Πf)|#Πv=*10^(x)*(2*π)
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
If Πp=2 Then
PlotsOff :ClrGraph:
DelVar y1,y2,Πp,Πf,Πv,Πt,Πi,Πo,Πx
EndIf
EndPrgm
