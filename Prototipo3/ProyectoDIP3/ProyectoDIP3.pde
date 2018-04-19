import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

SistemaParticulas p1;
float margenDerecho; //describe el limite a la derecha
float margenIzquierdo; // describe el limite a la izquierda
int clusters = 16;
Kinect kinect;
KinectTracker tracker;
void settings()
{  
  
 	size(1280, 600);//necesario para kinect no cambiar!
	//fullScreen();
	margenDerecho = floor((width-width/10));
	margenIzquierdo = floor((width/10));
  kinect = new Kinect(this);
  tracker = new KinectTracker();
 	p1 = new SistemaParticulas(clusters, kinect);
}

void setup()
{
 	p1.colorear();
 	p1.generarPosiciones(clusters);
}

void draw()
{
 	background(0);
  tracker.track();
  tracker.display();
  PVector t = tracker.getPos();
 	p1.centroG(true, 1, t.x, t.y);
 	p1.move();
}
void dispose() {
  kinect.stopDepth();
}
