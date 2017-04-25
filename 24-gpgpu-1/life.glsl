precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

float state(vec2 coord) {
  return texture2D(prevState, fract(coord / stateSize)).r;
}

void main() {
  vec2 coord = gl_FragCoord.xy;
  float sum = 0.0;

  for(float i = -1.0; i <= 1.0; ++i)
    for(float j = -1.0; j <= 1.0; ++j)
      sum += state(vec2(coord.x + i, coord.y + j));

  float c = state(coord);

  float s = (sum == 3.0 || (c == 1.0 && sum == 4.0)) ? 1.0 : 0.0;

  gl_FragColor = vec4(s,s,s, 1.0);
}
