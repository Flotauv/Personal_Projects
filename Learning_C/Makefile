all: fichier
	@echo "Makefile detected"

fichier : test.o  results.o
	gcc -o fichier test.o results.o

test.o : test.c
	gcc -c -Wall test.c 
	
results.o : results.c
	gcc -c -Wall results.c

clean:
	rm -rf *.o fichier



