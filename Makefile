
CFLAGS ?= -Wall -pedantic -g -D_GNU_SOURCE
OBJS = catqcow2.o qcow2.o

catqcow2: $(OBJS)
	$(LINK.c) $(OBJS) $(LDLIBS) -o $@

clean:	
	rm -f catqcow2 $(OBJS)

check: test.sh catqcow2
	sh test.sh
	@echo PASS
