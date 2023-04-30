(vars)
Prgm
If ok=7 Then
Return 
EndIf
true→s\select
If getType(vars)="STR" Then
If vars="" Then
Dialog
Title "Error!"
Text "The argument of s\only cannot"
Text "be an empty string."
EndDlog
0.→ok
Return 
Else
"{"&vars&"}"→s\savevars
EndIf
Else
If part(vars)=0 Then
"{"&string(vars)&"}"→s\savevars
Else
Dialog
Title "Error!"
Text "The argument of s\only has to"
Text "be either a string or a single"
Text "variable not already in use."
EndDlog
0.→ok
Return 
EndIf
EndIf

DelVar vars
EndPrgm
