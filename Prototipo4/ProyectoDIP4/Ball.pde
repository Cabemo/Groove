import ddf.minim.*;
class Ball
{
	PVector location;
	PVector velocity;
	PVector acceleration;
	float mass; //tamaño
	color c;
	PVector centro;
  Minim minim;
  AudioPlayer player;
  String[] audio = {"bass.mp3","guitar.mp3","beat.mp3","bass.mp3"};

	Ball(color c)
	{
		location = new PVector(random(width/3) + width/3,random(height/3) + height/3);
		velocity = new PVector(0,0); // inician en 0
		acceleration = new PVector(0,0); // inician en 0
		mass = random(1,5); // tamaño y masa entre 1 y 5;
		this.c = c;
    minim = new Minim(this);
    player = minim.loadFile(audio[(int)random(audio.length)]);
    
	}

	void move()
	{
		velocity.add(acceleration); // velocidad cambia respecto a la aceleracion

		location.add(velocity); // posicion cambia respecto a la velocidad

		velocity.x = constrain(velocity.x,-5,5);// no exceda -5 y 5
		velocity.y = constrain(velocity.y,-5,5);// no exceda -5 y 5
		
		acceleration.mult(0); // permanezca constante
		//acceleration.x = constrain(acceleration.x,-1,1);
		//acceleration.y = constrain(acceleration.y,-1,1);
	}

	void bounce()
	{
		if((location.x > width - mass) || (location.x < mass)) velocity.x *= -abs(velocity.x); //cambia sentido 
		if((location.y > height - mass) || (location.y < mass)) velocity.y *= -abs(velocity.y); //cambia sentido 
	}

	void addForce(PVector force)
	{
		PVector f = PVector.div(force,mass);
		acceleration.add(f);
	}

	void display()
	{
		stroke(0);//color
		strokeWeight(0);//tamaño del contorno
		fill(c);//da tranparencia
		ellipse(location.x,location.y,mass,mass);
	}

	void centroG(float x, float y, boolean m)
	{
		//lo que va a seguir cada cluster
		centro = new PVector(x, y);
		gravity = new PVector(0,t);// t esta en el principal
		gravity.mult(mass);//multiplica x * mass.x y y *mass*y
		if((mouseX < margenDerecho && mouseX > margenIzquierdo) && (mouseY > margenTop))
		{
			//centro es la diferencia entre la posicion dada y la ubicacion de cada cluster
			centro = centro.sub(location);
			// setMag para cambiar magnitud pero conservar distancia
			//entre mayor sea la magnitud mas lejos va

			if(keyCode == 'E') centro.setMag(.2);

			else if(keyCode == 'C') centro.setMag(.9*mass);

			else if(m) centro.setMag(.9*mass);

			//else if(keyCode == 'G')
			//{
			//	location.x = mouseX;
			//	location.y = mouseY;
			//}

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
