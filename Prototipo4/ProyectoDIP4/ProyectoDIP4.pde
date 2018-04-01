Ball[][] all;
PVector gravity;
float t = .2;
void settings() 
{
	//size(1200,600);
	fullScreen();
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
					all[i][j] = new Ball(#E4E5E5);
					break;
				case 1:
					all[i][j] = new Ball(#FFA366);
					break;
				case 2:
					all[i][j] = new Ball(#FFA366);
					break;
				case 3:
					all[i][j] = new Ball(#FF0000);
					break;
				case 4:
					all[i][j] = new Ball(#52BE80);
					break;
				case 5:
					all[i][j] = new Ball(#FF5733);
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
