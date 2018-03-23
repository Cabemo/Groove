class Liquid  {
  float x, y, w, h;
  Liquid(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  
  void display(){
    fill(0,0,100);
    rect(x,y,w,h);
  }

  PVector drag(Ball b) {
    PVector dragForce;
   
    dragForce = b.velocity.copy();
    dragForce = dragForce.normalize().mult(-.5*b.velocity.mag()*b.velocity.mag()*.2);
    
    return dragForce;
  }
  boolean contains(Ball b) {
    if(b.location.x >= x && b.location.x <= x + w && b.location.y >= y && b.location.y <= y + h) return true;
    else return false;
  }
}