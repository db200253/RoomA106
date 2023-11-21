Camera cam;

PShader textureShader;
PShape salle;
//PShape clavier;
//PShape table;

PVector [] lightPos = {
  new PVector(0, 0, 200)
};
PVector [] lightColor = {
  new PVector(255, 255, 255)
};

void setup() {
  size(1000, 1000, P3D);
  textureShader = loadShader("FragmentShader.glsl", "VertexShader.glsl");
  cam = new Camera(new PVector(0,0,0),0,0);
  salle = dessineSalle();
  //clavier = dessineClavier();
  //table = dessineTable(0,0,0);
}

void draw() {
  background(0);
  shader(textureShader);
  ambientLight(0, 0, 0);
  lightSpecular(lightColor[0].x, lightColor[0].y, lightColor[0].z);
  pointLight(lightColor[0].x, lightColor[0].y, lightColor[0].z,
              lightPos[0].x, lightPos[0].y, lightPos[0].z);
  cam.dessine();
  shape(salle);
  //shape(clavier);
  ///shape(table);
}

PShape dessineCube() {
  PShape box = createShape();
  int c = 1;
    
  box.beginShape(QUADS);
  
    box.noFill();
    box.stroke(0);
    box.vertex(c, c, c, 0, 0);
    box.vertex(-c, c, c, 0, 1);
    box.vertex(-c, -c, c, 1, 1);
    box.vertex(c, -c, c, 1, 0);
    
    box.noFill();
    box.stroke(0);
    box.vertex(c, c, -c, 0, 0);
    box.vertex(-c, c, -c, 0, 1);
    box.vertex(-c, -c, -c, 1, 1);
    box.vertex(c, -c, -c, 1, 0);
    
    box.noFill();
    box.stroke(0);
    box.vertex(c, c, c, 0, 0);
    box.vertex(c, c, -c, 0, 1);
    box.vertex(-c, c, -c, 1, 1);
    box.vertex(-c, c, c, 1, 0);
    
    box.noFill();
    box.stroke(0);
    box.vertex(c, -c, c, 0, 0);
    box.vertex(c, -c, -c, 0, 1);
    box.vertex(-c, -c, -c, 1, 1);
    box.vertex(-c, -c, c, 1, 0);
    
    box.noFill();
    box.stroke(0);
    box.vertex(c, c, c, 0, 0);
    box.vertex(c, c, -c, 0, 1);
    box.vertex(c, -c, -c, 1, 1);
    box.vertex(c, -c, c, 1, 0);
    
    box.noFill();
    box.stroke(0);
    box.vertex(-c, c, c, 0, 0);
    box.vertex(-c, c, -c, 0, 1);
    box.vertex(-c, -c, -c, 1, 1);
    box.vertex(-c, -c, c, 1, 0);
  
  box.endShape(CLOSE);
    
  return box;
}

PShape dessineSalle() {
  int w = 594, h = 278, d = 978;
}

/*
PShape dessineClavier() {
   PShape clavier = dessineCube();
   
   clavier.scale(43,1,12);
   
   return clavier;
}*/
/*
PShape dessineTable(int x, int y, int z) {
  PShape table = createShape(GROUP);
  
  PShape socle = socleTable(x,y,z);
  PShape pied1 = piedTable(x,y+2,z);
  PShape pied2 = piedTable(x+159,y+2,z);
  PShape pied3 = piedTable(x,y+2,z+79);
  PShape pied4 = piedTable(x+159,y+2,z+79);
   
  table.addChild(socle);
  table.addChild(pied1);
  table.addChild(pied2);
  table.addChild(pied3);
  table.addChild(pied4);
  
  return table;
}*/

/*PShape socleTable(int x, int y, int z) {
  PShape socle = createShape(GROUP);
  
  int w = 160, h = 2, d = 80;
  
  for(int i = 0; i < w; ++i) {
    for(int j = 0; j < h; ++j) {
      for(int k = 0; k < d; ++k) {
         
        PShape cube = dessineCube(x + i, y + j, z + k);
        socle.addChild(cube);
      }
    }
  }
  
  return socle;
}

PShape piedTable(int x, int y, int z) {
  PShape pied = createShape(GROUP);
  
  int w = 1, h = 73, d = 1;
  
  for(int i = 0; i < w; ++i) {
    for(int j = 0; j < h; ++j) {
      for(int k = 0; k < d; ++k) {
         
        PShape cube = dessineCube(x + i, y + j, z + k);
        pied.addChild(cube);
      }
    }
  }
  
  return pied;
}*/

void keyPressed() {
  float speed = 5.0;
  
  if (key == 'z' || keyCode == UP) {
    cam.bouge(new PVector(0, 0, speed));
  } else if (key == 's' || keyCode == DOWN) {
    cam.bouge(new PVector(0, 0, -speed));
  } else if (key == 'q' || keyCode == LEFT) {
    cam.bouge(new PVector(speed, 0, 0));
  } else if (key == 'd' || keyCode == RIGHT) {
    cam.bouge(new PVector(-speed, 0, 0));
  }
}

void mouseDragged() {
  float dirSpeed = 0.001;
  
  float deltaX = mouseX - pmouseX;
  float deltaY = mouseY - pmouseY;

  float deltaTheta = deltaX * dirSpeed;
  float deltaPhi = -deltaY * dirSpeed;

  cam.tourne(deltaTheta, deltaPhi);
}
