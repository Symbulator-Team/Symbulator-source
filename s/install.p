()
Prgm
ClrIO
7→ok
Disp ""
Disp ""
Disp ""
Disp ""
Disp "        Archiving..."
expr("Unarchiv s\uninstal,"&s\list)
s\s5(ê,ω)
s\aa(1+*2)
s\ac(cir,1)
s\bode()
s\ck
s\dc(cir)
s\er(cir,1,0)
s\ex(cir)
s\fd(cir)
s\gain()
s\menu()
s\only(1)
s\plot()
s\port(cir,1,2)
s\s2t(1/s)
s\sa()
s\s3(ê,ω,µn1,µn2)
s\s6(ê,ω)
s\s8(ê,αζ1,αζ2,αζ3,αζ4,αζ5,ω)
s\s7(αζ1,αζ2,αζ3,αζ4,αζ5,ω)
s\s4(ê)
s\s0(â,ω,µn1,µn2)
s\s9()
s\s2("r",4)
s\s1()
s\t2s(t)
s\th(cir,1,0)
s\tr(cir)
s\uninstal()
s\ws()
expr("Archive s\uninstal,"&s\list)
DelVar ai,ap,av,ij1,ino,pj1,sj1,vth,zi,ir1,pr1,sr1,v0,v1,αpurpose
0.→ok
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
