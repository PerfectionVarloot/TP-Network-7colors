.SUFFIXES:	# Delete the default suffixes
.SUFFIXES:	.c .h
.PHONY:		all clean astyle 

TARGET		= client
CC_FILES	= $(wildcard *.c)
HH_FILES	= $(wildcard *.h)
O_FILES = 	$(CC_FILES:%.c=%.o)

default: all

all: $(TARGET)

client.h: ; touch client.h

$(O_FILES): %.o: %.c %.h Makefile
	gcc -Wall -Wextra $*.c -c

$(TARGET): %: $(O_FILES) Makefile
	gcc -Wall -Wextra $(O_FILES) -o $*
ASTYLE_OPTIONS = 	--style=attach --indent=spaces=2

astyle:
	astyle $(ASTYLE_OPTIONS) $(CC_FILES) $(HH_FILES)

clean:
	-rm -f $(O_FILES) $(TARGET) *.orig
	-rm -rf *.dSYM
