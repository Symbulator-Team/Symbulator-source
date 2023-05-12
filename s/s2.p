(τξeli,τξnte)
Prgm
If ok=7 Then
Return 
EndIf
":"&τξeli→τξele
0→τξx
5-τξnte→τξnfz
τξnfz*2→τξlef

If τξnfz=0 Then
""→τξfil
ElseIf τξnfz=1 Then
",0"→τξfil
ElseIf τξnfz=2 Then
",0,0"→τξfil
EndIf

1→τξflo
While instring(ç,τξele,τξflo)≠0
If ok=3 Then
Goto aus
EndIf
dim(ç)→τξlen
instring(ç,τξele,τξflo)+1→τξelo
If instring(ç,":",τξelo)≠0 Then

instring(ç,":",τξelo)-1→τξslo
τξslo-τξelo+1→τξelg
right(left(ç,τξslo),τξelg)→τξeds
left(ç,τξslo)&τξfil&right(ç,τξlen-τξslo)→ç
τξslo+τξlef+1→τξflo

Else

τξlen-τξelo+1→τξelg
right(ç,τξelg)→τξeds
ç&τξfil→ç
1→τξx

EndIf
expr("["&τξeds&"]")→τξedm
dim(τξedm)→τξedd
τξedd[2]→τξend
If τξend≠τξnte Then
τξedm[1,1]→τξedn
ClrIO
Dialog
Title "Error in element description"
Text "Element "&string(τξedn)&" is not properly described:"
Text "it has "&string(τξend)&" terms, whereas in "&βtool&" analysis"
Text "exactly "&string(τξnte)&" terms are expected for a "&left(string(τξedn),1)&"."
Text "Please fix this element's description."
EndDlog
3→ok
Goto aus
EndIf

If τξx=1 Then
Goto aus
EndIf

EndWhile

Lbl aus
DelVar τξelo,τξflo,τξlef,τξlen,τξslo,τξfil,τξnfz,τξele,τξend,τξedd,τξedm,τξedn,τξeds,τξelg,τξx

If ok=3 Then
Return 
EndIf

EndPrgm
