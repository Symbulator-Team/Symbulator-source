(α)
Func
Local β1,β2
If getMode("Angle")="RADIAN" Then
approx(abs(α))→β1
approx(180/(π)*angle(α))→β2
Return string(β1)&" ∠ "&string(β2)&"°"
Else
approx(abs(α))→β1
approx(angle(α))→β2
Return string(β1)&" ∠ "&string(β2)&"°"
EndIf
EndFunc
