precision highp float;

uniform sampler2D texture;
uniform vec2 screenSize;

void main() {
  vec2 coord = gl_FragCoord.xy / screenSize;

  vec4 color = texture2D(texture, coord);
  vec4 swap = vec4(color.b, color.g, color.r, color.a);

  gl_FragColor = swap;
}
