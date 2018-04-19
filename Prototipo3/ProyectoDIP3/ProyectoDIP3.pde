//https://github.com/01010101/GifAnimation
import gifAnimation.*;

HelpMenu h;
PFont mono;
Gif[] gifs = new Gif[4];

SistemaParticulas p1;
float margenDerecho; //describe el limite a la derecha
float margenIzquierdo; // describe el limite a la izquierda
int clusters = 16;

void settings()
{
 	size(1200,600);
	//fullScreen();
	margenDerecho = floor((width-width/10));
	margenIzquierdo = floor((width/10));
 	p1 = new SistemaParticulas(clusters);

 	for(int i = 0; i < gifs.length; i++)
 	{
 		gifs[i] = new Gif(this, "helpImages/"+(i+1)+".gif");
 	}
 	h = new HelpMenu(gifs);
}

void setup()
{
	p1.colorear();
	p1.generarPosiciones(clusters);
	//
	mono = createFont("Sanotra.ttf",32);
	textFont(mono);
	
}

void draw()
{
 	background(0);
 	//p1.centroG(true, 1);
 	//p1.move();
 	h.volumen();
 	h.backbtn();
 	h.gifs();
}
