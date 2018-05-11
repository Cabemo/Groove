class SettingMenu
{
	PVector position;
	int volume;
	int size;
	SettingMenu()
	{
		// position
		position = new PVector(displayWidth/2, displayHeight/2);
		// volumen inicial de 0 a 100
		size = displayWidth/8; //100%
		volume = -8;
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