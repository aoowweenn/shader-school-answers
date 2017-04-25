precision highp float;

uniform float theta;

attribute vec2 position;

void main() {

  //TODO: rotate position by theta radians about the origin
  vec2 new_position;
  new_position[0] = cos(theta)*position[0] - sin(theta)*position[1];
  new_position[1] = sin(theta)*position[0] + cos(theta)*position[1];

  gl_Position = vec4(new_position, 0, 1.0);
}
