CC = gcc
CFLAGS = -g
COMPILE = $(CC) $(CFLAGS)

formula: formula.o nCr.o
	$(COMPILE) -o formula formula.o nCr.o

formula.o: nCr.h
	$(COMPILE) -c formula.c

nCr.o:
	$(COMPILE) -c nCr.s

clean:
	rm *.o formula
