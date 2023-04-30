(â)
Prgm
If ok=7. Then
Return 
EndIf
startTmr()→s\tex
true→s\verbose
Local αna
ClrIO
"Expert"→αpurpose

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
If s\toa="TR" Then
4→δta
EndIf
EndIf

DelVar s\toa

If getType(δta)="NONE" Then
Dialog
Title "Expert Mode"
DropDown "Type of Analysis",{"DC","AC","FD","TR"},δta
EndDlog
If ok=0. Then
DelVar αpurpose
Return 
EndIf
EndIf

If δta=1 Then
s\dc(â)
EndIf
If δta=2 Then
Dialog
Title "Enter radial frequency"
Request "ω in rad/s",δω
EndDlog
If ok=0. Then
DelVar αpurpose
Return 
EndIf
expr(δω)→δω
s\ac(â,δω)
EndIf
If δta=3 Then
s\fd(â)
EndIf
If δta=4 Then
s\tr(â)
EndIf

DelVar δta,û,s\verbose,newequ,newunk,αpurpose
Disp "Elapsed: "&string(checkTmr(exact(s\tex)))&" seconds."
DelVar s\tex
DispHome
EndPrgm
