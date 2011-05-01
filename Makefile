include Makefile.common

ZTG_SRC = texture_loader.c level_loader.c player.c main.c

ZTG = ${ZTG_SRC:%.c=bin/%.o}

all: bin bin/ztg

bin:
	mkdir -p bin

bin/ztg: ${ZTG}
	${CC} ${CFLAGS} -obin/ztg ${ZTG} -lGLEW -lIL -lSDL -lcombine

bin/%.o: src/%.c
	${CC} ${CFLAGS} -o${<:src/%.c=bin/%.o} -c $<

clean:
	rm -rf bin
