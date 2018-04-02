Ball[][] all;
PVector gravity;
float t = .4;// modifica el vector y de la gravedad
float margenDerecho; //describe el limite a la derecha
float margenIzquierdo; // describe el limite a la izquierda
float margenTop; //margen superior
float[] randX;
float[] randY;
color[] colores = {#16a085, //verde
						 #d35400, //naranja
						 #c0392b, //rojo
						 #2980b9, //azul
						 #f1c40f, //amarillo
						 #8e44ad, //morado
						 #487eb0 //azul gris
						};

void settings() 
{
	size(720,360);
	//fullScreen();
	//frameRate(2);
	margenDerecho = floor((width-width/10));
	margenIzquierdo = floor((width/10));
	margenTop = floor((height/10));
}


void setup()
{
	//........[nball][particles/ball]
	all = new Ball[12][250]; //menos part mas rapido mueve
	randX = new float[all.length];
	randY = new float[all.length];
	
	for(int i = 0; i < all.length; i++)
	{
		int index = floor(random(0, colores.length-1));
		for(int j = 0; j < all[0].length; j++)
		{
			switch(i)
			{
				case 0:
					all[i][j] = new Ball(#E4E5E5); // blanco grisoso
				break;
				default:
					all[i][j] = new Ball(colores[index]);
				break;
			}
		}
	}

	for(int i = 0; i < randX.length; i++)
	{
		randX[i] = random(margenIzquierdo,margenDerecho);
		randY[i] = random(margenTop,height/1.5);
	}

}

void draw()
{
	background(0);
	

	for(int i = 0; i < all.length; i++)
	{
		for(Ball b : all[i])
		{
			switch(i)
			{
				case 0:
					b.centroG(mouseX, mouseY, false);
					break;
				default :
					b.centroG(randX[i], randY[i], true);
					break;     
			}
			b.move();
			b.display();
		}
	}
}
