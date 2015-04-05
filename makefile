PROG = PJT
OBJS = main.o createNode_h.o addNode_h.o substString_h.o printTree_h.o clearBinSTree_h.o mychomp_h.o mystrsubst_h.o sortBinSTree_h.o removeNode_h.o separate_h.o delSeparate_h.o addString_h.o printU_h.o createRoot_h.o error_h.o
CC = gcc
CFLAGS = -Wall -g 
#LDFLAGS  = -lm

#default
.PHONY: all
all: $(PROG)

#compile c file
createNode_h.o: createNode_h.c
	$(CC) $(CFLAGS) -c  $<
addNode_h.o: addNode_h.c
	$(CC) $(CFLAGS) -c  $<
substString_h.o: substString_h.c
	$(CC) $(CFLAGS) -c  $<
printTree_h.o: printTree_h.c
	$(CC) $(CFLAGS) -c  $<
sortBinSTree_h.o: sortBinSTree_h.c
	$(CC) $(CFLAGS) -c  $<
removeNode_h.o: removeNode_h.c
	$(CC) $(CFLAGS) -c  $<
clearBinSTree_h.o: clearBinSTree_h.c
	$(CC) $(CFLAGS) -c  $<
mychomp_h.o: mychomp_h.c
	$(CC) $(CFLAGS) -c  $<
mystrsubst_h.o: mystrsubst_h.c
	$(CC) $(CFLAGS) -c  $<
separate_h.o: separate_h.c
	$(CC) $(CFLAGS) -c  $<
delSeparate_h.o: delSeparate_h.c
	$(CC) $(CFLAGS) -c  $<
addString_h.o: addString_h.c
	$(CC) $(CFLAGS) -c  $<
printU_h.o: printU_h.c
	$(CC) $(CFLAGS) -c  $<
createRoot_h.o: createRoot_h.c
	$(CC) $(CFLAGS) -c  $<
error_h.o: error_h.c
	$(CC) $(CFLAGS) -c  $<
main.o: main.c
	$(CC) $(CFLAGS) -c  $<

#SUFFIEXES:.o .c
#.c .o:
	#$(CC) $(CFLAGS) -c $<

#linkage of objective files
$(PROG): $(OBJS)
	$(CC) -o $@  $^

#clean unneed programs
.PHONY: clean
clean:
	rm -f $(PROG) $(OBJS)
