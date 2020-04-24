.PHONY: all clean install check

CFLAGS ?= -Wall -pedantic -g
OBJS = catqcow2.o qcow2.o

all: catqcow2 libread-qcow2.a

catqcow2: $(OBJS)
	$(LINK.c) $(OBJS) $(LDLIBS) -o $@

libread-qcow2.a: qcow2.o
	$(AR) rcs $@ $^

clean:	
	rm -f catqcow2 libread-qcow2.a $(OBJS)

install:

check: test.sh catqcow2
	sh test.sh
	@echo PASS
