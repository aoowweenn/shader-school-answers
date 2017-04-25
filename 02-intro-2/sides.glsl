void sideLengths(
  highp float hypotenuse, 
  highp float angleInDegrees, 
  out highp float opposite, 
  out highp float adjacent) {


  opposite = hypotenuse * sin(radians(angleInDegrees));
  adjacent = hypotenuse * cos(radians(angleInDegrees));

}

//Do not change this line
#pragma glslify: export(sideLengths)
