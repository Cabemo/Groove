class Ball
{
	PVector location;
	PVector velocity;
	PVector acceleration;
	PVector gravity;
	float mass;
	color c;
	PVector centro;

	Ball(color c)
	{
		location = new PVector(random(width/3) + width/3,random(height/3) + height/3);
		velocity = new PVector(0,0);
		acceleration = new PVector(0,0);
		mass = random(1,5);
		this.c = c;
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
		ellipse(location.x,location.y,mass,mass);
	}

	void centroG(float x, float y, boolean m)
	{
		//Declare forces
		centro = new PVector(x, y);
		//PVector friction = b.velocity.copy();
		gravity = new PVector(0,.2);
		gravity.mult(mass);
		//Let's add gravity and friction
		if((mouseX < margenDerecho && mouseX > margenIzquierdo)) //&& (mouseY > margenTop))
		{
			centro = centro.sub(location);
			
			if(keyCode == 'E') centro.setMag(.2); //expande 
			else if(keyCode == 'C') centro.setMag(.9*mass); // contrae
			else if(m) centro.setMag(.9*mass);
			else if(keyCode == 'G')
			{
				location.x = mouseX;
				location.y = mouseY;
			}
			else if(!m) centro.setMag(.9);
			addForce(centro);
			
		}
		else
		{
			addForce(gravity);
			bounce();
		}
	}
}
