PShape cubes;
int nbcb = 256;
int w = 32, l = 8, h = 1;
Cube[] cbs = new Cube[nbcb];

float camX = 0, camY = 0, camZ = 0;

void setup() {
  size(1000, 1000, P3D);
  assembleCube();
}

void draw() {
  background(0);
  bougerCamera();
  camera(
    camX, -camY, camZ,
    0, 0, 0,
    0, 1, 0);
  shape(cubes);
}

void assembleCube() {
  cubes = createShape(GROUP);
  
  for(int i = 0; i < w; ++i) {
    for(int j = 0; j < l; ++j) {
      for(int k = 0; k < h; ++k) {
        cbs[i+j+k] = new Cube(i, j, k);
        cubes.addChild(cbs[i+j+k].dessine());
      }
    }
  }
}

void bougerCamera() {}
