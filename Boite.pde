class Boite {  
  
  int w,h,d;
  PImage t1,t2,t3,t4,t5,t6;
  
  public Boite(int w, int h, int d) {
    
    this.w = w;
    this.h = h;
    this.d = d;
  }

  /**
  * Méthode de dessin de la boîte avec les bonnes textures
  */
  public PShape dessine(PImage t1, PImage t2, PImage t3, PImage t4, PImage t5, PImage t6) {
  
    PShape b = createShape(GROUP);
    
    PShape fond = fond(t1);
    PShape base = base(t2);
    PShape haut = haut(t3);
    PShape bas = bas(t4);
    PShape gauche = gauche(t5);
    PShape droite = droite(t6);
    
    b.addChild(fond);
    b.addChild(base);
    b.addChild(haut);
    b.addChild(bas);
    b.addChild(gauche);
    b.addChild(droite);
    
    return b;
  }

  // Fond de la boîte
  PShape fond(PImage texture) {
    
    PShape b = createShape();
    
    b.beginShape(QUADS);
      
      b.normal(0,0,1);
      
      if(texture != null) {
        b.textureMode(NORMAL);
        b.texture(texture);
        b.shininess(200);
        b.emissive(0, 0, 0);
        b.normal(0,0,1);
      }

      b.vertex(w, -h, d, 0, 0);
      b.vertex(0, -h, d, 1, 0);
      b.vertex(0, 0, d, 1, 1);
      b.vertex(w, 0, d, 0, 1);
      
    b.endShape();
    
    return b;
  }

  // Base de la boîte
  PShape base(PImage texture) {
    
    PShape b = createShape();
    
    textureMode(NORMAL);
    
    b.beginShape(QUADS);
      
      b.normal(0,0,1);
      
      if(texture != null) {
        b.textureMode(NORMAL);
        b.texture(texture);
        b.shininess(200);
        b.emissive(0, 0, 0);
        b.normal(0,0,1);
      }
      
      b.vertex(w, -h, 0, 0, 0);
      b.vertex(0, -h, 0, 1, 0);
      b.vertex(0, 0, 0, 1, 1);
      b.vertex(w, 0, 0, 0, 1);
      
    b.endShape();
    
    return b;
  }

  // Haut de la boîte
  PShape haut(PImage texture) {
    
    PShape b = createShape();
    
    textureMode(NORMAL);
    
    b.beginShape(QUADS);
      
      b.normal(0,0,1);
      
      if(texture != null) {
        b.textureMode(NORMAL);
        b.texture(texture);
        b.shininess(200);
        b.emissive(0, 0, 0);
        b.normal(0,0,1);
      }
      
      b.vertex(w, -h, d, 0, 0);
      b.vertex(w, -h, 0, 1, 0);
      b.vertex(0, -h, 0, 1, 1);
      b.vertex(0, -h, d, 0, 1);
      
    b.endShape();
    
    return b;
  }

  // Bas de la boîte
  PShape bas(PImage texture) {
    
    PShape b = createShape();
    
    textureMode(NORMAL);
    
    b.beginShape(QUADS);
       
      b.normal(0,0,1);
      
      if(texture != null) {
        b.textureMode(NORMAL);
        b.texture(texture);
        b.shininess(200);
        b.emissive(0, 0, 0);
        b.normal(0,0,1);
      }
      
      b.vertex(w, 0, d, 0, 0);
      b.vertex(w, 0, 0, 1, 0);
      b.vertex(0, 0, 0, 1, 1);
      b.vertex(0, 0, d, 0, 1);
      
    b.endShape();
    
    return b;
  }

  // Gauche de la boîte
  PShape gauche(PImage texture) {
    
    PShape b = createShape();
    
    textureMode(NORMAL);
    
    b.beginShape(QUADS);
      
      b.normal(0,0,1);
      
      if(texture != null) {
        b.textureMode(NORMAL);
        b.texture(texture);
        b.shininess(200);
        b.emissive(0, 0, 0);
        b.normal(0,0,1);
      }
      
      b.vertex(w, -h, d, 0, 0);
      b.vertex(w, -h, 0, 1, 0);
      b.vertex(w, 0, 0, 1, 1);
      b.vertex(w, 0, d, 0, 1);
      
    b.endShape();
    
    return b;
  }

  // Droite de la boîte
  PShape droite(PImage texture) {
    
    PShape b = createShape();
    
    textureMode(NORMAL);
    
    b.beginShape(QUADS);
      
      b.normal(0,0,1);
      
      if(texture != null) {
        b.textureMode(NORMAL);
        b.texture(texture);
        b.shininess(200);
        b.emissive(0, 0, 0);
        b.normal(0,0,1);
      }
      
      b.vertex(0, -h, d, 0, 0);
      b.vertex(0, -h, 0, 1, 0);
      b.vertex(0, 0, 0, 1, 1);
      b.vertex(0, 0, d, 0, 1);
      
    b.endShape();
    
    return b;
  }
}
