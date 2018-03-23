Ball[] balls, b2, b3;

//Liquid l;
PVector gravity;
PVector fly, wind;
float t = .2;
int fill = 0;
float probabilidad;
PImage img;
void settings() {
  size(1200,600);
}
void setup() {
  img = loadImage("naturaleza.jpg");
  balls = new Ball[500];
  b2 = new Ball[500];
  b3 = new Ball[1000];
  for(int i = 0; i < b3.length; i++) {
    b3[i] = new Ball(#E4E5E5);
  }
  for(int i = 0; i < b2.length; i++) {
    balls[i] = new Ball(#ffa366);
    b2[i] = new Ball(#ffff00);
  fly = new PVector(0,-.70);
  wind = new PVector(.7,0);
 // l = new Liquid(0,height/1.4,width,height);
   probabilidad = 0;
}
}
void draw() {
  background(img);
  //l.display();
  probabilidad = random(1);

    b.move();
    b.display();
    //if(l.contains(b)) {
    //  PVector drag = l.drag(b);
    //  b.addForce(drag);
    //}
  }
  for(Ball b : b3) {
    //Declare forces
    PVector center = new PVector(x, y);
    //PVector friction = b.velocity.copy();
    gravity = new PVector(0,t);
    gravity.mult(b.mass);
    //Let's add gravity and friction
    if((mouseX < width && mouseX > 0) && (mouseY < height && mouseY > 0)) {
      center = center.sub(b.location);
      if(keyCode == 'E') center.setMag(.2);
      else if(keyCode == 'C') center.setMag(.9*b.mass);
      else center.setMag(.9);

      b.addForce(center);
    }
    else {
      b.addForce(gravity);
      b.bounce();
    }
    b.move();
    b.display();
    //if(l.contains(b)) {
    //  PVector drag = l.drag(b);
    //  b.addForce(drag);
    //}
  }
  for(Ball b : b2) {
    //Declare forces
    PVector mouse = new PVector(width/4,height/4);
    //PVector friction = b.velocity.copy();
    gravity = new PVector(0,t);
    gravity.mult(b.mass);
    //Let's add gravity and friction
    if((mouseX < width && mouseX > 0) && (mouseY < height && mouseY > 0)) {
      mouse = mouse.sub(b.location);
      if(keyCode == 'E') mouse.setMag(.2);
      else if(keyCode == 'C') mouse.setMag(.9*b.mass);
      else mouse.setMag(.4);

      b.addForce(mouse);
    }
    else {
      b.addForce(gravity);
      b.bounce();
    }
    b.move();
    b.display();
    //if(l.contains(b)) {
    //  PVector drag = l.drag(b);
    //  b.addForce(drag);
    //}
  }
}
