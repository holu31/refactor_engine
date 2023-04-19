#pragma once

#include <glad/glad.h>
#define GLFW_INCLUDE_NONE
#include <GLFW/glfw3.h>

#include <core/mesh.hpp>
#include <core/shaders.hpp>

#include <iostream>
#include <map>
#include <stdint.h>

namespace Core {

    class Engine {

        GLFWwindow* m_window;
        float m_prevDeltaTime;

        public:

            Engine(std::string title, int width, int height);
            ~Engine();

            void _process(float deltaTime);
            void _start();
            void _exit_window();
            void _input(int key);
    };

};