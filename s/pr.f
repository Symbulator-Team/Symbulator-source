(αz)
Func
Local i,αz0,αzt,αzi,αzs,αze
false→αz0
0→αzs
dim(αz)→αzt
If αzt=1 Then
Return αz[1]
Else
For i,1,αzt
αz[i]→αzi
If string(αzi)="0" or string(αzi)="0." Then
true→αz0
Else
1/αzi+αzs→αzs
EndIf
EndFor
If αz0 Then
Return 0
Else
1/αzs→αze
Return αze
EndIf
EndIf
EndFunc
