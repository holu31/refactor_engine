#include <iostream>
#include <core/engine.hpp>
#include <core/camera.hpp>

Core::Shaders *shader;
Core::Mesh *mesh;
Core::Camera *camera;

void Core::Engine::_start(){
    shader = new Core::Shaders("core/shaders/mesh.vert",
                                "core/shaders/mesh.frag");
    camera = new Core::Camera();
    mesh = new Core::Mesh(MESH_CUBE, shader);
}

void Core::Engine::_process(float deltaTime){
    mesh->draw();
}

void Core::Engine::_input(int key){
    std::cout << key << std::endl;
}

void Core::Engine::_exit_window(){
    
}

auto main() -> int {
    Core::Engine engine("test", 800, 600);
    return 0;
}