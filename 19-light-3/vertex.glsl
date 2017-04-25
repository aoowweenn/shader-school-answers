precision mediump float;

attribute vec3 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 vNormal;
varying vec3 eyeDirection;

void main() {
  mat3 inverseModelView = mat3(inverseModel * inverseView);
  vec4 viewPosition = view * model * vec4(position, 1.0);

  vNormal = normalize(normal * inverseModelView);

  eyeDirection = normalize(viewPosition.xyz);

  gl_Position = projection * viewPosition;
}
