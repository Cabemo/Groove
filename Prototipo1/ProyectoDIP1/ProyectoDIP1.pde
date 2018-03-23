Ball[] balls, b1, b2, b3, b4, b5;

//Liquid l;
PVector gravity;
float t = .2;
void settings() {
  size(1200,600);
}
void setup() {
  balls = new Ball[2500];
  b1 = new Ball[300];
  b2 = new Ball[300];
  b3 = new Ball[300];
  b4 = new Ball[300];
  b5 = new Ball[300];
  for(int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(#E4E5E5);
  }
  for(int i = 0; i < b1.length; i++) {
    b1[i] = new Ball(#FFA366);
    b2[i] = new Ball(#FFFF00);
    b3[i] = new Ball(#FF0000);
    b4[i] = new Ball(#52BE80);
    b5[i] = new Ball(#FF5733);
}
}
void draw() {
  background(0);
  for(Ball b : balls) {
    b.centroG(mouseX, mouseY, false);
    b.move();
    b.display();
  } 
  for(Ball b : b1) {
    b.centroG(width/8 * 2, height/2, true); 
    b.move();
    b.display();
  } 
  for(Ball b : b2) {
    b.centroG(width/8 * 3, height/2, true);
    b.move();
    b.display();
  }
  for(Ball b : b3) {
    b.centroG(width/8 * 4, height/2, true);
    b.move();
    b.display();
  }
  for(Ball b : b4) {
    b.centroG(width/8 * 5, height/2, true);
    b.move();
    b.display();
  }
  for(Ball b : b5) {
    b.centroG(width/8 * 6, height/2, true);
    b.move();
    b.display();
  }
}
