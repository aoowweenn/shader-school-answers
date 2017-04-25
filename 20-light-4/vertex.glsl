precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 lightPosition;

varying vec3 vNormal;
varying vec3 eyeDirection;
varying vec3 lightDirection;

void main() {
  vec4 viewPosition = view * model * vec4(position, 1.0);
  gl_Position = projection * viewPosition;

  vNormal = normalize(normal * mat3(inverseModel));
  eyeDirection = normalize(viewPosition.xyz);
  lightDirection = normalize(lightPosition - vec3(model * vec4(position, 1.0)));
}
