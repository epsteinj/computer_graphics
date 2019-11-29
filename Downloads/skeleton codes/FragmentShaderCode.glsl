#version 430 //GLSL version your computer supports

in vec2 UV;

uniform sampler2D myTextureSampler0;

out vec3 outColor;

void main()
{
	outColor = texture(myTextureSampler0, UV).rgb;
}
