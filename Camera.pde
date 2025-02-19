class Camera {
  
  private PVector eye, dir, up;
  private float theta, phi;
  
  Camera(PVector eye, float theta, float phi) {
    this.theta = theta;
    this.phi = phi;
    this.eye = eye;
    this.dir = dirFromAngles();
    this.up = new PVector(0, 1, 0);
  }

  /**
  * Méthode pour avoir la direction de la caméra
  */
  private PVector dirFromAngles() {
    return new PVector(cos(phi) * sin(theta),
                      sin(phi),
                      cos(phi) * cos(theta));
  }

  /**
  * Dessin de la caméra
  */
  void dessine() {
    camera(eye.x, eye.y, eye.z,
           eye.x + dir.x, eye.y + dir.y, eye.z + dir.z,
           up.x, up.y, up.z);
  }

  /**
  * Mouvement de la caméra
  */
  void bouge(PVector move) {
    PVector next = eye.copy();
    next.add(PVector.mult(dir, move.z));
    next.add(PVector.mult(dir.cross(up), move.x));
    next.add(PVector.mult(up, move.y));
    eye.set(next);
  }

  /**
  * Rotation de la caméra
  */
  void tourne(float deltaTheta, float deltaPhi) {
    theta += deltaTheta;
    phi += deltaPhi;

    phi = constrain(phi, -HALF_PI, HALF_PI);

    dir = dirFromAngles();
  }
}
