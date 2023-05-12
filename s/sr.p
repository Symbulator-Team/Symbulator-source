(old,new)
Prgm

Local revised,still,len
ç→revised
dim(old)→len
instring(revised,old)→still

While still≠0
left(revised,still-1)&new&mid(revised,still+len)→revised
instring(revised,old)→still
EndWhile

revised→ç
EndPrgm
