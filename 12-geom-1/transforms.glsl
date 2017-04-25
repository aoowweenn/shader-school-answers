precision highp float;

attribute vec3 position;

uniform mat4 model, view, projection;

void main() {

  vec4 new_pos = projection * view * model * vec4(position, 1);

  gl_Position = new_pos;
}
