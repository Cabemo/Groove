class HelpMenu
{
	Gif[] gifs;

	HelpMenu(Gif[] gifs)
	{
		this.gifs = gifs;
		for(int i = 0; i < gifs.length; i++)
		{
			this.gifs[i].play();
		}
	}

	void gifs(int indice)
	{
		image(gifs[indice], width / 2, height / 2);
	}
	void gifs() {
		imageMode(CENTER);
		image(gifs[0], width / 4 - 100, 11 * height / 19, 600, 360);
		image(gifs[1], width / 2, 11 * height / 19, 600, 360);
		image(gifs[2], 3 * width / 4 + 100, 11 * height / 19, 600, 360);
	}
}
