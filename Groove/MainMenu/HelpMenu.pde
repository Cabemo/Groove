class HelpMenu
{
	PVector position;
  int volume;
	int size;
	Gif[] gifs;
	
	HelpMenu(Gif[] gifs)
	{
		// position
		position = new PVector(displayWidth/2, displayHeight/2);
		// volumen inicial de 0 a 100
		size = displayWidth/8; //100%
		volume = -8;

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
    
		ellipse(position.x, position.y, map(volume, -40, -8, 0, size), map(volume, -40, -8, 0, size));
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

	int getVolume()
	{
    if(volume > -8) volume = -8;
    else if(volume < -40) volume = -40;
		return volume;
	}
  void lowerVolume() {
    volume -= 1;
  }
  void increaseVolume() {
   volume += 1;
  }
}
