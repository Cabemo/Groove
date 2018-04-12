SistemaParticulas p1;
float margenDerecho; //describe el limite a la derecha
float margenIzquierdo; // describe el limite a la izquierda
float margenTop; //margen superi
int clusters = 16;

void settings()
{
 	size(1200,600);
	//fullScreen();
	margenDerecho = floor((width-width/10));
	margenIzquierdo = floor((width/10));
	margenTop = floor((height/10));
 	p1 = new SistemaParticulas(clusters);
}

void setup()
{
 	p1.colorear();
 	p1.generarPosiciones(clusters);
}

void draw()
{
 	background(0);
 	p1.centroG(true, 1);
 	p1.move();
}
