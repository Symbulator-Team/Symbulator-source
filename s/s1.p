()
Prgm
If ok=7 Then
Return 
EndIf
1→τξflo

While instring(ç,":",τξflo)≠0
dim(ç)→τξlen
instring(ç,":",τξflo)+1→τξelo
instring(ç,",",τξelo)-1→τξslo
τξslo-τξelo+1→τξelg
right(left(ç,τξslo),τξelg)→τξeds
τξslo+1→τξflo

DelVar #τξeds

If instring("r,e,j,o,c,l,m,s,z,y,h,g,a,b,t",left(τξeds,1))=0 Then
ClrIO
Dialog
Title "Error with element name!"
Text "The name of the "&τξeds&" element seems wrong:"
Text "Symbulator does not recognize any"
Text "name starting with "&left(τξeds,1)&" as a valid element."
Text "Please fix this element's description."
EndDlog
3→ok
EndIf

EndWhile

DelVar τξeds,τξelg,τξelo,τξflo,τξlen,τξslo

EndPrgm
