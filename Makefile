TARGET:=test
SRC_LIST := $(shell ls *.c)
OBJ_LIST := $(patsubst %.c,%.o,$(SRC_LIST))
TEST_LIST := $(basename $(OBJ_LIST))

CC:=gcc
CFLAGS:= -std=c99
LDFLAGSTEST:= -llightnvm -lpthread

%.o:%.c
	$(CC) $(LDFLAGSTEST) -c $<

all:$(TEST_LIST)
	@echo "test targets:"
	@echo $(TEST_LIST)

ALLOBJ:$(OBJ_LIST)

$(TEST_LIST):ALLOBJ
	$(CC) -o $@ $(addsuffix .o, $@) $(LDFLAGSTEST) $(CFLAGS)

clean:
	rm -f *.o $(TEST_LIST)
