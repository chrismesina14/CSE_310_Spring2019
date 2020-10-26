CC = iverilog

PROG = add-sub-tb
PROG0 = 4bit-alu-tb
PROG1 = add-sub
PROG2 = 4bit-alu
UTIL = adder.v

$(PROG):
	$(CC) -o $(PROG) $(PROG).v $(PROG1).v $(UTIL)

$(PROG0):
	$(CC) -o $(PROG0) $(PROG0).v $(PROG2).v $(UTIL)

$(PROG1):
	$(CC) $(PROG1).v $(UTIL)

$(PROG2):
	$(CC) $(PROG2).v $(UTIL)

clean:
