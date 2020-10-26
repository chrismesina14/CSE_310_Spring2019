PROG	= hello

CC	= iverilog

$(PROG): $(PROG).v hello.v
	$(CC) -o $(PROG) $(PROG).v hello.v

clean:
	rm $(PROG)
