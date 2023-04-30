()
Prgm
If ok=7. Then
Return 
EndIf
Local γv1,γv2,γi1,γi2
Dialog
Title "Enter in/out values"
Request "In voltage",γv1
Request "In current",γi1
Request "Out voltage",γv2
Request "Out current",γi2
EndDlog
If ok=0. Then
Return 
EndIf
expr(γv2&"/"&γv1&"→Av")
expr(γi2&"/"&γi1&"→Ai")
real(–av*conj(ai))→ap
expr(γv1&"/"&γi1&"→Zi")
ClrIO
Disp "Values Found"
Disp "Press [ENTER] to see them."
Disp "Voltage gain or Av"
Pause av
Disp "Current gain or Ai"
Pause ai
Disp "Power gain or Ap"
Pause ap
Disp "Input impedance or Zi"
Pause zi
DispHome
EndPrgm