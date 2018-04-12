SistemaParticulas p1;

void settings()
{
 	size(1200,600);
 	p1 = new SistemaParticulas(15);
}

void setup()
{
 	p1.colorear();
 	p1.generarPosiciones();
}

void draw()
{
 	background(0);
 	p1.centroG(true, 1);
 	p1.move();
}
