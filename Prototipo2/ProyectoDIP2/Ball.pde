class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  color c;
 Ball(color c) {
   location = new PVector(random(width),0);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
   mass = random(1,5);
   this.c = c;
 }
 void move() {
   //acceleration.x = constrain(acceleration.x,-1,1);
   //acceleration.y = constrain(acceleration.y,-1,1);
   velocity.add(acceleration);
   location.add(velocity);
   velocity.x = constrain(velocity.x,-5,5);
   velocity.y = constrain(velocity.y,-5,5);
   acceleration.mult(0);
   
 }
 void bounce() {
    if((location.x > width - mass) || (location.x < mass)) velocity.x *= -1;
    if((location.y > height - mass) || (location.y < mass)) velocity.y *= -1;
 }
 void addForce(PVector force) {
   PVector f = PVector.div(force,mass);
   acceleration.add(f);
 }
 void display() {
   stroke(0);
   strokeWeight(0);
   fill(c,100);
   ellipse(location.x,location.y,mass,mass);
 }
 void centroG(float x, float y) {
    //Declare forces
    PVector mouse = new PVector(width - 300,height/4);
    //PVector friction = b.velocity.copy();
    gravity = new PVector(0,t);
    gravity.mult(b.mass);
    //Let's add gravity and friction
    if((mouseX < width && mouseX > 0) && (mouseY < height && mouseY > 0)) {
      mouse = mouse.sub(b.location);
      if(keyCode == 'E') mouse.setMag(.2);
      else if(keyCode == 'C') mouse.setMag(.9*b.mass);
      else mouse.setMag(.9);
      
      b.addForce(mouse);
    }
    else {
      b.addForce(gravity);
      b.bounce();    
    }
}