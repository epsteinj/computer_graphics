#version 430  // GLSL version your computer supports

layout (location = 0) in vec3 pos;
layout (location = 1) in vec2 vertexUV;
layout (location = 2) in vec3 normal;

out vec2 UV;
out vec3 normalWorld;
out vec3 vertexPositionWorld;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
	UV = vertexUV;
	vec4 newPosition = model * vec4(pos, 1.0);
	gl_Position = projection * view * model * vec4(pos, 1.0);

	vec4 normal_temp = model * vec4(normal, 0);
	normalWorld = normal_temp.xyz;
	vertexPositionWorld = newPosition.xyz;
}
