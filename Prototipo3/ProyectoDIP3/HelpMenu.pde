class HelpMenu
{
	PVector position;
	float currentVolume;
	float size;
	Gif[] gifs;
	
	HelpMenu(Gif[] gifs)
	{
		// position
		position = new PVector(width/2, height/2);
		// volumen inicial de 0 a 100
		size = width/8; //100%
		currentVolume = size*.8; //80%

		this.gifs = gifs;
		for(int i = 0; i < gifs.length; i++)
		{
			this.gifs[i].play();
		}

	}

	void volumen()
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
		text("GROOVE", 10, width/15);
	}

	void gifs()
	{
		for(int i = 0; i < gifs.length; i++)
		{
			image(gifs[i], 0, 100);
		}
	}

	float getVolume()
	{
		return currentVolume;
	}
}