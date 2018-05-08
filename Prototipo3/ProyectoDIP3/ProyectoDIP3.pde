import ddf.minim.*;
import ddf.minim.analysis.*;

SistemaParticulas p1;
float margenDerecho; //describe el limite a la derecha
float margenIzquierdo; // describe el limite a la izquierda
int clusters = 7;

/**/

Minim minim;
AudioPlayer[] players;
BeatDetect beat;
float[] newMass;


void settings()
{
 	size(800,600);
	//fullScreen();
	margenDerecho = floor((width-width/10));
	margenIzquierdo = floor((width/10));
 	p1 = new SistemaParticulas(clusters);
 	
 	minim = new Minim(this);
 	players = new AudioPlayer[6];
 	newMass = new float[7];
	players[0] = minim.loadFile("grooved.mp3", 2048);
	players[1] = minim.loadFile("grooved.mp3", 2048);
	players[2] = minim.loadFile("grooved.mp3", 2048);
	players[3] = minim.loadFile("grooved.mp3", 2048);
	players[4] = minim.loadFile("grooved.mp3", 2048);
	players[5] = minim.loadFile("grooved.mp3", 2048);

}

void setup()
{
 	p1.colorear();
 	p1.generarPosiciones(clusters);

 	players[0].loop();
 	/*players[1].loop();
 	players[2].loop();
 	players[3].loop();
 	players[4].loop();
 	players[5].loop();*/
 	newMass[0] = 0.9;
 	newMass[1] = 0.4;
 	newMass[2] = 0.4;
 	newMass[3] = 0.4;
 	newMass[4] = 0.4;
 	newMass[5] = 0.4;
 	newMass[6] = 0.4;
 	beat = new BeatDetect();
}

void draw()
{
 	background(0);
	for(int i = 0; i < players.length;  i++)
	{
		if(players[i].isPlaying())
		{

			beat.detect(players[i].mix);
	 		newMass[i+1] *= 0.95;
		 	if ( newMass[i+1] < 0.2 ) newMass[i+1] = 0.3;
		 	else if ( beat.isOnset() ) newMass[i+1] = 0.7;
		}
	}
 	

 	p1.centroG(true, 1, newMass);

 	p1.move();
 	//println(newMass);
}
