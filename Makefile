CC = gcc
RM = rm
DEBUG = gdb
VALGRIND = valgrind

CC_ARGS = -Wall -Wno-int-to-pointer-cast -Wno-pointer-to-int-cast -g
CC_LIBS = 
CC_HEAD = -I.
RM_ARGS = -v
VALGRIND_ARGS = --leak-check=full 

OBJECT = args_parser.o object_v2-hash.o object_v2-node.o object_v2-object.o object_v2-simple_chain.o object_v2-string.o object_v2-vector.o
OBJECT += test.o

TARGET = test.out

all: $(TARGET)

run: $(TARGET)
	./$(TARGET)

$(TARGET): $(OBJECT)
	$(CC) -o $@ $^ $(CC_LIBS)

$(OBJECT): %.o : %.c
	$(CC) -c -o $@ $< $(CC_HEAD) $(CC_ARGS)

debug: $(TARGET)
	$(DEBUG) $(TARGET)

memchk: $(TARGET)
	$(VALGRIND) $(VALGRIND_ARGS) ./$(TARGET)

.PHONY: clean
clean:
	$(RM) $(RM_ARGS) $(OBJECT)