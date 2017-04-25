precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 diffuse;
uniform vec3 lightDirection;
uniform float numBands;

varying vec3 vNormal;

void main() {
  float cel_intensity = ceil(max(dot(vNormal, normalize((view * vec4(lightDirection, 0.0)).xyz)), 0.0) * numBands) / numBands;
  gl_FragColor = vec4(diffuse * cel_intensity, 1);
}
