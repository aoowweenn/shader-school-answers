precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;

uniform PointLight lights[4];

varying vec3 vNormal;
varying vec3 eyeDirection;
varying vec3 mPosition;

float phong_weight(vec3 lightDirection, vec3 viewNormal, vec3 eyeDirection, float shininess)
{
  vec3 rLightDirection = reflect(lightDirection, viewNormal);
  float eyeReceive = max(dot(rLightDirection, eyeDirection), 0.0);
  return pow(eyeReceive, shininess);
}

vec3 calLightColor()
{
  vec3 lights_sum = ambient;
  for(int i = 0; i < 4; ++i)
  {
    vec3 lightDirection = normalize(vec3(view * vec4(lights[i].position - mPosition, 0.0)));
    float lambert = max(dot(vNormal, lightDirection), 0.0);
    float phong = phong_weight(lightDirection, vNormal, eyeDirection, lights[i].shininess);
    lights_sum += lambert * lights[i].diffuse + phong * lights[i].specular;
  }
  return lights_sum;
}

void main() {
  gl_FragColor = vec4(calLightColor(), 1);
}
