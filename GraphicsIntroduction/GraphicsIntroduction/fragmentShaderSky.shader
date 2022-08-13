/*#version 330 core
out vec4 FragColor;

in vec3 TexCoords;

uniform samplerCube skybox;

void main()
{
	vec3 dir = vec3(1, 0, 0);
	FragColor = texture(skybox, dir);
	
}*/


#version 330 core

out vec4 FragColor;

in vec4 worldPixel;

uniform vec3 cameraPosition;

uniform vec3 lightDirection;

vec3 lerp(vec3 a, vec3 b, float t) {
	return a + (b - a) * t;
}

void main() {
	vec3 lightDir = normalize(lightDirection);
	vec3 viewDirection = normalize(worldPixel.xyz - cameraPosition);

	vec3 top = vec3(68 / 255.0, 118 / 255.0, 189 / 255.0);
	vec3 bot = vec3(188 / 255.0, 214 / 255.0, 231 / 255.0);

	float sun = pow(max(dot(-viewDirection, lightDir), 0.0), 240);

	FragColor = vec4(lerp(bot, top, viewDirection.y) + sun * vec3(0.85, 0.55, 0.15), 1.0);
}