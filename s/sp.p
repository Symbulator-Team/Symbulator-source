(ê)
Prgm
If ok=7. Then
Return
EndIf

Local αζ,αζg,αζω,αζn1,αζn2,αζ5t,αζ11,αζ1,αζ2,αζ3,αζ4,αζ11,αζdp

For αζ,1,part(dim(ê),1)
string(ê[αζ,1])→αζ1
string(ê[αζ,2])→αζ2
string(ê[αζ,3])→αζ3
string(ê[αζ,4])→αζ4
left(αζ1,1)→αζ11

If inString("z,y,h,g,a,b",αζ11)=0 Then
Return
EndIf
If getType(#(αζ1&"11"))="NONE" or getType(#(αζ1&"12"))="NONE" or getType(#(αζ1&"21"))="NONE" or getType(#(αζ1&"22"))="NONE" Then
ClrIO
Dialog
Title "Parameters for "&αζ1
Text "Some parameters for two-port "&αζ1
Text "are not defined yet. Do you want to"
Text "define them or to run symbolically?"
DropDown "",{"Define them now","Run symbolically"},αζdp
EndDlog
If ok=0. Then
Return
EndIf
If αζdp=1 Then
Dialog
Title "Define parameters"
Request αζ1&"11",#(αζ1&"11"),0
Request αζ1&"12",#(αζ1&"12"),0
Request αζ1&"21",#(αζ1&"21"),0
Request αζ1&"22",#(αζ1&"22"),0
EndDlog
If ok=0. Then
Return
EndIf

#(αζ1&"11")→s\sit:s\si():expr(s\sit)→#(αζ1&"11")
#(αζ1&"12")→s\sit:s\si():expr(s\sit)→#(αζ1&"12")
#(αζ1&"21")→s\sit:s\si():expr(s\sit)→#(αζ1&"21")
#(αζ1&"22")→s\sit:s\si():expr(s\sit)→#(αζ1&"22")
EndIf
EndIf
EndFor
EndPrgm
