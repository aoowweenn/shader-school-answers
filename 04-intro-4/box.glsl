bool inBox(highp vec2 lo, highp vec2 hi, highp vec2 p) {

  return all(greaterThan(p, lo)) && all(lessThan(p, hi));
}


//Do not change this line or the name of the above function
#pragma glslify: export(inBox)
