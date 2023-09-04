all: sbm2bmp pics

sbm2bmp: main.c
	gcc -o sbm2bmp main.c

pics:
	./sbm2bmp donna.sbm donna.bmp
	./sbm2bmp chair.sbm chair.bmp
	./sbm2bmp ingrid2.sbm ingrid2.bmp
	./sbm2bmp marianne.sbm marianne.bmp
	./sbm2bmp something.sbm something.bmp
	./sbm2bmp woman2.sbm woman2.bmp
	
clean:
	rm -f *~
	rm -f ./sbm2bmp
	rm -f *.bmp
