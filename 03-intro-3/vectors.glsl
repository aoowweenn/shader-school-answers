highp vec2 func(highp vec2 a, highp vec2 b) {

  float lengthA = length(a);
  float lengthB = length(b);

  highp vec2 c = vec2(lengthB*a.x + lengthA*b.x, lengthB*a.y + lengthA*b.y);

  return normalize(c);
}

//Do not change this line
#pragma glslify: export(func)
