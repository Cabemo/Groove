class HelpMenu
{
	PVector position;
	float currentVolume;
	float size;
	Gif[] gifs;
	
	HelpMenu(Gif[] gifs)
	{
		// position
		position = new PVector(displayWidth/2, displayHeight/2);
		// volumen inicial de 0 a 100
		size = displayWidth/8; //100%
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
		currentVolume = map(mouseX, 0, displayWidth, 0, size);

		//constrain(currentVolume, 0, size);
	}

	void backbtn()
	{
		textAlign(CENTER);
    textFont(manbow);
    textSize(150);
    fill(255);
		text("Help", displayWidth/2, displayHeight/4);
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
