


compilateur: y.tab.o lex.yy.o symbol.o quad.o mips.o
		gcc -o compilateur y.tab.o lex.yy.o symbol.o quad.o mips.o -ll -ly
		mv compilateur bin/
		mv *.o obj/
		mv *.c src/
		mv *.h src/

mips.o : src/mips.c src/mips.h
	gcc -c src/mips.c

quad.o : src/quad.c src/quad.h
	gcc -c src/quad.c

symbol.o : src/symbol.c src/symbol.h
	gcc -c src/symbol.c

y.tab.o: y.tab.c y.tab.h
		gcc -c y.tab.c -ly
		

lex.yy.o: lex.yy.c
		gcc -c lex.yy.c -ly

y.tab.c y.tab.h: src/grammaire.y 
		yacc -d $<

lex.yy.c: src/vocabulaire.l
		lex $<
	

clean:
		rm obj/*
		rm bin/*


exec:
		./bin/compilateur $1

test1:
		./bin/compilateur ./test/test.tex

test2:
		./bin/compilateur ./test/test2.tex




