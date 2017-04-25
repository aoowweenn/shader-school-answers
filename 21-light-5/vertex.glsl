precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

attribute vec3 position;
attribute vec3 normal;

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

void main() {
  vec4 modelPosition = model * vec4(position, 1.0);
  vec4 viewPosition = view * modelPosition;
  gl_Position = projection * viewPosition;

  vNormal = normalize(vec3(vec4(normal, 0.0) * inverseModel * inverseView));
  eyeDirection = normalize(viewPosition.xyz);
  mPosition = modelPosition.xyz;
}
