(ê,ω)
Prgm
If ok=7. Then
Return 
EndIf
setMode("Display Digits","FLOAT 9")
setMode("Exponential Format","Normal")
0.→ok
DelVar αζ,αζg,ζβζ,ζζ,αζt,αszc,αnec,αncc,αuk1,αuk2,αeql,αdl,αζ11,µutual
false→µutual
false→iµpaλa
"{0"→iµpaexe
":"→iµpavars
dim(ê)→αszc
αszc[1]→αnec
αszc[2]→αncc
For αζ,1,αnec
string(ê[αζ,1])→αζ1
left(αζ1,1)→αζ11
string(ê[αζ,2])→αζ2
string(ê[αζ,3])→αζ3
string(ê[αζ,4])→αζ4
If αncc<5 Then
"0"→αζ5
Else
string(ê[αζ,5])→αζ5
EndIf
expr("DelVar Γζ"&αζ2)
expr("DelVar Γζ"&αζ3)
expr("DelVar eq"&αζ1)
©
If αζ11="m" Then
true→µutual
EndIf
©
If βtool="tr" and inString("e,j",αζ11)≠0 Then
ê[αζ,4]→αζ4e
If αζ4≠string(αζ4e|t=0) Then
©ImpŲ in TR
true→iµpaλa
expr("DelVar φ"&αζ1)
iµpavars&"φ"&αζ1&":"→iµpavars
iµpaexe&",φ"&αζ1&"="&string(dif\laplace(αζ4e,t))→iµpaexe
expr("φ"&αζ1)→ê[αζ,4]
Else
getType(αζ4e)→αζ4t
If αζ4t="NUM" Then
αζ4e/s→ê[αζ,4]
ElseIf αζ4t="EXPR" or αζ4t="VAR" Then
false→αζ4f
DelVar ζζ,γζ
For γζ,1,αnec
string(ê[γζ,1])→γζ1
left(γζ1,1)→γζ11
string(ê[γζ,2])→γζ2
string(ê[γζ,3])→γζ3
string(ê[γζ,4])→γζ4
string(ê[γζ,5])→γζ5
©©
If inString("rjesocltzyhgab",αζ11)≠0 Then
If αζ4≠string(expr(αζ4&"|v"&γζ2&"=0")) Then
true→αζ4f
Goto θ
EndIf
If αζ4≠string(expr(αζ4&"|v"&γζ3&"=0")) Then
true→αζ4f
Goto θ
EndIf
EndIf

If inString("rejsocl",αζ11)≠0 Then
If αζ4≠string(expr(αζ4&"|i"&γζ1&"=0")) Then
true→αζ4f
Goto θ
EndIf
EndIf

If inString("rejcl",αζ11)≠0 Then
If αζ4≠string(expr(αζ4&"|v"&γζ1&"=0")) Then
true→αζ4f
Goto θ
EndIf
EndIf

If inString("tzyghab",αζ11)≠0 Then
If αζ4≠string(expr(αζ4&"|i"&γζ1&γζ2&"=0")) Then
true→αζ4f
Goto θ
EndIf
If αζ4≠string(expr(αζ4&"|i"&γζ1&γζ3&"=0")) Then
true→αζ4f
Goto θ
EndIf
EndIf

If γζ11="o" Then
If αζ4≠string(expr(αζ4&"|v"&γζ4&"=0")) Then
true→αζ4f
Goto θ
EndIf
EndIf
EndFor
Lbl θ
If αζ4f Then
αζ4e→ê[αζ,4]
Else
αζ4e/s→ê[αζ,4]
EndIf
EndIf
EndIf
EndIf
©=
If βtool="fd" and inString("e,j",αζ11)≠0 Then
If string(ê[αζ,4])≠string(ê[αζ,4]|s=0) Then
©ImpŲ in FD
true→iµpaλa
expr("DelVar φ"&αζ1)
iµpavars&"φ"&αζ1&":"→iµpavars
iµpaexe&",φ"&αζ1&"="&string(ê[αζ,4])→iµpaexe
expr("φ"&αζ1)→ê[αζ,4]
EndIf
EndIf
©=
DelVar αζ11
EndFor
s\s6(ê,ω)
setMode("Pretty Print","On")
If iµpaλa Then
For αζ,1,αnec
string(ê[αζ,1])→αζ1
left(αζ1,1)→αζ11
If αζ11="e" Then
"φ"&αζ1&":"→iµpavar
If inString(iµpavars,iµpavar)≠0 Then
expr("φ"&αζ1&"→v"&αζ1)
expr("DelVar φ"&αζ1)
EndIf
EndIf
If αζ11="j" Then
"φ"&αζ1&":"→iµpavar
If inString(iµpavars,iµpavar)≠0 Then
©expr("φ"&αζ1&"→i"&αζ1)
expr("DelVar φ"&αζ1)
EndIf
EndIf
EndFor
EndIf

DelVar αζ,ζζ,ζβζ,αszc,αnec,αncc,iµpavar,iµpavars,iµpaexe,iµpaj,iµpaλa,αζ1,αζ2,αζ3,αζ4,αζ5,γζ1,γζ2,γζ3,γζ4,γζ5,αζrox,αζ11,αζ4e,αζ4f,αζ4t,γζ11
EndPrgm
