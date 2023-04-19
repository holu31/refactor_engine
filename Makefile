CC=g++
OBJECTS=bin/engine.o bin/shaders.o bin/mesh.o bin/camera.o
CFLAGS = -fPIC -O2 -I include/ -std=c++20

LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

.PHONY: all
all: build.cpp

build.cpp:
	$(CC) $(CFLAGS) -c -o bin/engine.o core/engine.cpp
	$(CC) $(CFLAGS) -c -o bin/shaders.o core/shaders.cpp
	$(CC) $(CFLAGS) -c -o bin/mesh.o core/mesh.cpp
	$(CC) $(CFLAGS) -c -o bin/camera.o core/camera.cpp
	
	$(CC) $(CFLAGS) -shared -o core.so $(OBJECTS) glad/glad.c $(LDFLAGS)

build.game:

	mkdir -p build/$(build)
	mkdir -p build/$(build)/core
	mkdir -p build/$(build)/core/shaders

	$(CC) $(CFLAGS) -o build/$(build)/$(build) $(file) ./core.so

	cp core/shaders/mesh.vert build/$(build)/core/shaders/mesh.vert
	cp core/shaders/mesh.frag build/$(build)/core/shaders/mesh.frag
	cp core.so build/$(build)/