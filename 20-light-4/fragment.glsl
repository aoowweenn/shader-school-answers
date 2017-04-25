precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 specular;

uniform vec3 lightPosition;

uniform float shininess;

varying vec3 vNormal;
varying vec3 eyeDirection;
varying vec3 lightDirection;

float phong_weight(vec3 lightDirection, vec3 viewNormal, vec3 eyeDirection, float shininess)
{
  vec3 rLightDirection = reflect(lightDirection, viewNormal);
  float eyeReceive = max(dot(rLightDirection, eyeDirection), 0.0);
  return pow(eyeReceive, shininess);
}

void main() {
  float lambert = max(dot(vNormal, lightDirection), 0.0);
  float phong = phong_weight(lightDirection, vNormal, eyeDirection, shininess);
  gl_FragColor = vec4(ambient + lambert * diffuse + phong * specular,1);
}
