CC=gcc
OPTFLAGS=-ggdb3 -Og
CFLAGS=-std=c99 -pedantic -Wall -Wextra $(OPTFLAGS)
LD=gcc
LDFLAGS=
LIBS=-lm -lncurses

SRCS=main.c \
    ennemy.c \
    interface.c \
    item.c \
    map.c \
    menu.c \
    player.c \
    pnj.c \
    screen.c
OBJS=$(patsubst %.c,%.o,$(SRCS))
EXEC=LostCavern

.PHONY: all
all: $(EXEC)

$(EXEC): $(OBJS) Makefile
	$(LD) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

%.o: %.c Makefile
	$(CC) $(CFLAGS) -o $@ -c $<

.PHONY: clean
clean:
	rm -f $(OBJS)

.PHONY: mrproper
mrproper: clean
	rm -f $(EXEC)
