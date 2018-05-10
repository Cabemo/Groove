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

	void gifs()
	{
		for(int i = 0; i < gifs.length; i++)
		{
			image(gifs[i], 0, 100);
		}
	}
}
