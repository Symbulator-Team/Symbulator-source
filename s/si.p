()
Prgm

If βtool="fd" and instring(s\sit,"{")≠0 Then
s\sr("{","s\t2s(")
s\sr("}",")")
EndIf

If instring(s\sit,"[")≠0 Then
s\sr("[","s\pr({")
s\sr("]","})")
EndIf

If instring(s\sit,"'")≠0 Then
s\sr("'k","*10^3")
s\sr("'K","*10^3")
s\sr("'M","*10^6")
s\sr("'G","*10^9")
s\sr("'T","*10^12")
s\sr("'P","*10^15")
s\sr("'E","*10^18")
s\sr("'m","*10^–3")
s\sr("'µ","*10^–6")
s\sr("'n","*10^–9")
s\sr("'p","*10^–12")
s\sr("'f","*10^–15")
s\sr("'a","*10^–18")
If instring(s\sit,"'")≠0 Then
ClrIO
Dialog
Title "Notice!"
Text "Your circuit description uses some"
Text "shorthand that Symbulator does not"
Text "recognize. Please fix that. Thanks!"
EndDlog
3→ok
EndIf
EndIf

EndPrgm
