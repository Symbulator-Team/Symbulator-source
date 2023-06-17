(ê,ω)
Prgm
If ok=7. Then
Return 
EndIf
©=
If getType(αmetagat)="NONE" Then
false→αmetagat
EndIf
0→v0
0→Γζ0
0→βζ0
""→ζcon
1→ζge3
"{"→αuk1
"{"→αuk2
" "→αeql
" "→αdl
2→ζkip
©=
If s\verbose and not αmetagat Then
Disp "Generating 1st level"
Disp "equations and 2nd level"
Disp "expressions."
EndIf
©=
If iµpaλa Then
iµpaexe&"}"→iµpaexe
If s\verbose and not αmetagat Then
Disp "  (Impala) ▶ Running"
EndIf
EndIf
©=
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
If inString("z,y,g,h,a,b",αζ11)≠0 Then
s\s7(αζ1,αζ2,αζ3,αζ4,αζ5,ω)
Else
s\s8(ê,αζ1,αζ2,αζ3,αζ4,αζ5,ω)
EndIf
EndFor
dim(αuk1)-1→δζ1
©=
string(αuk1)→αuk1α
If getType(s\newunk)="STR" Then
left(αuk1,δζ1)&","&s\newunk&"}"→αuk1
Else
left(αuk1,δζ1)&"}"→αuk1
EndIf
©=
dim(αdl)-1→δζ1
left(αdl,δζ1)→αdl
dim(αuk2)-1→δζ1
left(αuk2,δζ1)&"}"→αuk2
dim(αeql)-4→δζ2
left(αeql,δζ2)→αeql
DelVar αζans
dim(αuk1)→αdunk1
expr("DelVar "&left(right(αuk1,αdunk1-1),αdunk1-2))
©=
If βtool="ac" Then
If s\verbose and not αmetagat Then
Disp "Generating 3rd level"
Disp "expressions."
EndIf
For αζ,1,αnec
string(ê[αζ,1])→αζ1
left(αζ1,1)→αζ11
string(ê[αζ,2])→αζ2
string(ê[αζ,3])→αζ3
string(ê[αζ,4])→αζ4
If inString("e,j,r,c,l",αζ11)≠0 Then
If s\rms Then
expr("((v"&αζ2&")-(v"&αζ3&"))*(conj(i"&αζ1&"))→s"&αζ1)
Else
expr("((v"&αζ2&")-(v"&αζ3&"))*(conj(i"&αζ1&"))/2→s"&αζ1)
EndIf
If inString("e,j,r",αζ11)≠0 Then
If s\rms Then
expr("real(s"&αζ1&")→p"&αζ1)
Else
expr("real(s"&αζ1&")→ap"&αζ1)
EndIf
If inString("e,j",αζ11)≠0 Then
expr("((v"&αζ2&")-(v"&αζ3&"))/(–i"&αζ1&")→z"&αζ1)
EndIf
EndIf
EndIf
If αζ11="o" Then
If s\rms Then
expr("(v"&αζ4&")*(conj(–i"&αζ1&"))→s"&αζ1)
expr("real(s"&αζ1&")→p"&αζ1)
Else
expr("(v"&αζ4&")*(conj(–i"&αζ1&"))/2→s"&αζ1)
expr("real(s"&αζ1&")→ap"&αζ1)
EndIf
EndIf
EndFor
EndIf
©=
If βtool="dc" Then
If s\verbose and not αmetagat Then
Disp "Generating 3rd level"
Disp "expressions."
EndIf
For αζ,1,αnec
string(ê[αζ,1])→αζ1
left(αζ1,1)→αζ11
string(ê[αζ,2])→αζ2
string(ê[αζ,3])→αζ3
string(ê[αζ,4])→αζ4
If inString("r,c,l,e,j",αζ11)≠0 Then
expr("((v"&αζ2&")-(v"&αζ3&"))*(i"&αζ1&")→p"&αζ1)
EndIf
If inString("e,j",αζ11)≠0 Then
expr("((v"&αζ2&")-(v"&αζ3&"))/(–i"&αζ1&")→r"&αζ1)
EndIf
If αζ11="o" Then
expr("(v"&αζ4&")*(–i"&αζ1&")→p"&αζ1)
EndIf
EndFor
EndIf
©=
If getType(αpurpose)="NONE" Then
"Other"→αpurpose
Goto ζ2
ElseIf αpurpose≠"Expert" Then
Goto ζ2
Else
dim(αeql)→αdeql
string(expr(left(αeql,αdeql-1)))→αeql

If getType(s\newequ)="STR" Then
©Prefixes
s\newequ→s\sit
s\si()
s\sit→s\newequ
DelVar s\sit
©
αeql&" and "&s\newequ→αeql
EndIf

If getType(s\newcon)="STR" Then
©Prefixes
s\newcon→s\sit
s\si()
s\sit→s\newcon
DelVar s\sit
©
s\newcon→ζcon
EndIf

dim(αeql)→αdeql
If getType(s\newequ)≠"STR" Then
Dialog
Title "Expert Mode"
Request "Add equations",αddequ
Request "Add unknowns",αddunk
Request "Add conditions",αddcon
DropDown "What to do",{"Symbulate","Symbulate+Keep","Just Keep"},ζkip
EndDlog
If ok=0. Then
Return 
EndIf
αddequ→s\sit:s\si():s\sit→αddequ
αddcon→s\sit:s\si():s\sit→αddcon
EndIf
EndIf
If getType(αddequ)="STR" Then
If αddequ≠"" Then
©Prefixes
αddequ→s\sit
s\si()
s\sit→αddequ
DelVar s\sit
©
αeql&" and "&αddequ→αeql
EndIf
EndIf

If getType(αddunk)="STR" Then
If αddunk≠"" Then
dim(αuk1)-1→δζ1
left(αuk1,δζ1)&","&αddunk&"}"→αuk1
EndIf
EndIf

If getType(αddcon)="STR" Then
If αddcon≠"" Then
©Prefixes
αddcon→s\sit
s\si()
s\sit→αddcon
DelVar s\sit
©
αddcon→ζcon
EndIf
EndIf

If ζcon≠"" Then
"|"&ζcon→ζcon
EndIf

If ζkip≠1 Then
αuk1→unknown
left(αeql,dim(αeql))→equation
ζcon→wheneq

If ζkip=3 Then
expr("DelVar "&αdl)
DelVar v0,αdunk2,αdunk1,αdl,αeql,αuk2,αuk2v,αuk1v,αuk1,αszc,γζ,βζ0,Γζ0,δζ1,δζ2,tmp1,tmp2,tmp3,ζcon,αdeql,ζkip,ζki2,ζge3,αuk1α,αpurpose
2.→ok
Return 
EndIf
EndIf
DelVar αdeql,ζkip,ζki2
Lbl ζ2
©=
If getType(s\select)="NONE" Then
If αpurpose≠"Expert" Then
false→s\select
Else
DelVar ψγ1,ψγ2
Dialog
Title "Do you need all answers?"
Text "Selecting wisely which answers to save"
Text "will expedite any simulation that has"
Text "long or complicated symbolic terms."
Text ""
DropDown "Answers to save?",{"All of them","Only selected"},ψγ1
EndDlog
If ok=0. Then
Return 
EndIf
If ψγ1=2 Then
true→s\select
Else
false→s\select
EndIf
EndIf
EndIf
If s\select and getType(s\savevars)="NONE" Then
Dialog
Title "List the answers to save"
Text "Please list the first and second level"
Text "answers (node voltages and currents in"
Text "element) that will be stored in memory."
Text ""
Request "Answers to save",s\savevars
EndDlog
If ok=0. Then
Return 
EndIf
EndIf
DelVar ψγ1
If βtool="tr" Then
If getType(s\postpone)="NONE" Then
If αpurpose≠"Expert" Then
false→s\postpone
Else
Dialog
Title "Inverse Laplace"
Text "Postponing the execution of the"
Text "inverse Laplace transform will"
Text "expedite a TR-mode simulation."
Text ""
DropDown "Do Inverse Laplace?",{"On the fly","Postpone it"},ψγ2
EndDlog
If ok=0. Then
Return 
EndIf
If ψγ2=2 Then
true→s\postpone
Else
false→s\postpone
EndIf
DelVar ψγ2
EndIf
EndIf
EndIf
©=
If s\select Then
left(s\savevars,dim(s\savevars)-1)→s\savevaro
string(expr(s\savevars))→s\savevars
s\savevaro&","&right(s\savevars,dim(s\savevars)-1)→s\savevaro
EndIf
©=
If s\verbose and not αmetagat Then
Disp "Solving the system of all"
Disp "1st level equations."
If iµpaλa Then
Disp " Ű (Impala) Ų Flying"
EndIf
EndIf
©=
If part(expr(αuk1))=1 Then
left(right(αuk1,αdunk1-1),αdunk1-2)→αuk1
If βtool="ac" Then
©"cSolve("&string(expr(αeql))&","&αuk1&")"&ζcon→solvecmd
expr("cSolve("&αeql&","&αuk1&")"&ζcon&"→αζans")
Else
©"solve("&string(expr(αeql))&","&αuk1&")"&ζcon→solvecmd
expr("solve("&αeql&","&αuk1&")"&ζcon&"→αζans")
EndIf
"{"&αuk1&"}"→αuk1
Else
If βtool="ac" Then
©"cSolve("&string(expr(αeql))&","&αuk1&")"&ζcon→solvecmd
expr("cSolve("&αeql&","&αuk1&")"&ζcon&"→αζans")
Else
©"solve("&string(expr(αeql))&","&αuk1&")"&ζcon→solvecmd
expr("solve("&αeql&","&αuk1&")"&ζcon&"→αζans")
EndIf
EndIf
©=
DelVar αζval,αζvar,αζact,σΓsi
©=
string(αζans)→αζanst
©=
s\sa()
©=
If αanscoun=0 Then
Dialog
Title "Error!"
Text "Calculator failed to solve"
Text "the equations. If you used"
Text "numeric values, try again"
Text "using symbolic values only."
EndDlog
Dialog
Title "Variables"
Text "Some vars were created in"
Text getFold()&" folder. Now they are"
Text "useless. Please erase them."
EndDlog
4.→ok
Return 
Else
expr(αanspick)→αζans
If s\verbose and not αmetagat Then
Disp "Equation system solved!"
EndIf
If αanscoun>1 Then
αansall→solution
If s\verbose and not αmetagat Then
Disp string(αanscoun)&" solutions found. Saved as"
Disp "a string for your reference."
EndIf
EndIf
EndIf
DelVar αanspick,αanstest,αansrest,αansall,αanscoun
©
If s\verbose and not αmetagat Then
Disp "Storing 1st and 2nd level"
Disp "answers."
EndIf
While inString(string(part(αζans,1)),"=")≠0 or inString(string(part(αζans,2)),"=")≠0
part(αζans,1)→αζact
part(αζans,2)→αζans
string(part(αζact,1))→αζvar
If s\select Then
inString(s\savevars,αζvar)→αζl
If αζl=0 Then
Goto αζsvar
Else
If string(expr(s\savevars))=string(expr(s\savevars&"|"&αζvar&"=0")) Then
Goto αζsvar
EndIf
EndIf
EndIf
If inString(αuk1,"{"&αζvar&"}")≠0 or inString(αuk1,"{"&αζvar&",")≠0 or inString(αuk1,","&αζvar&"}")≠0 or inString(αuk1,","&αζvar&",")≠0 Then
string(part(αζact,2))→αζval
expr(αζval&"→"&αζvar)
EndIf
Lbl αζsvar
EndWhile
string(part(αζans,1))→αζvar
If s\select Then
inString(s\savevars,αζvar)→αζl
If αζl=0 Then
Goto αζsvar2
Else
If string(expr(s\savevars))=string(expr(s\savevars&"|"&αζvar&"=0")) Then
Goto αζsvar2
EndIf
EndIf
EndIf
If inString(αuk1,"{"&αζvar&"}")≠0 or inString(αuk1,"{"&αζvar&",")≠0 or inString(αuk1,","&αζvar&"}")≠0 or inString(αuk1,","&αζvar&",")≠0 Then
string(part(αζans,2))→αζval
expr(αζval&"→"&αζvar)
Lbl αζsvar2
EndIf
DelVar αζans,αζval,αζvar,αζact
©=
If αuk2≠"}" Then
If βtool="ac" Then
expr(αuk2)|s=ω*→αuk2v
Else
expr(αuk2)→αuk2v
EndIf
dim(αuk2)→αdunk2
expr("DelVar "&left(right(αuk2,αdunk2-1),αdunk2-2))
expr(αuk2)→αuk2
dim(αuk2)→αdunk2
EndIf
©=
If iµpaλa Then
If s\verbose and not αmetagat Then
Disp "  (Impala) ų Landing"
EndIf
expr(iµpaexe)→iµpaexe
For iµpaj,1,dim(iµpaexe)-1
expr("Define "&string(iµpaexe[iµpaj+1]))
EndFor
EndIf
©=
If βtool="tr" or iµpaλa Then
expr(αuk1)→αuk1v
dim(αuk1)→αdunk1
expr("DelVar "&left(right(αuk1,αdunk1-1),αdunk1-2))
expr(αuk1)→αuk1
dim(αuk1)→αdunk1
EndIf
©=
If βtool="tr" Then
If s\postpone Then
If s\verbose Then
Disp "Postponing inverse Laplace"
Disp "transform of the answers."
EndIf
Else
startTmr()→s\til
If s\verbose Then
Disp "Finding inverse Laplace"
Disp "transform of the answers."
EndIf
EndIf
EndIf
©=

If αuk2≠"}" Then
For γζ,1,αdunk2
string(αuk2[γζ])→αukn2
If s\select Then
inString(s\savevaro,αukn2)→αζl
If αζl=0 Then
Goto αskunk2
Else
If string(expr(s\savevaro))=string(expr(s\savevaro&"|"&αukn2&"=0")) Then
Goto αskunk2
EndIf
EndIf
EndIf
If βtool="tr" Then
If s\postpone Then
If s\verbose Then
Disp "Postponing inverse Laplace"
Disp "transform of "&αukn2&"..."
EndIf

"s\s2t("&string(αuk2v[γζ])&")"→#αukn2
Else
If s\verbose Then
Disp "Finding inverse Laplace"
Disp "transform of "&αukn2&"..."
EndIf
expr(string(dif\ilaplace(αuk2v[γζ],s))&"→"&αukn2)
EndIf
Else
expr(string(αuk2v[γζ])&"→"&αukn2)
EndIf
Lbl αskunk2
EndFor
EndIf
©=
If βtool="tr" Then
For γζ,1,αdunk1
string(αuk1[γζ])→αukn1
If s\select Then
inString(s\savevaro,αukn1)→αζl
If αζl=0 Then
Goto αskunk1t
Else
If string(expr(s\savevaro))=string(expr(s\savevaro&"|"&αukn1&"=0")) Then
Goto αskunk1t
EndIf
EndIf
EndIf
If inString(αuk1α,αukn1)=0 Then
αuk1v[γζ]→#αukn1
Else
If s\postpone Then
If s\verbose Then
Disp "Postponing inverse Laplace"
Disp "transform of "&αukn1&"..."
EndIf
"s\s2t("&string(αuk1v[γζ])&")"→#αukn1
Else
If s\verbose Then
Disp "Finding inverse Laplace"
Disp "transform of "&αukn1&"..."
EndIf
expr(string(dif\ilaplace(αuk1v[γζ],s))&"→"&αukn1)
EndIf
EndIf
Lbl αskunk1t
EndFor
If s\verbose and not s\postpone Then
Disp "Inverse Laplace took "&string(checkTmr(s\til))&"s"
DelVar s\til
EndIf
EndIf

If iµpaλa and not (βtool="tr") Then
For γζ,1,αdunk1
string(αuk1[γζ])→αukn1
If s\select Then
inString(s\savevaro,αukn1)→αζl
If αζl=0 Then
Goto αskunk1f
Else
If string(expr(s\savevaro))=string(expr(s\savevaro&"|"&αukn1&"=0")) Then
Goto αskunk1f
EndIf
EndIf
EndIf
If inString(αuk1α,αukn1)=0 Then
αuk1v[γζ]→#αukn1
Else
expr(string(αuk1v[γζ])&"→"&αukn1)
EndIf
Lbl αskunk1f
EndFor
EndIf
©=
If βtool="ac" and not s\select Then
If s\verbose and not αmetagat Then
Disp "Refreshing 3rd level"
Disp "expressions."
EndIf
For αζ,1,αnec
string(ê[αζ,1])→αζ1
left(αζ1,1)→αζ11
string(ê[αζ,2])→αζ2
string(ê[αζ,3])→αζ3
string(ê[αζ,4])→αζ4
If inString("e,j,r,c,l",αζ11)≠0 Then
If s\rms Then
expr("((v"&αζ2&")-(v"&αζ3&"))*(conj(i"&αζ1&"))→s"&αζ1)
Else
expr("((v"&αζ2&")-(v"&αζ3&"))*(conj(i"&αζ1&"))/2→s"&αζ1)
EndIf
If inString("e,j,r",αζ11)≠0 Then
If s\rms Then
expr("real(s"&αζ1&")→p"&αζ1)
Else
expr("real(s"&αζ1&")→ap"&αζ1)
EndIf
If inString("e,j",αζ11)≠0 Then
expr("((v"&αζ2&")-(v"&αζ3&"))/(–i"&αζ1&")→z"&αζ1)
EndIf
EndIf
EndIf
If αζ11="o" Then
If s\rms Then
expr("(v"&αζ4&")*(conj(–i"&αζ1&"))→s"&αζ1)
expr("real(s"&αζ1&")→p"&αζ1)
Else
expr("(v"&αζ4&")*(conj(–i"&αζ1&"))/2→s"&αζ1)
expr("real(s"&αζ1&")→ap"&αζ1)
EndIf
EndIf
EndFor
EndIf

expr("DelVar "&αdl)
DelVar αdunk2,αdunk1,αdl,αeql,αuk2,αuk2v,αuk1v,αuk1,αszc,γζ,βζ0,Γζ0,δζ1,δζ2,tmp1,tmp2,tmp3,ζcon,αukn1,αukn2,ζge3,s\postpone,s\select,s\savevars,s\savevara,s\savevari,s\svvarin,s\svvaran,αpurpose,αuk1α,αζl,s\savevaro,αζanst,αuk1α,ζkip,s\newequ,s\newunk,s\newcon,αddcon,αddequ,αddunk,µutual
2.→ok
EndPrgm
