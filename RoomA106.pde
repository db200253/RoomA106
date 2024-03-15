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
Boite p5, p6, p7;
PShape plat, platT, doss;

Boite b2, b3;
PShape ba1, ba2;
Boite e;
PShape ecran;

Boite b4, b5;
PShape ba3, ba4;
Boite e2;
PShape ecran2;

Boite c;
PShape clav;
Boite to;
PShape tour;

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
PImage barre;
PImage screen;
PImage screen2;
PImage clavier;
PImage tower;

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
  barre = loadImage("barre.png");
  screen = loadImage("speechi.png");
  screen2 = loadImage("ecran.jpg");
  clavier = loadImage("clavier.png");
  tower = loadImage("tour.jpg");
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
  p7 = new Boite(40, 40, 2);
  doss = p7.dessine(plateau, plateau, plateau, plateau, plateau, plateau);
  b2 = new Boite(100, 10, 30);
  ba1 = b2.dessine(barre, barre, barre, barre, barre, barre);
  b3 = new Boite(24, 100, 5);
  ba2 = b3.dessine(barre, barre, barre, barre, barre, barre);
  e = new Boite(170, 115, 5);
  ecran = e.dessine(screen, barre, barre, barre, barre, barre);
  b4 = new Boite(20, 1, 20);
  ba3 = b4.dessine(barre, barre, barre, barre, barre, barre);
  b5 = new Boite(8, 10, 1);
  ba4 = b5.dessine(barre, barre, barre, barre, barre, barre);
  e2 = new Boite(60, 40, 2);
  ecran2 = e2.dessine(screen2, barre, barre, barre, barre, barre);
  c = new Boite(50, 2, 10);
  clav = c.dessine(barre, barre, clavier, barre, barre, barre);
  to = new Boite(10, 35, 40);
  tour = to.dessine(tower, barre, barre, barre, barre, barre);
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
  
  dessineChaise2(260, 85);
  dessineChaise(120, 250);
  dessineChaise(190, 250);
  dessineChaise(290, 250);
  dessineChaise(360, 250);
  dessineChaise(460, 250);
  dessineChaise(530, 250);
  dessineChaise(120, 420);
  dessineChaise(190, 420);
  dessineChaise(290, 420);
  dessineChaise(360, 420);
  dessineChaise(460, 420);
  dessineChaise(530, 420);
  dessineChaise(120, 590);
  dessineChaise(190, 590);
  dessineChaise(290, 590);
  dessineChaise(360, 590);
  dessineChaise(460, 590);
  dessineChaise(530, 590);
  dessineChaise(120, 760);
  dessineChaise(190, 760);
  dessineChaise(290, 760);
  dessineChaise(360, 760);
  dessineChaise(460, 760);
  dessineChaise(530, 760);
  dessineChaise2(450, 900);
  
  dessineEcran(120, 200);
  dessineEcran(290, 200);
  dessineEcran(360, 200);
  dessineEcran(460, 200);
  dessineEcran(530, 200);
  dessineEcran(120, 370);
  dessineEcran(290, 370);
  dessineEcran(360, 370);
  dessineEcran(460, 370);
  dessineEcran(530, 370);
  dessineEcran(120, 540);
  dessineEcran(290, 540);
  dessineEcran(360, 540);
  dessineEcran(460, 540);
  dessineEcran(530, 540);
  dessineEcran(120, 710);
  dessineEcran(290, 710);
  dessineEcran(360, 710);
  dessineEcran(460, 710);
  dessineEcran(530, 710);
  
  dessineTour(210, 200);
  dessineTour(260, 200);
  dessineTour(430, 200);
  dessineTour(260, 370);
  dessineTour(430, 370);
  dessineTour(260, 540);
  dessineTour(430, 540);
  dessineTour(260, 710);
  dessineTour(430, 710);
  
  dessineTable(190, 93);
  dessineTable(89, 185);
  dessineTable(259, 185);
  dessineTable(429, 185);
  dessineTable(89, 355);
  dessineTable(259, 355);
  dessineTable(429, 355);
  dessineTable(89, 525);
  dessineTable(259, 525);
  dessineTable(429, 525);
  dessineTable(89, 695);
  dessineTable(259, 695);
  dessineTable(429, 695);
  dessineTable(110, 914);
  dessineTable(380, 914);
  
  speechi();
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
  translate(0, 0, 38);
  shape(doss);
  translate(0, 0, -38);
  translate(-w, 45, -d);
}

void dessineChaise2(int w, int d) {
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
  shape(doss);
  translate(-w, 45, -d);
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

void dessineEcran(int w, int d) {
  translate(w+10, -74, d);
  shape(ba3);
  translate(6, 0, 3);
  shape(ba4);
  translate(-26, -6, 0);
  shape(ecran2);
  translate(5, 6, 30);
  shape(clav);
  translate(-w + 5, 74, -d-33);
}

void dessineTour(int w, int d) {
  translate(w, -74, d);
  shape(tour);
  translate(-w, 74, -d);
}

void speechi() {
  rotateY(radians(45));
  translate(-65, 0, 110);
  shape(ba1);
  translate(38, 0, 0);
  shape(ba2);
  translate(-73, -100, 0);
  shape(ecran);
  translate(100, 100, -110);
  rotateY(-1 * (radians(45)));
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
