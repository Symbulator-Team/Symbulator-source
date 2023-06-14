()
Prgm
ClrIO
7→ok

s\version()
Disp "       Installing..."
expr("Unarchiv "&s\list)
s\s5(ê,ω)
s\aa(1+*2)
s\ac(cir,1)
s\bode()
s\dc(cir)
s\er(cir,1,0)
s\ex(cir)
s\fd(cir)
s\gain()
s\menu()
s\only(1)
s\plot()
s\port(cir,1,2)
s\pf(1)
s\pr({1,2})
s\s2t(1/s)
s\sa()
s\s3(ê,ω,µn1,µn2)
s\sp(ê)
s\s6(ê,ω)
s\s8(ê,αζ1,αζ2,αζ3,αζ4,αζ5,ω)
s\s7(αζ1,αζ2,αζ3,αζ4,αζ5,ω)
s\s4(ê)
s\s0(â,ω,µn1,µn2)
s\s9()
s\s2("r",4)
s\s1()
s\sa()
"xyz"→s\sit
s\si()
s\sr("y","t")
DelVar s\sit
s\t2s(t)
s\th(cir,1,0)
s\tr(cir)
expr("Archive "&s\list)
If getType(s\verbose)="NONE" Then
true→s\verbose
EndIf
If getType(s\rms)="NONE" Then
false→s\rms
EndIf
Lock s\verbose
DelVar ai,ap,av,ij1,ino,pj1,sj1,vth,zi,ir1,pr1,sr1,v0,v1,αpurpose
0.→ok
ClrIO
DispHome
Stop
Lbl non
ClrIO
Dialog
Title "Aborted"
Text "Symbulator files have not"
Text "been archived yet."
EndDlog
DispHome
EndPrgm
