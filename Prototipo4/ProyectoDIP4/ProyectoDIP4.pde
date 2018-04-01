Ball[][] all;
PVector gravity;
float t = .4;// modifica el vector y de la gravedad
int margenDerecho; //describe el limite a la derecha
int margenIzquierdo; // describe el limite a la izquierda
int margenTop; //margen superior

void settings() 
{
	size(720,360);
	//fullScreen();
	//frameRate(2);
	margenDerecho = (width-width/10);
	margenIzquierdo = (width/10);
	margenTop = (height/10);
}

void setup()
{
	all = new Ball[6][500];
	for(int i = 0; i < all.length; i++)
	{
		for(int j = 0; j < all[0].length; j++)
		{
			switch(i)
			{
				case 0:
					all[i][j] = new Ball(#E4E5E5); // blanco grisoso
					break;
				case 1:
					all[i][j] = new Ball(#e67e22); //naranja leve
					break;
				case 2:
					all[i][j] = new Ball(#f1c40f); //amarillo
					break;
				case 3:
					all[i][j] = new Ball(#c0392b); //rojo
					break;
				case 4:
					all[i][j] = new Ball(#27ae60); //verde
					break;
				case 5:
					all[i][j] = new Ball(#8e44ad); //morado
					break;
			}
		}
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
				case 1:
					b.centroG(width/8 * 2, height/3, true);
					break;
				case 2:
					b.centroG(width/8 * 3, height/3, true);
					break;
				case 3:
					b.centroG(width/8 * 4, height/3, true);
					break;
				case 4:
					b.centroG(width/8 * 5, height/3, true);
					break;
				case 5:
					b.centroG(width/8 * 6, height/3, true);
					break;       
			}
			b.move();
			b.display();
		}
	}
}
