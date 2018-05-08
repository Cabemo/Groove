import ddf.minim.*;
import ddf.minim.analysis.*;

SistemaParticulas p1;
float margenDerecho; //describe el limite a la derecha
float margenIzquierdo; // describe el limite a la izquierda
int clusters = 5;

/**/

Minim minim;
AudioPlayer player;
BeatDetect beat;
float newMass;


void settings()
{
 	size(800,600);
	//fullScreen();
	margenDerecho = floor((width-width/10));
	margenIzquierdo = floor((width/10));
 	p1 = new SistemaParticulas(clusters);
 	
 	minim = new Minim(this);
	player = minim.loadFile("groove.mp3", 2048);

}

void setup()
{
 	p1.colorear();
 	p1.generarPosiciones(clusters);

 	player.loop();
 	beat = new BeatDetect();
 	newMass = 0.4;
}

void draw()
{
	beat.detect(player.mix);
 	background(0);
 	
 	//map(newMass, 20, 80, 0.2, 0.9);
 	newMass *= 0.95;
 	if ( beat.isOnset() ) newMass = 0.9;
 	if ( newMass < 0.2 ) newMass = 0.2;

 	p1.centroG(true, 1, newMass);

 	p1.move();
 	//println(newMass);
}
