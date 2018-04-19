
//https://github.com/01010101/GifAnimation

class HelpMenu
{
	PVector position;
	float currentVolume;
	float size;
	

	HelpMenu()
	{
		// position
		position = new PVector(width/2, height/2);
		// volumen inicial de 0 a 100
		size = width/8; //100%
		currentVolume = size*.8; //80%
		
  
	}

	void display()
	{
		//position
		stroke(255);
		strokeWeight(4);
		noFill();
		ellipse(position.x, position.y, size, size);

		//volumen real
		noStroke();
		fill(255);
		ellipse(position.x, position.y, currentVolume, currentVolume);

		//
		currentVolume = map(mouseX, 0, width, 0, size);

		//constrain(currentVolume, 0, size);
	}

	void backbtn()
	{
		textSize(width/15);
		text("BACK", 10, width/15);
	}

	void gifs()
	{
		
	}

	float getVolume()
	{
		return currentVolume;
	}
}