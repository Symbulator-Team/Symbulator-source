()
Prgm

If inString(s\sit,"'")≠0 Then
s\sr("'k","*13")
s\sr("'K","*13")
s\sr("'M","*16")
s\sr("'G","*19")
s\sr("'T","*112")
s\sr("'P","*115")
s\sr("'E","*118")
s\sr("'m","*1–3")
s\sr("'µ","*1–6")
s\sr("'n","*1–9")
s\sr("'p","*1–12")
s\sr("'f","*1–15")
s\sr("'a","*1–18")
If inString(s\sit,"'")≠0 Then
ClrIO
Dialog
Title "Notice!"
Text "Your circuit description uses some"
Text "shorthand that Symbulator does not"
Text "recognize. Please fix that. Thanks!"
EndDlog
3.→ok
EndIf
EndIf

EndPrgm
