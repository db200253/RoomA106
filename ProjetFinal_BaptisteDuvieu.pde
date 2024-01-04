Camera cam;

PShader textureShader;

Boite s;
PShape salle;

//PShape clavier;
//PShape table;

PImage murs;
PImage sol;

PVector [] lightPos = {
  new PVector(150, -278, 250),
  new PVector(150, -278, 500),
  new PVector(150, -278, 750),
  new PVector(450, -278, 250),
  new PVector(450, -278, 500),
  new PVector(450, -278, 750),
};
PVector [] lightColor = {
  new PVector(200, 200, 200),
  new PVector(200, 200, 200),
  new PVector(200, 200, 200),
  new PVector(200, 200, 200),
  new PVector(200, 200, 200),
  new PVector(200, 200, 200)
};

void setup() {
  size(1000, 1000, P3D);
  cam = new Camera(new PVector(0,0,0),0,0);
  //clavier = dessineClavier();
  textureShader = loadShader("FragmentShader.glsl", "VertexShader.glsl");
  murs = loadImage("mur.jpg");
  sol = loadImage("sol.jpg");
  s = new Boite(600, 275, 1000);
  salle = s.dessine(murs, murs, sol, sol, murs, murs);
  
  //table = dessineTable(0,0,0);
}

void draw() {
  background(0);
  shader(textureShader);
  ambientLight(10,10,10);
  for(int i=0; i<lightPos.length; i++) {
    lightSpecular(lightColor[i].x, lightColor[i].y, lightColor[i].z);
    pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z, 
               lightPos[i].x, lightPos[i].y, lightPos[i].z);
  }   
  
  for(int i=0; i<lightPos.length; i++) {
    pushMatrix();
        noStroke();
        emissive(lightColor[i].x, lightColor[i].y, lightColor[i].z);
        translate(lightPos[i].x, lightPos[i].y, lightPos[i].z);
        box(10, 10, 10);
    popMatrix();
  }

       
  cam.dessine();
  updateCamera();
  shape(salle);
  //shape(clavier);
  ///shape(table);
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

boolean keyZPressed = false;
boolean keySPressed = false;
boolean keyQPressed = false;
boolean keyDPressed = false;

void keyPressed() {
  if (key == 'z' || keyCode == UP) {
    keyZPressed = true;
  } else if (key == 's' || keyCode == DOWN) {
    keySPressed = true;
  } else if (key == 'q' || keyCode == LEFT) {
    keyQPressed = true;
  } else if (key == 'd' || keyCode == RIGHT) {
    keyDPressed = true;
  }
}

void keyReleased() {
  if (key == 'z' || keyCode == UP) {
    keyZPressed = false;
  } else if (key == 's' || keyCode == DOWN) {
    keySPressed = false;
  } else if (key == 'q' || keyCode == LEFT) {
    keyQPressed = false;
  } else if (key == 'd' || keyCode == RIGHT) {
    keyDPressed = false;
  }
}

void updateCamera() {
  float speed = 6.0;

  if (keyZPressed) {
    cam.bouge(new PVector(0, 0, speed));
  }
  if (keySPressed) {
    cam.bouge(new PVector(0, 0, -speed));
  }
  if (keyQPressed) {
    cam.bouge(new PVector(-speed, 0, 0));
  }
  if (keyDPressed) {
    cam.bouge(new PVector(speed, 0, 0));
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
