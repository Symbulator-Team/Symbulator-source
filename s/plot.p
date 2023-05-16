()
Prgm
If ok=7. Then
Return 
EndIf
Local αxmin,αxmax,αvar,αxvar
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
Lbl reenter
Dialog
Title "Plot"
Request "Function f(t)",αxvar
Request "Minimal time",αxmin
Request "Maximal time",αxmax
EndDlog
If ok=0. Then
Return 
EndIf
DelVar t
expr(αxvar)→αvar
If string(αvar)=string(αvar|t=0) Then
Dialog
Title "Notice!"
Text "Function is not a function"
Text "of time. Time variable = t."
Text "Please, enter it again."
EndDlog
Goto reenter
EndIf
expr(αxmin)→xmin
expr(αxmax)→xmax
If not (xmin<xmax) Then
Dialog
Title "Notice!"
Text "Minimal time must be"
Text "smaller than Maximal time."
Text "Please, enter them again."
EndDlog
Goto reenter
EndIf
(xmax-xmin)/10→xscl
expr("Define y1(x)="&string(αvar)&"|t=x")
PlotsOff :PlotsOn 1:ZoomFit
PxlText "űtime(sec)▶",68,3
PxlText "ų",51,150:PxlText "e",44,150:PxlText "u",37,150:PxlText "u",37,150:PxlText "l",30,150:PxlText "a",21,150:PxlText "v",14,150:PxlText "Ų",8,150
EndPrgm
