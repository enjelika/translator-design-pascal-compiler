#------------------------------------------------------------------
# File p02make contains instructions for creating file p02,
#------------------------------------------------------------------
# Author: Gordon Klundt                                           
# E-Mail: gklundt@uco.edu
# Author: Komes Adrian Kovatana 
# E-mail: kkovatana1@uco.edu	                                        
# Date:   November 5, 2014 
#------------------------------------------------------------------
# Object files
# woohoo I'm changing something.
#------------------------------------------------------------------
obj	=	p02par.o p02lex.o p02.o

makeLexScan:
		lex p02lex.l
		mv lex.yy.c p02lex.cpp
		yacc -d -v p02par.y
		mv y.tab.c p02par.cpp
		mv y.tab.h p02tkn.h

#------------------------------------------------------------------
# Bind the Subset Pascal Scanner
#------------------------------------------------------------------
p02:		${obj}
		g++ -o p02 ${obj} -lm -ll

#------------------------------------------------------------------
# File p02.cpp processes command line arguments
#------------------------------------------------------------------
p02.o:		p02.cpp p02lex.h
		g++ -c -g p02.cpp
#------------------------------------------------------------------
# File p02lex.l is the lexical analyzer
#------------------------------------------------------------------
p02lex.cpp:	p02lex.l p02lex.h
		lex p02lex.l
		mv lex.yy.c p02lex.cpp
#------------------------------------------------------------------
# File p02lex.cpp is created by lex in the previous step
#------------------------------------------------------------------
p02lex.o:	p02lex.cpp p02lex.h
		g++ -c -g p02lex.cpp
#------------------------------------------------------------------
# File p02par.y contains the specification of the Subset Pascal
# Parser in a format acceptable to yacc
#------------------------------------------------------------------
p02tkn.h    \
p02par.cpp:	p02par.y
		yacc -d -v p02par.y
		mv y.tab.c p02par.cpp
		mv y.tab.h p02tkn.h
#------------------------------------------------------------------
# File p02par.cpp is the C++ parser created by yacc
#------------------------------------------------------------------
p02par.o:	p02par.cpp p02par.h
		g++ -c -g p02par.cpp

clean:
	rm -f y.output
	rm -f p02
	rm -f *.o
	rm -f p02lex.cpp
	rm -f p02par.cpp
	rm -f p02tkn.h
	rm -f *.trc

