
TARGETS=executable/main.exe

OBJECTS=src/ParticleBuffer.o \
src/ParticleSystem.o \
src/ParticleTexture.o \
src/ShaderManager.o \
src/gl3w.o \
src/tga.o

CC=g++
#GDB=-g

CPPFLAGS= -std=c++14 -Iinclude/ -Wall -s -O3
CFLAGS = -Iinclude/ -Wall -s
LFLAGS=-lglfw3 -lGL -lm -ldl

all: src/main.cpp $(OBJECTS)
	$(CC) $(GDB) $(CPPFLAGS) -o $(TARGETS) $< $(OBJECTS) $(LFLAGS)
	
%.o: %.cpp
	$(CC) $(GDB) $(CPPFLAGS) -c $< -o $@
	
%.o: %.c
	$(CC) $(GDB) $(CFLAGS) -c $< -o $@
	
clean:
	rm -f $(subst /,\,$(OBJECTS))
	rm -f $(subst /,\,$(TARGETS))
