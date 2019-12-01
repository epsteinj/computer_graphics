#version 430 //GLSL version your computer supports

in vec2 UV;
in vec3 normalWorld;
in vec3 vertexPositionWorld;

uniform sampler2D myTextureSampler0;
uniform vec3 ambientLight;
uniform vec3 lightPositionWorld;
uniform vec3 eyePositionWorld;

out vec3 outColor;

void main()
{
	vec3 lightVectorWorld = normalize(lightPositionWorld - vertexPositionWorld);
	float brightness = dot(lightVectorWorld, normalize(normalWorld));
	vec3 diffuseLight = vec3(brightness, brightness, brightness);
	vec3 reflectedLightVectorWorld = reflect(-lightVectorWorld, normalWorld);
	vec3 eyeVectorWorld = normalize(eyePositionWorld-vertexPositionWorld);
	float s = clamp(dot(reflectedLightVectorWorld, eyeVectorWorld), 0, 1);
	s = pow(s, 50);
	vec3 specularLight = vec3(s, 0, 0);

	vec3 MaterialAmbientColor = texture(myTextureSampler0, UV).rgb;
	vec3 MaterialDiffuseColor = texture(myTextureSampler0, UV).rgb;
	vec3 MaterialSpecularColor = vec3(0.3, 0.3, 0.3);
	outColor = MaterialAmbientColor*ambientLight + MaterialDiffuseColor*clamp(diffuseLight,0,1) + MaterialSpecularColor*specularLight;
	//outColor = texture(myTextureSampler0, UV).rgb;
}
