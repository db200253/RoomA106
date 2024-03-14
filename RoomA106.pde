Camera cam;

PShader textureShader;

Boite b;
PShape bg;
Boite f;
PShape fen;

Boite l;
PShape lum;

Boite s;
PShape salle;
Boite t;
PShape tableau;
Boite p, p2;
PShape porte, porte2;

Boite p3, p4;
PShape pied, piedT;
Boite p5, p6;
PShape plat, platT;

//PShape clavier;
//PShape table;

PImage background;
PImage fenetre;
PImage lumiere;
PImage bois;
PImage murs;
PImage sol;
PImage tab;
PImage door;
PImage feet;
PImage plateau;
PImage plateauT;

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
  cam = new Camera(new PVector(300,-135,500),0,0);
  //clavier = dessineClavier();
  textureShader = loadShader("FragmentShader.glsl", "VertexShader.glsl");
  background = loadImage("background.jpg");
  fenetre = loadImage("fenetre.png");
  lumiere = loadImage("lumiere.png");
  bois = loadImage("bois.jpg");
  murs = loadImage("mur.jpg");
  sol = loadImage("sol2.jpeg");
  tab = loadImage("tab.jpg");
  door = loadImage("porte.png");
  feet = loadImage("pied.png");
  plateau = loadImage("plat.png");
  plateauT = loadImage("platT.jpg");
  b = new Boite(1, 175, 800);
  bg = b.dessine(background, background, background, background, background, background);
  f = new Boite(2, 175, 200);
  fen = f.dessine(fenetre, fenetre, fenetre, fenetre, fenetre, fenetre);
  s = new Boite(600, 275, 1000);
  salle = s.dessine(murs, murs, murs, sol, murs, murs);
  l = new Boite(30,2,125);
  lum = l.dessine(lumiere, lumiere, lumiere, lumiere, lumiere, lumiere);
  t = new Boite(390,140,1);
  tableau = t.dessine(tab, bois, bois, bois, bois, bois);
  p = new Boite(2,220,100);
  porte = p.dessine(door, door, door, door, door, door);
  p2 = new Boite(100, 220, 2);
  porte2 = p2.dessine(door, door, door, door, door, door);
  p3 = new Boite(2, 45, 2);
  pied = p3.dessine(feet, feet, feet, feet, feet, feet);
  p4 = new Boite(5, 70, 5);
  piedT = p4.dessine(feet, feet, feet, feet, feet, feet);
  p5 = new Boite(40, 2, 40);
  plat = p5.dessine(plateau, plateau, plateau, plateau, plateau, plateau);
  p6 = new Boite(170, 4, 85);
  platT = p6.dessine(plateauT, plateauT, plateauT, plateauT, plateauT, plateauT);
  
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
  translate(115, -273, 68);
  for(int i = 0; i < 4; ++i) {
    shape(lum);
    translate(0, 0, 250);
  }
  translate(390, 0, -1000);
  for(int i = 0; i < 4; ++i) {
    shape(lum);
    translate(0, 0, 250);
  }
  translate(-505, 273, -1068);
  translate(120, -70, 0);
  shape(tableau);
  translate(-120, 70, 0);
  translate(599, 0, 25);
  shape(porte);
  translate(-599, 0, -25);
  translate(5, 0, 0);
  shape(porte2);
  translate(0, 0, 998);
  shape(porte2);
  translate(-5, 0, -998);
  
  dessineChaise(260, 90);
  
  dessineTable(190, 93);
  dessineTable(90, 185);
  dessineTable(260, 185);
  dessineTable(430, 185);
  dessineTable(90, 355);
  dessineTable(260, 355);
  dessineTable(430, 355);
  dessineTable(90, 525);
  dessineTable(260, 525);
  dessineTable(430, 525);
  dessineTable(90, 695);
  dessineTable(260, 695);
  dessineTable(430, 695);
  dessineTable(90, 830);
  dessineTable(550, 830);
}

void dessineChaise(int w, int d) {
  translate(w, 0, d);
  shape(pied);
  translate(38, 0, 0);
  shape(pied);
  translate(0, 0, 38);
  shape(pied);
  translate(-38, 0, 0);
  shape(pied);
  translate(0, -45, -38);
  shape(plat);
  translate(-w, 45, -d+38);
}

void dessineTable(int w, int d) {
  translate(w, 0, d);
  shape(piedT);
  translate(165, 0, 0);
  shape(piedT);
  translate(0, 0, 80);
  shape(piedT);
  translate(-165, 0, 0);
  shape(piedT);
  translate(0, -70, -80);
  shape(platT);
  translate(-w, 70, -d);
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
