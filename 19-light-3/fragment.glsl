precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 vNormal;
varying vec3 eyeDirection;

float phongWeight(
  vec3 lightDirection,
  vec3 surfaceNormal,
  vec3 eyeDirection,
  float shininess
) {
  //First reflect light by surface normal
  vec3 rlight = reflect(lightDirection, surfaceNormal);

  //Next find the projected length of the reflected
  //light vector in the view direction
  float eyeLight = max(dot(rlight, eyeDirection), 0.0);

  //Finally exponentiate by the shininess factor
  return pow(eyeLight, shininess);
}

void main() {
  float lambert = max(dot(vNormal, lightDirection), 0.0);
  float phong = phongWeight(lightDirection, vNormal, eyeDirection, shininess);
  gl_FragColor = vec4(ambient + diffuse * lambert + specular * phong, 1.0);
}
