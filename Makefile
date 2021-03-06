.SUFFIXES:	# Delete the default suffixes
.SUFFIXES:	.c .h
.PHONY:		all clean astyle 

TARGET		= Sources/main
CC_FILES	= $(wildcard *.c)
HH_FILES	= $(wildcard *.h)
O_FILES = 	$(CC_FILES:%.c=%.o)

default: all

all: $(TARGET)

$(TARGET):
	@(cd Server && $(MAKE))
	@(cd Client && $(MAKE))

clean:
	@(cd Server && $(MAKE) $@)
	@(cd Client && $(MAKE))
