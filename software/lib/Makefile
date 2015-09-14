IDIR =.
CC=gcc
CFLAGS= -I$(IDIR) 

ODIR=../output
LDIR =.

LIBS=-lm -lmpsse

_DEPS = scope_control.h spicomm.h audio_codec.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = scope_control.o spicomm.o main.o audio_codec.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

superScopeMain: $(OBJ)
	gcc -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 