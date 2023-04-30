()
Prgm
If ok=7 Then
Return 
EndIf
©=
instring(αζanst," or ")→αorp
If αorp≠0 Then
left(αζanst,αorp-1)→αtbest
mid(αζanst,αorp+4)→αtrest
While instring(αtrest," or ")≠0
instring(αtrest," or ")→αorp
left(αtrest,αorp-1)→αtnext
mid(αtrest,αorp+4)→αtrest
If dim(αtnext)>dim(αtbest) Then
αtnext→αtbest
EndIf
EndWhile
αtrest→αtnext
If dim(αtnext)>dim(αtbest) Then
αtnext→αtbest
EndIf
αtbest→αζanst
EndIf
DelVar αtbest,αtrest,αζact,αtnext,αorp
EndPrgm
