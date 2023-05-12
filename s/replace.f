(given,old,new)
Func
Local revised,still,len
given→revised
dim(old)→len
inString(revised,old)→still

While still≠0

left(revised,still-1)&new&mid(revised,still+len)→revised

inString(revised,old)→still
EndWhile

Return revised
EndFunc
