Camera cam;

PShader textureShader;

Boite b;
PShape bg;
Boite f;
PShape fen;

Boite s;
PShape salle;
Boite t;
PShape tableau;
Boite p;
PShape porte;

//PShape clavier;
//PShape table;

PImage background;
PImage fenetre;
PImage bois;
PImage murs;
PImage sol;
PImage tab;
PImage door;

PVector [] lightPos = {
  new PVector(150, -278, 250),
  new PVector(150, -278, 500),
  new PVector(150, -278, 750),
  new PVector(450, -278, 250),
  new PVector(450, -278, 500),
  new PVector(450, -278, 750),
};
PVector [] lightColor = {
  new PVector(50, 50, 50),
  new PVector(50, 50, 50),
  new PVector(50, 50, 50),
  new PVector(50, 50, 50),
  new PVector(50, 50, 50),
  new PVector(50, 50, 50)
};

void setup() {
  size(1000, 1000, P3D);
  cam = new Camera(new PVector(0,0,0),0,0);
  //clavier = dessineClavier();
  textureShader = loadShader("FragmentShader.glsl", "VertexShader.glsl");
  background = loadImage("background.jpg");
  fenetre = loadImage("fenetre.png");
  bois = loadImage("bois.jpg");
  murs = loadImage("mur.jpg");
  sol = loadImage("sol.jpeg");
  tab = loadImage("tab.jpg");
  door = loadImage("porte.png");
  b = new Boite(1, 175, 800);
  bg = b.dessine(background, background, background, background, background, background);
  f = new Boite(2, 175, 200);
  fen = f.dessine(fenetre, fenetre, fenetre, fenetre, fenetre, fenetre);
  s = new Boite(600, 275, 1000);
  salle = s.dessine(murs, murs, murs, sol, murs, murs);
  t = new Boite(390,140,1);
  tableau = t.dessine(tab, bois, bois, bois, bois, bois);
  p = new Boite(1,220,100);
  porte = p.dessine(door, door, door, door, door, door);
  
  //table = dessineTable(0,0,0);
}

void draw() {
  background(0);
  shader(textureShader);
  ambientLight(10,10,10);
  for (int i = 0; i < lightPos.length; i++) {
    emissive(lightColor[i].x, lightColor[i].y, lightColor[i].z);
    translate(lightPos[i].x, lightPos[i].y, lightPos[i].z);
    pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z,
            lightPos[i].x, lightPos[i].y, lightPos[i].z);
  }
       
  cam.dessine();
  updateCamera();
  translate(0, -70, 100);
  shape(bg);
  shape(fen);
  translate(0, 0, 200);
  shape(fen);
  translate(0, 0, 200);
  shape(fen);
  translate(0, 0, 200);
  shape(fen);
  translate(0, 70, -700);
  shape(salle);
  translate(120, -70, 0);
  shape(tableau);
  translate(-120, 70, 0);
  translate(599, 0, 25);
  shape(porte);
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
boolean keyUPressed = false;
boolean keyJPressed = false;

void keyPressed() {
  if (key == 'z' || keyCode == UP) {
    keyZPressed = true;
  } else if (key == 's' || keyCode == DOWN) {
    keySPressed = true;
  } else if (key == 'q' || keyCode == LEFT) {
    keyQPressed = true;
  } else if (key == 'd' || keyCode == RIGHT) {
    keyDPressed = true;
  } else if (key == 'u') {
    keyUPressed = true;
  } else if (key == 'j') {
    keyJPressed = true;
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
  } else if (key == 'u') {
    keyUPressed = false;
  } else if (key == 'j') {
    keyJPressed = false;
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
  if (keyUPressed) {
    cam.bouge(new PVector(0, -speed, 0));
  }
  if (keyJPressed) {
    cam.bouge(new PVector(0, speed, 0));
  }
}

void mouseDragged() {
  float dirSpeed = 0.002;
  
  float deltaX = mouseX - pmouseX;
  float deltaY = mouseY - pmouseY;

  float deltaTheta = deltaX * dirSpeed;
  float deltaPhi = -deltaY * dirSpeed;

  cam.tourne(deltaTheta, deltaPhi);
}
