(â,ω,µn1,µn2)
Prgm
If ok=7. Then
Return 
EndIf
If right(left(string(getConfg()),14),12)≠"Product Name" Then
ClrIO
Dialog
Title "Notice!"
Text "Symbulator requires you to"
Text "set English as language in"
Text "MODE. Sorry!"
EndDlog
3.→ok
Return 
EndIf
©=
If getType(αeql)≠"NONE" Then
ClrIO
Dialog
Title "Warning:"
Text "It seems some variables from"
Text "a previous failed simulation"
Text "remain in folder "&getFold()&"."
Text "Erase all these variables."
EndDlog
Dialog
Title "Friendly Tip"
Text "If the calculator failed to"
Text "solve the equations and you"
Text "used exact numeric values,"
Text "try with approximate values,"
Text "or else with symbolic values."
EndDlog
3.→ok
Return 
EndIf

If s\verbose Then
s\version()
EndIf

{getMode("Display Digits"),getMode("Exponential Format"),getMode("Exact/Approx"),getMode("Complex Format"),getMode("Angle"),getMode("Base")}→αζmode
setMode("Exact/Approx","AUTO")
setMode("Complex Format","RECTANGULAR")
setMode("Angle","RADIAN")
setMode("Base","DEC")

If s\ck Then
If s\verbose Then
Disp "Checking input description."

EndIf

If getType(â)="STR" Then
©
":"&â→ç

s\s1()

©Prefixes
ç→s\sit
s\si()
s\sit→ç
DelVar s\sit
©

If inString("fd,tr",βtool)≠0 Then
s\s2("l",5)
s\s2("c",5)
Else
s\s2("l",4)
s\s2("c",4)
EndIf

s\s2("r",4)
s\s2("e",4)
s\s2("j",4)
s\s2("o",4)
s\s2("m",4)
s\s2("s",3)
s\s2("z",3)
s\s2("y",3)
s\s2("h",3)
s\s2("g",3)
s\s2("a",3)
s\s2("b",3)
s\s2("t",5)

If ok=3. Then
DelVar αζmode,βtool,ç
Return 
EndIf
dim(ç)-1→çlen
right(ç,çlen)→û

©
0→colon
While inString(û,":",colon+1)≠0
inString(û,":",colon+1)→colon
left(û,colon-1)&";"&mid(û,colon+1)→û
EndWhile
DelVar colon

©
s\s3(expr("["&û&"]"),ω,µn1,µn2)
If ok=3. Then
Return 
EndIf
s\s4(expr("["&û&"]"))
DelVar çlen,ç,u

Else
ClrIO
Dialog
Title "Notice!"
Text "Symbulator requires the"
Text "circuit description to be"
Text "a string. Fix the circuit"
Text "description, please."
EndDlog
3.→ok
EndIf
Else
If getType(v0)="NUM" Then
ClrIO
Dialog
Title "Notice!"
Text "You've decided to skip the"
Text "circuit description check."
Text "Symbulator requires you to"
Text "manually clean "&getFold()&" folder."
EndDlog
3.→ok
EndIf
EndIf
EndPrgm
