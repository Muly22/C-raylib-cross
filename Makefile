BUILD_NAME=test

OS=LINUX

CC=
LIB=

PATH_SRC=./src/
PATH_OBJ=./obj/
PATH_LIB=./lib/
PATH_BIN=./bin/

SRC=main.c
OBJ=main.o

ifeq ($(OS),LINUX)
	FLAGS+=-lraylib
	CC:=x86_64-linux-gnu-gcc
endif

ifeq ($(OS),WIN)
	LIB+=libraylib.dll
	CC:=x86_64-w64-mingw32-gcc
	BUILD_NAME:= $(addsuffix .exe,$(BUILD_NAME))
endif

FLAGS+=-Wall
CFLAGS+=

SRC:= $(addprefix $(PATH_SRC),$(SRC) )
OBJ:= $(addprefix $(PATH_OBJ),$(OBJ) )
LIB:= $(addprefix $(PATH_LIB),$(LIB) )
LLIB:= $(addprefix $(PATH_LIB),$(LLIB) )
BUILD_NAME:= $(addprefix $(PATH_BIN),$(BUILD_NAME) )


$(BUILD_NAME) : $(OBJ)
	$(CC) -o $(BUILD_NAME) $(OBJ) $(LIB) $(FLAGS)

$(PATH_OBJ)%.o : $(PATH_SRC)%.c
	$(CC) -c $< -o $@ $(CFLAGS)

clean :
	rm $(BUILD_NAME) $(PATH_OBJ)*.o

