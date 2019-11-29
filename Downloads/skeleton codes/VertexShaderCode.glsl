#version 430  // GLSL version your computer supports

layout (location = 0) in vec3 pos;
layout (location = 1) in vec2 vertexUV;

out vec2 UV;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
	UV = vertexUV;
	gl_Position = projection * view * model * vec4(pos, 1.0);
}
