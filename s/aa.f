(α)
Func
Local β1,β2
If getMode("Angle")="RADIAN" Then
approx(abs(α))→β1
approx(180/(π)*angle(α))→β2
Return format(β1,"e3")&"∠"&string(round(β2,2))&"°"
Else
approx(abs(α))→β1
approx(angle(α))→β2
Return format(β1,"e3")&"∠"&string(round(β2,2))&"°"
EndIf
EndFunc
