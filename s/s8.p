(ê,αζ1,αζ2,αζ3,αζ4,αζ5,ω)
Prgm
If ok=7 Then
Return 
EndIf
DelVar ζζflag
left(αζ1,1)→αζ11
If instring("r,l,c",αζ11)≠0 Then
expr("(v"&αζ2&"-v"&αζ3&")→v"&αζ1)
EndIf
©
If αζ11="r" and αζ4≠"0" Then
false→ζζflag
If µutual and βtool="ac" Then
DelVar ζζ,γζ
"0"→ζζ
For γζ,1,αnec
string(ê[γζ,1])→γζ1
string(ê[γζ,2])→γζ2
string(ê[γζ,3])→γζ3
string(ê[γζ,4])→γζ4
string(ê[γζ,5])→γζ5
If left(γζ1,1)="m" and γζ2=αζ1 and γζ4≠"0" Then
true→ζζflag
"((i"&γζ3&")*("&γζ4&"))+"&ζζ→ζζ
EndIf
If left(γζ1,1)="m" and γζ3=αζ1 and γζ4≠"0" Then
true→ζζflag
"((i"&γζ2&")*("&γζ4&"))+"&ζζ→ζζ
EndIf
EndFor
EndIf
If ζζflag Then
expr("cSolve((v"&αζ2&"-v"&αζ3&")=("&αζ4&")*(i"&αζ1&")+("&ζζ&"),i"&αζ1&")→eq"&αζ1)
αeql&"eq"&αζ1&" and "→αeql
αdl&"eq"&αζ1&","→αdl
αuk1&"i"&αζ1&","→αuk1
Else
expr("(v"&αζ2&"-v"&αζ3&")/("&αζ4&")→i"&αζ1)
αuk2&"i"&αζ1&","→αuk2
EndIf
If αζ2≠"0" and expr("getType(Γζ"&αζ2&")")="NONE" Then
expr("0→βζ"&αζ2)
αeql&"Γζ"&αζ2&" and "→αeql
αdl&"Γζ"&αζ2&","→αdl
αdl&"βζ"&αζ2&","→αdl
EndIf
expr("βζ"&αζ2&"+i"&αζ1&"→βζ"&αζ2)
expr("βζ"&αζ2&"=0→Γζ"&αζ2)
If αζ3≠"0" and expr("getType(Γζ"&αζ3&")")="NONE" Then
expr("0→βζ"&αζ3)
αeql&"Γζ"&αζ3&" and "→αeql
αdl&"Γζ"&αζ3&","→αdl
αdl&"βζ"&αζ3&","→αdl
EndIf
expr("βζ"&αζ3&"-i"&αζ1&"→βζ"&αζ3)
expr("βζ"&αζ3&"=0→Γζ"&αζ3)
If αζ2≠"0" and instring(αuk1,"v"&αζ2)=0 Then
αuk1&"v"&αζ2&","→αuk1
EndIf
If αζ3≠"0" and instring(αuk1,"v"&αζ3)=0 Then
αuk1&"v"&αζ3&","→αuk1
EndIf
EndIf
©
If αζ11="e" Then
expr(αζ4&"→v"&αζ1)
If αζ4≠"0" Then
expr("(v"&αζ2&"-"&"v"&αζ3&")=("&αζ4&")→eq"&αζ1)
EndIf

αeql&"eq"&αζ1&" and "→αeql
αdl&"eq"&αζ1&","→αdl
If αζ2≠"0" and expr("getType(Γζ"&αζ2&")")="NONE" Then
expr("0→βζ"&αζ2)
αeql&"Γζ"&αζ2&" and "→αeql
αdl&"Γζ"&αζ2&","→αdl
αdl&"βζ"&αζ2&","→αdl
EndIf
expr("βζ"&αζ2&"+i"&αζ1&"→βζ"&αζ2)
expr("βζ"&αζ2&"=0→Γζ"&αζ2)
If αζ3≠"0" and expr("getType(Γζ"&αζ3&")")="NONE" Then
expr("0→βζ"&αζ3)
αeql&"Γζ"&αζ3&" and "→αeql
αdl&"Γζ"&αζ3&","→αdl
αdl&"βζ"&αζ3&","→αdl
EndIf
expr("βζ"&αζ3&"-i"&αζ1&"→βζ"&αζ3)
expr("βζ"&αζ3&"=0→Γζ"&αζ3)
If αζ2≠"0" and instring(αuk1,"v"&αζ2)=0 Then
αuk1&"v"&αζ2&","→αuk1
EndIf
If αζ3≠"0" and instring(αuk1,"v"&αζ3)=0 Then
αuk1&"v"&αζ3&","→αuk1
EndIf
αuk1&"i"&αζ1&","→αuk1
EndIf
If left(αζ1,1)="j" Then
If iµpaλa=true Then
"φ"&αζ1&":"→iµpavar
If instring(iµpavars,iµpavar)≠0 Then
αuk2&"i"&αζ1&","→αuk2
EndIf
EndIf
expr(αζ4&"→i"&αζ1)
expr("(v"&αζ2&"-v"&αζ3&")→v"&αζ1)
EndIf
©
If αζ11="j" and αζ4≠"0" Then
If αζ2≠"0" and expr("getType(Γζ"&αζ2&")")="NONE" Then
expr("0→βζ"&αζ2)
αeql&"Γζ"&αζ2&" and "→αeql
αdl&"Γζ"&αζ2&","→αdl
αdl&"βζ"&αζ2&","→αdl
EndIf
expr("(βζ"&αζ2&")+("&αζ4&")→βζ"&αζ2)
expr("βζ"&αζ2&"=0→Γζ"&αζ2)
If αζ3≠"0" and expr("getType(Γζ"&αζ3&")")="NONE" Then
expr("0→βζ"&αζ3)
αeql&"Γζ"&αζ3&" and "→αeql
αdl&"Γζ"&αζ3&","→αdl
αdl&"βζ"&αζ3&","→αdl
EndIf
expr("(βζ"&αζ3&")-("&αζ4&")→βζ"&αζ3)
expr("βζ"&αζ3&"=0→Γζ"&αζ3)
EndIf
©
If βtool="dc" Then
If αζ11="c" and αζ4≠"0" Then
expr("0→i"&αζ1)
EndIf
If instring("r,l,c,e",αζ11)≠0 and αζ4="0" or αζ11="l" and βtool="dc" or αζ11="s" Then
expr("(v"&αζ2&"-"&"v"&αζ3&")=0→eq"&αζ1)
αeql&"eq"&αζ1&" and "→αeql
αdl&"eq"&αζ1&","→αdl
If αζ2≠"0" and expr("getType(Γζ"&αζ2&")")="NONE" Then
expr("0→βζ"&αζ2)
αeql&"Γζ"&αζ2&" and "→αeql
αdl&"Γζ"&αζ2&","→αdl
αdl&"βζ"&αζ2&","→αdl
EndIf
expr("βζ"&αζ2&"+i"&αζ1&"→βζ"&αζ2)
expr("βζ"&αζ2&"=0→Γζ"&αζ2)
If αζ3≠"0" and expr("getType(Γζ"&αζ3&")")="NONE" Then
expr("0→βζ"&αζ3)
αeql&"Γζ"&αζ3&" and "→αeql
αdl&"Γζ"&αζ3&","→αdl
αdl&"βζ"&αζ3&","→αdl
EndIf
expr("βζ"&αζ3&"-i"&αζ1&"→βζ"&αζ3)
expr("βζ"&αζ3&"=0→Γζ"&αζ3)
If αζ2≠"0" and instring(αuk1,"v"&αζ2)=0 Then
αuk1&"v"&αζ2&","→αuk1
EndIf
If αζ3≠"0" and instring(αuk1,"v"&αζ3)=0 Then
αuk1&"v"&αζ3&","→αuk1
EndIf
αuk1&"i"&αζ1&","→αuk1
EndIf
Else
If instring("r,l,c,e",αζ11)≠0 and αζ4="0" or αζ11="s" Then
expr("(v"&αζ2&"-"&"v"&αζ3&")=0→eq"&αζ1)
αeql&"eq"&αζ1&" and "→αeql
αdl&"eq"&αζ1&","→αdl
If αζ2≠"0" and expr("getType(Γζ"&αζ2&")")="NONE" Then
expr("0→βζ"&αζ2)
αeql&"Γζ"&αζ2&" and "→αeql
αdl&"Γζ"&αζ2&","→αdl
αdl&"βζ"&αζ2&","→αdl
EndIf
expr("βζ"&αζ2&"+i"&αζ1&"→βζ"&αζ2)
expr("βζ"&αζ2&"=0→Γζ"&αζ2)
If αζ3≠"0" and expr("getType(Γζ"&αζ3&")")="NONE" Then
expr("0→βζ"&αζ3)
αeql&"Γζ"&αζ3&" and "→αeql
αdl&"Γζ"&αζ3&","→αdl
αdl&"βζ"&αζ3&","→αdl
EndIf
expr("βζ"&αζ3&"-i"&αζ1&"→βζ"&αζ3)
expr("βζ"&αζ3&"=0→Γζ"&αζ3)
If αζ2≠"0" and instring(αuk1,"v"&αζ2)=0 Then
αuk1&"v"&αζ2&","→αuk1
EndIf
If αζ3≠"0" and instring(αuk1,"v"&αζ3)=0 Then
αuk1&"v"&αζ3&","→αuk1
EndIf
αuk1&"i"&αζ1&","→αuk1
EndIf
If left(αζ1,1)="t" Then
expr("–i"&αζ1&αζ2&"*("&αζ4&")/("&αζ5&")→i"&αζ1&αζ3)
expr("v"&αζ2&"/("&αζ4&")="&"v"&αζ3&"/("&αζ5&")→eq"&αζ1)
αeql&"eq"&αζ1&" and "→αeql
αdl&"eq"&αζ1&","→αdl
If expr("getType(Γζ"&αζ2&")")="NONE" Then
expr("0→βζ"&αζ2)
αeql&"Γζ"&αζ2&" and "→αeql
αdl&"Γζ"&αζ2&","→αdl
αdl&"βζ"&αζ2&","→αdl
EndIf
expr("βζ"&αζ2&"+i"&αζ1&αζ2&"→βζ"&αζ2)
expr("βζ"&αζ2&"=0→Γζ"&αζ2)
If expr("getType(Γζ"&αζ3&")")="NONE" Then
expr("0→βζ"&αζ3)
αeql&"Γζ"&αζ3&" and "→αeql
αdl&"Γζ"&αζ3&","→αdl
αdl&"βζ"&αζ3&","→αdl
EndIf
expr("βζ"&αζ3&"+i"&αζ1&αζ3&"→βζ"&αζ3)
expr("βζ"&αζ3&"=0→Γζ"&αζ3)
If instring(αuk1,"v"&αζ2)=0 Then
αuk1&"v"&αζ2&","→αuk1
EndIf
If instring(αuk1,"v"&αζ3)=0 Then
αuk1&"v"&αζ3&","→αuk1
EndIf
αuk1&"i"&αζ1&αζ2&","→αuk1
EndIf
©
If αζ11="l" and αζ4≠"0" Then
false→ζζflag
If µutual Then
DelVar ζζ,γζ
"0"→ζζ
For γζ,1,αnec
string(ê[γζ,1])→γζ1
string(ê[γζ,2])→γζ2
string(ê[γζ,3])→γζ3
string(ê[γζ,4])→γζ4
If left(γζ1,1)="m" and γζ2=αζ1 and γζ4≠"0" Then
true→ζζflag
If βtool="fd" or βtool="tr" Then
DelVar γψ
For γψ,1,αnec
string(ê[γψ,1])→γψ1
string(ê[γψ,5])→γψ5
If γψ1=γζ3 Then
If γψ5≠"0" Then
"("&γζ4&")*(i"&γζ3&"-("&γψ5&")/s)+"&ζζ→ζζ
Else
"("&γζ4&")*i"&γζ3&"+"&ζζ→ζζ
EndIf
EndIf
EndFor
ElseIf βtool="ac" Then
"("&γζ4&")*i"&γζ3&"+"&ζζ→ζζ
EndIf
EndIf
If left(γζ1,1)="m" and γζ3=αζ1 and γζ4≠"0" Then
true→ζζflag
If βtool="fd" or βtool="tr" Then
DelVar γψ
For γψ,1,αnec
string(ê[γψ,1])→γψ1
string(ê[γψ,5])→γψ5
If γψ1=γζ2 Then
If γψ5≠"0" Then
"("&γζ4&")*(i"&γζ2&"-("&γψ5&")/s)+"&ζζ→ζζ
Else
"("&γζ4&")*i"&γζ2&"+"&ζζ→ζζ
EndIf
EndIf
EndFor
ElseIf βtool="ac" Then
"("&γζ4&")*i"&γζ2&"+"&ζζ→ζζ
EndIf
EndIf
EndFor
EndIf
If ζζflag Then
If βtool="fd" or βtool="tr" Then
expr("solve((v"&αζ2&"-v"&αζ3&")/s=("&αζ4&")*(i"&αζ1&"-("&αζ5&")/s)+("&ζζ&"),i"&αζ1&")→eq"&αζ1)
ElseIf βtool="ac" Then
expr("cSolve((v"&αζ2&"-v"&αζ3&")/(ω*)=("&αζ4&")*(i"&αζ1&")+("&ζζ&"),i"&αζ1&")→eq"&αζ1)
EndIf
αeql&"eq"&αζ1&" and "→αeql
αdl&"eq"&αζ1&","→αdl
αuk1&"i"&αζ1&","→αuk1
Else
If βtool="fd" or βtool="tr" Then
expr("(v"&αζ2&"-v"&αζ3&")/(s*("&αζ4&"))+("&αζ5&")/s→i"&αζ1)
Else
expr("(v"&αζ2&"-v"&αζ3&")/((ω*)*("&αζ4&"))→i"&αζ1)
EndIf
αuk2&"i"&αζ1&","→αuk2
EndIf
If αζ2≠"0" and expr("getType(Γζ"&αζ2&")")="NONE" Then
expr("0→βζ"&αζ2)
αeql&"Γζ"&αζ2&" and "→αeql
αdl&"Γζ"&αζ2&","→αdl
αdl&"βζ"&αζ2&","→αdl
EndIf
expr("βζ"&αζ2&"+i"&αζ1&"→βζ"&αζ2)
expr("βζ"&αζ2&"=0→Γζ"&αζ2)
If αζ3≠"0" and expr("getType(Γζ"&αζ3&")")="NONE" Then
expr("0→βζ"&αζ3)
αeql&"Γζ"&αζ3&" and "→αeql
αdl&"Γζ"&αζ3&","→αdl
αdl&"βζ"&αζ3&","→αdl
EndIf
expr("βζ"&αζ3&"-i"&αζ1&"→βζ"&αζ3)
expr("βζ"&αζ3&"=0→Γζ"&αζ3)
If αζ2≠"0" and instring(αuk1,"v"&αζ2)=0 Then
αuk1&"v"&αζ2&","→αuk1
EndIf
If αζ3≠"0" and instring(αuk1,"v"&αζ3)=0 Then
αuk1&"v"&αζ3&","→αuk1
EndIf
EndIf
©
If left(αζ1,1)="c" and αζ4≠"0" Then
If βtool="fd" or βtool="tr" Then
expr("(v"&αζ2&"-v"&αζ3&")*(s*("&αζ4&"))-(("&αζ4&")*("&αζ5&"))→i"&αζ1)
Else
expr("(v"&αζ2&"-v"&αζ3&")*((ω*)*("&αζ4&"))→i"&αζ1)
EndIf
αuk2&"i"&αζ1&","→αuk2
If αζ2≠"0" and expr("getType(Γζ"&αζ2&")")="NONE" Then
expr("0→βζ"&αζ2)
αeql&"Γζ"&αζ2&" and "→αeql
αdl&"Γζ"&αζ2&","→αdl
αdl&"βζ"&αζ2&","→αdl
EndIf
expr("βζ"&αζ2&"+i"&αζ1&"→βζ"&αζ2)
expr("βζ"&αζ2&"=0→Γζ"&αζ2)
If αζ3≠"0" and expr("getType(Γζ"&αζ3&")")="NONE" Then
expr("0→βζ"&αζ3)
αeql&"Γζ"&αζ3&" and "→αeql
αdl&"Γζ"&αζ3&","→αdl
αdl&"βζ"&αζ3&","→αdl
EndIf
expr("βζ"&αζ3&"-i"&αζ1&"→βζ"&αζ3)
expr("βζ"&αζ3&"=0→Γζ"&αζ3)
If αζ2≠"0" and instring(αuk1,"v"&αζ2)=0 Then
αuk1&"v"&αζ2&","→αuk1
EndIf
If αζ3≠"0" and instring(αuk1,"v"&αζ3)=0 Then
αuk1&"v"&αζ3&","→αuk1
EndIf
EndIf
EndIf
©
If αζ11="o" Then
expr("(v"&αζ2&")=(v"&αζ3&")→eq"&αζ1)
αeql&"eq"&αζ1&" and "→αeql
αdl&"eq"&αζ1&","→αdl
If expr("getType(Γζ"&αζ4&")")="NONE" Then
expr("0→βζ"&αζ4)
αeql&"Γζ"&αζ4&" and "→αeql
αdl&"Γζ"&αζ4&","→αdl
αdl&"βζ"&αζ4&","→αdl
EndIf
expr("βζ"&αζ4&"-i"&αζ1&"→βζ"&αζ4)
expr("βζ"&αζ4&"=0→Γζ"&αζ4)
If αζ2≠"0" and instring(αuk1,"v"&αζ2)=0 Then
αuk1&"v"&αζ2&","→αuk1
EndIf
If αζ3≠"0" and instring(αuk1,"v"&αζ3)=0 Then
αuk1&"v"&αζ3&","→αuk1
EndIf
If αζ4≠"0" and instring(αuk1,"v"&αζ4)=0 Then
αuk1&"v"&αζ4&","→αuk1
EndIf
αuk1&"i"&αζ1&","→αuk1
EndIf
DelVar αζ11,ζζflag
EndPrgm
