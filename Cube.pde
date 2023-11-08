class Cube {
  int x, y, z;
  float c;
  
  Cube(int x, int y, int z) {
    this.x = x; 
    this.y = y;
    this.z = z;
    this.c = 1; 
  }
  
  PShape dessine() {
    PShape box = createShape();
    
    box.beginShape(QUADS);
      box.noFill();
      box.stroke(255);
      
      box.vertex(x + c, y + c, z + c, 0, 0);
      box.vertex(x - c, y + c, z + c, 0, 1);
      box.vertex(x - c, y - c, z + c, 1, 1);
      box.vertex(x + c, y - c, z + c, 1, 0);
  
      box.vertex(x + c, y + c, z - c, 0, 0);
      box.vertex(x - c, y + c, z - c, 0, 1);
      box.vertex(x - c, y - c, z - c, 1, 1);
      box.vertex(x + c, y - c, z - c, 1, 0);
      
      box.vertex(x + c, y + c, z + c, 0, 0);
      box.vertex(x + c, y + c, z - c, 0, 1);
      box.vertex(x - c, y + c, z - c, 1, 1);
      box.vertex(x - c, y + c, z + c, 1, 0);
  
      box.vertex(x + c, y - c, z + c, 0, 0);
      box.vertex(x + c, y - c, z - c, 0, 1);
      box.vertex(x - c, y - c, z - c, 1, 1);
      box.vertex(x - c, y - c, z + c, 1, 0);
  
      box.vertex(x + c, y + c, z + c, 0, 0);
      box.vertex(x + c, y + c, z - c, 0, 1);
      box.vertex(x + c, y - c, z - c, 1, 1);
      box.vertex(x + c, y - c, z + c, 1, 0);
      
      box.vertex(x - c, y + c, z + c, 0, 0);
      box.vertex(x - c, y + c, z - c, 0, 1);
      box.vertex(x - c, y - c, z - c, 1, 1);
      box.vertex(x - c, y - c, z + c, 1, 0);
      
    box.endShape(CLOSE);
    
    return box;
  }
}
