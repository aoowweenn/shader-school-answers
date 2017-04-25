highp mat4 reflection(highp vec3 n) {

  //TODO: Return a matrix that reflects all points about the plane passing through the origin with normal n

  return -2.0/dot(n, n)*mat4(n.x, 0, 0, 0, 0, n.y, 0, 0, 0, 0, n.z, 0, 0, 0, 0, 0)*mat4(n.x, n.x, n.x, 0,
                                n.y, n.y, n.y, 0,
                                n.z, n.z, n.z, 0,
                                0,   0,   0,   0) + mat4(1.0);
}

#pragma glslify: export(reflection)
