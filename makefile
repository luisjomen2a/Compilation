


compilateur: y.tab.o lex.yy.o
		gcc -o compilateur y.tab.o lex.yy.o -ll -ly
		mv compilateur bin/
		mv *.o obj/
		mv *.c src/
		mv *.h src/

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




