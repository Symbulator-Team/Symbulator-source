PROGRAMS := aa ac bode dc er ex fd gain install menu only plot port s0 \
s1 s2 s2t s3 s4 s5 s6 s7 s8 s9 sa t2s th tr ws
STRINGS := list version
XSLT := transform

all: $(addsuffix .TIProgram,$(PROGRAMS)) $(addsuffix .TIString,$(STRINGS))

clean:
	rm -f *.TIProgram *.TIString

%.TIProgram: ../s/%.*
	$(XSLT) "-a:on" "-s:build.xml" "-o:$@" "file=$<" "type=Program"

%.TIString: ../s/%.s
	$(XSLT) "-a:on" "-s:build.xml" "-o:$@" "file=$<" "type=String"
