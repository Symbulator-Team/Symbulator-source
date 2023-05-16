()
Prgm
If ok=7. Then
Return 
EndIf
If s\verbose Then
Disp "Setting old modes."
EndIf

setMode("Display Digits",αζmode[1])
setMode("Exponential Format",αζmode[2])
setMode("Exact/Approx",αζmode[3])
setMode("Complex Format",αζmode[4])
setMode("Angle",αζmode[5])
setMode("Base",αζmode[6])
DelVar αζmode
DispHome
EndPrgm
