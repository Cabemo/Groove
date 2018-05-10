class Ball
{
	PVector location;
	PVector velocity;
	PVector acceleration;
	PVector gravity;
	float mass;
	color c;
	PVector centro;
  boolean dance;
  int t;

	Ball(color c)
	{
		location = new PVector(random(width/3) + width/3,random(height/3) + height/3);
		velocity = new PVector(0,0);
		acceleration = new PVector(0,0);
		mass = random(2,10);
		this.c = c;
   dance = false;
   t = 0;
	}

	void move()
	{
		//acceleration.x = constrain(acceleration.x,-1,1);
		//acceleration.y = constrain(acceleration.y,-1,1);
		velocity.add(acceleration);
		location.add(velocity);
		velocity.x = constrain(velocity.x,-5,5);
		velocity.y = constrain(velocity.y,-5,5);
		acceleration.mult(0);
		 
	}

	void bounce()
	{
		if((location.x > width - mass) || (location.x < mass)) velocity.x *= -1;
		if((location.y > height - mass) || (location.y < mass)) velocity.y *= -1;
	}

	void addForce(PVector force)
	{
		PVector f = PVector.div(force,mass);
		acceleration.add(f);
	}

	void display()
	{
		stroke(0);
		strokeWeight(0);
		//fill(c,100);
		fill(c);
    if(dance) {
      int r = (int)random(2, 20);
      ellipse(location.x,location.y,r,r);
    }
    ellipse(location.x,location.y,mass,mass);
	}
  void setSize(float newSize) {
    mass = newSize;
  }
	void centroG(float x, float y, boolean m, float fuerza)
	{
		//Declare forces
		centro = new PVector(x, y);
		//PVector friction = b.velocity.copy();
		gravity = new PVector(0,.2);
		gravity.mult(mass);
		//Let's add gravity and friction
    
    if(tracker.count != 0 || stage == 1) //&& (mouseY > margenTop))
		{
			centro = centro.sub(location);
      if(stage == 1) centro.setMag(.98);
			else if(m) centro.setMag(fuerza*mass);
			else if(!m) centro.setMag(fuerza);
      addForce(centro);
		}
		else
		{
       centro.x = width/2;
       centro.y = height/2;
      if(!m) addForce(centro.sub(location));
			else addForce(gravity);
			bounce();
		}
	}
}
