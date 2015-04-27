TARGET = bin/mlv-sync
LDFLAGS = 
CC = gcc
CFLAGS = -Wall -g

.PHONY: clean all default

default: $(TARGET)
all: default

OBJECTS = $(patsubst src/%.c, src/%.o, $(wildcard src/*.c))
HEADERS = $(wildcard src/*.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall $(LDFLAGS) -o $@

clean:
	-rm -f src/*.o
	-rm -f $(TARGET)
