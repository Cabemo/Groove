SistemaParticulas p1;
float margenDerecho; //describe el limite a la derecha
float margenIzquierdo; // describe el limite a la izquierda
int clusters = 5;

/**/

Minim minim;
AudioPlayer player;
int nowInMusic, limitMusic;


void settings()
{
 	size(400,300);
	//fullScreen();
	margenDerecho = floor((width-width/10));
	margenIzquierdo = floor((width/10));
 	p1 = new SistemaParticulas(clusters);
 	
 	minim = new Minim(this);
	player = minim.loadFile("groove.mp3");
	limitMusic = player.bufferSize()-1;
}

void setup()
{
 	p1.colorear();
 	p1.generarPosiciones(clusters);
 	player.loop();
}

void draw()
{

 	background(0);
 	p1.centroG(true, 1);
 	p1.move();
}
