Ball[][] all;
PVector gravity;
float t = .2;
void settings() {
  size(1200,600);
}
void setup() {
  all = new Ball[6][500];
 
}
void draw() {
  background(0);
  for(int i = 0; i < all.length; i++) {
    for(Ball b : all[i]) {
      switch(i) {
        case 0:
          b.centroG(mouseX, mouseY, false);
          break;
        case 1:
          b.centroG(width/8 * 2, height/3, true);
          break;
        case 2:
          b.centroG(width/8 * 3, height/3, true);
          break;
        case 3:
          b.centroG(width/8 * 4, height/3, true);
          break;
        case 4:
          b.centroG(width/8 * 5, height/3, true);
          break;
        case 5:
          b.centroG(width/8 * 6, height/3, true);
          break;       
      }
      if(i != 0 && b.location.x == mouseX && b.location.y == mouseY) b.centro.setMag(.2);
      b.move();
      b.display();
    }
  }
}
