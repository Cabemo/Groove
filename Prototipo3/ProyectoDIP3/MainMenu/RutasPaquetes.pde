class RutasPaquetes
{
	int crazyNumber;
	//colores del parque
	color[] parquePiano110 = {
		#2256D8,#3185FC,#23C9FF,#7CC6FE};
	color[] parquePiano120 = {
		#000080,#0080FE,#78C0E0,#1C77C3};
	color[] parquePiano95 = {
		#81A4CD,#247BA0,#3E7CB1,#054A91};
	color[] parqueBeats95 = {
		#F8BDC4, #C46098, #DB2763, #A64253, #CA054D};
	color[] parqueBeats110 = {
		#FF4D80, #B91372, #830A48, #8B1E3F, #4A051C};
	color[] parqueBeats120 = {
		#E637BF, #F73B99, #B0228C, #BE3E82, #FF4D80};
	color[] parqueBeats295 = {
		#C46BAE, #E56399, #E85D75, #DF367C, #A53860};
	color[] parqueBeats2110 = {
		#FDCFF3, #F0A6CA, #FF84E8, #FC027F, #D81E5B};
	color[] parqueBeats2120 = {
		#E85D75, #E637BF, #FF4365, #CE2D4F, #880044};
	color[] parqueGuitarra = {
		#BDE4A8, #A1EF8B, #C7EA46, #8BB174, #447604};
	color[] parqueOrgano = {
		#F3D34A, #F2E600, #FCCA46, #FCE14B, #FFD300};
	color[] parqueBass = {
		#C179B9, #A42CD6, #502274, #420039, #330036};

	//colores galaxia
	color[] galaxiaPiano1 = {
		#FFD25A, #FFF05A, #FFE548, #E9B44C, #FFB20F};
	color[] galaxiaPiano2 = {
		#EDF060, #F4FF52, #FCFC62, #FFFD77, #DEA54B};
	color[] galaxiaBeats130 = {
		#149911, #3E8914, #38A700, #069E2D, #1B512D};
	color[] galaxiaBeats1102 = {
		#9EE37D, #00A86B, #008148, #034732, #355834};
	color[] galaxiaBeats1202 = {
		#C3EB78, #C2F970, #1EFC1E, #3BB143, #40531B};
	color[] galaxiaGuitarra = {
		#972D07, #BF0603, #9E2B25, #8D0801, #570000};
	color[] galaxiaOrgano = {
		#FC9E4F, #FF8700, #FF6027, #FF4F00, #D8561E};
	color[] galaxiaBass = {
		#E5A7D8, #DB7DAA, #D644A5, #FC027F, #D81E5B};

	//colores ciudad
	color[] ciudadPiano952 = {
		#BF7FBF, #B300B3, #8C198C, #680068, #4D004D};
	color[] ciudadPiano1302 = {
		#D6B3E5, #CC99CC, #A64CA6, #993299, #730073};
	color[] ciudadBeats952 = {
		#F2F2F2, #D8D8D8, #999999, #777777, #404040};
	color[] ciudadBeats1302 = {
		#D6D2D2, #9CA5A4, #636363, #59656F, #39393A};
	color[] ciudadBeats130 = {
		#CCCCCC, #A6A6A6, #666666, #808080, #797C7F};
	color[] ciudadGuitarra = {
		#F3A712, #FF9505, #FF8300, #E26D00, #E24F00};
	color[] ciudadOrgano = {
		#FCC2D5, #F79BBB, #F76F9E, #E91E63, #AD1457};
	color[] ciudadBass = {
		#FCDC74, #F2E600, #F2CA1A, #FFD300, #E8C500};

	String[] paq0195 =
	{
		"data/paquete01_95/Bass-1.mp3",
		"data/paquete01_95/Bass-2.mp3",
		"data/paquete01_95/Beat-1.mp3",
		"data/paquete01_95/Beat-2.mp3",
		"data/paquete01_95/Beat-3.mp3",
		"data/paquete01_95/Beat-4.mp3",
		"data/paquete01_95/Beat-5.mp3",
		"data/paquete01_95/Beat-6.mp3",
		"data/paquete01_95/Beat-7.mp3",
		"data/paquete01_95/Beat-8.mp3",
		"data/paquete01_95/Beat-9.mp3",
		"data/paquete01_95/Guitar-1.mp3",
		"data/paquete01_95/Guitar-2.mp3",
		"data/paquete01_95/Organ-1.mp3",
		"data/paquete01_95/Organ-2.mp3",
		"data/paquete01_95/Piano-1.mp3",
		"data/paquete01_95/Piano-2.mp3",
		"data/paquete01_95/Piano-3.mp3",
		"data/paquete01_95/Piano-4.mp3",
	};

	String[] paq01110 =
	{
		"data/paquete01_110/Bass-110D-01.mp3",
		"data/paquete01_110/Beat1.mp3",
		"data/paquete01_110/Beat-9.mp3",
		"data/paquete01_110/BeatC110-06.mp3",
		"data/paquete01_110/EPiano110G-01.mp3",
		"data/paquete01_110/Organ-01.mp3",
		"data/paquete01_110/Piano-02.mp3",
		"data/paquete01_110/Bass-110G-01.mp3",
		"data/paquete01_110/Beat-6.mp3",
		"data/paquete01_110/Beat9.mp3",
		"data/paquete01_110/BeatC110-09.mp3",
		"data/paquete01_110/Guitar110D-01.mp3",
		"data/paquete01_110/Organ-02.mp3",
		"data/paquete01_110/Beat-1.mp3",
		"data/paquete01_110/Beat6.mp3",
		"data/paquete01_110/BeatC110-01.mp3",
		"data/paquete01_110/EPiano110D-01.mp3",
		"data/paquete01_110/Guitar110G-01.mp3",
		"data/paquete01_110/Piano-01.mp3"
	};

	String[] paq01120 =
	{
		"data/paquete01_120/JC_Bass-120A-01.mp3",
		"data/paquete01_120/JC_Bass-120G-01.mp3",
		"data/paquete01_120/JC_BeatA120-01.mp3",
		"data/paquete01_120/JC_BeatA120-03.mp3",
		"data/paquete01_120/JC_BeatA120-05.mp3",
		"data/paquete01_120/JC_BeatB120-01.mp3",
		"data/paquete01_120/JC_BeatB120-03.mp3",
		"data/paquete01_120/JC_BeatB120-05.mp3",
		"data/paquete01_120/JC_BeatC120-01.mp3",
		"data/paquete01_120/JC_BeatC120-03.mp3",
		"data/paquete01_120/JC_BeatC120-05.mp3",
		"data/paquete01_120/JC_EPiano120D-01.mp3",
		"data/paquete01_120/JC_EPiano120G-01.mp3",
		"data/paquete01_120/JC_Guitar120A-01.mp3",
		"data/paquete01_120/JC_Guitar120D-02.mp3",
		"data/paquete01_120/JC_Organ-120D-01.mp3",
		"data/paquete01_120/JC_Organ-120G-01.mp3",
		"data/paquete01_120/JC_Piano-120D-01.mp3",
		"data/paquete01_120/JC_Piano-120G-01.mp3"
	};

	String[] paq0295 =
	{
		"data/paquete02_95/JC_Bass95A-02.mp3",
		"data/paquete02_95/JC_Bass95C-02.mp3",
		"data/paquete02_95/JC_BeatA95-02.mp3",
		"data/paquete02_95/JC_BeatA95-04.mp3",
		"data/paquete02_95/JC_BeatA95-06.mp3",
		"data/paquete02_95/JC_BeatB95-02.mp3",
		"data/paquete02_95/JC_BeatB95-04.mp3",
		"data/paquete02_95/JC_BeatB95-06.mp3",
		"data/paquete02_95/JC_BeatC95-02.mp3",
		"data/paquete02_95/JC_BeatC95-04.mp3",
		"data/paquete02_95/JC_BeatC95-06.mp3",
		"data/paquete02_95/JC_EPiano95A-02.mp3",
		"data/paquete02_95/JC_EPiano95C-02.mp3",
		"data/paquete02_95/JC_Guitar95A-02.mp3",
		"data/paquete02_95/JC_Guitar95C-02.mp3",
		"data/paquete02_95/JC_Organ95A-02.mp3",
		"data/paquete02_95/JC_Organ95C-02.mp3",
		"data/paquete02_95/JC_Piano95A-02.mp3",
		"data/paquete02_95/JC_Piano95C-02.mp3"
	};

	String[] paq02110 =
	{
		"data/paquete02_110/JC_Bass-110D-02.mp3",
		"data/paquete02_110/JC_Bass-110G-02.mp3",
		"data/paquete02_110/JC_BeatA110-02.mp3",
		"data/paquete02_110/JC_BeatA110-04.mp3",
		"data/paquete02_110/JC_BeatA110-07.mp3",
		"data/paquete02_110/JC_BeatB110-02.mp3",
		"data/paquete02_110/JC_BeatB110-04.mp3",
		"data/paquete02_110/JC_BeatB110-07.mp3",
		"data/paquete02_110/JC_BeatC110-02.mp3",
		"data/paquete02_110/JC_BeatC110-04.mp3",
		"data/paquete02_110/JC_BeatC110-07.mp3",
		"data/paquete02_110/JC_EPiano110D-02.mp3",
		"data/paquete02_110/JC_EPiano110G-02.mp3",
		"data/paquete02_110/JC_Guitar110D-02.mp3",
		"data/paquete02_110/JC_Guitar110G-02.mp3",
		"data/paquete02_110/JC_Organ-110G-01.mp3",
		"data/paquete02_110/JC_Organ-110G-02.mp3",
		"data/paquete02_110/JC_Piano-110G-01.mp3",
		"data/paquete02_110/JC_Piano-110G-02.mp3"
	};

	String[] paq02120 =
	{
		"data/paquete02_120/JC_Bass-120D-02.mp3",
		"data/paquete02_120/JC_Bass-120G-02.mp3",
		"data/paquete02_120/JC_BeatA120-02.mp3",
		"data/paquete02_120/JC_BeatA120-04.mp3",
		"data/paquete02_120/JC_BeatA120-06.mp3",
		"data/paquete02_120/JC_BeatB120-02.mp3",
		"data/paquete02_120/JC_BeatB120-04.mp3",
		"data/paquete02_120/JC_BeatB120-06.mp3",
		"data/paquete02_120/JC_BeatC120-02.mp3",
		"data/paquete02_120/JC_BeatC120-04.mp3",
		"data/paquete02_120/JC_BeatC120-06.mp3",
		"data/paquete02_120/JC_EPiano120D-02.mp3",
		"data/paquete02_120/JC_EPiano120G-02.mp3",
		"data/paquete02_120/JC_Guitar120G-01.mp3",
		"data/paquete02_120/JC_Guitar120G-02.mp3",
		"data/paquete02_120/JC_Organ-120D-02.mp3",
		"data/paquete02_120/JC_Organ-120G-02.mp3",
		"data/paquete02_120/JC_Piano-120D-02.mp3",
		"data/paquete02_120/JC_Piano-120G-02.mp3"
	};

	String[] paq01130 =
	{
		"data/paquete01_130/JC_Bass-130A-01.mp3",
		"data/paquete01_130/JC_Bass-130C-01.mp3",
		"data/paquete01_130/JC_BeatA130-01.mp3",
		"data/paquete01_130/JC_BeatA130-05.mp3",
		"data/paquete01_130/JC_BeatA130-06.mp3",
		"data/paquete01_130/JC_BeatB130-01.mp3",
		"data/paquete01_130/JC_BeatB130-05.mp3",
		"data/paquete01_130/JC_BeatB130-06.mp3",
		"data/paquete01_130/JC_BeatC130-01.mp3",
		"data/paquete01_130/JC_BeatC130-05.mp3",
		"data/paquete01_130/JC_BeatC130-06.mp3",
		"data/paquete01_130/JC_EPiano130A-01.mp3",
		"data/paquete01_130/JC_EPiano130C-01.mp3",
		"data/paquete01_130/JC_EPiano130C-02.mp3",
		"data/paquete01_130/JC_Guitar130A-01.mp3",
		"data/paquete01_130/JC_Guitar130C-01.mp3",
		"data/paquete01_130/JC_Organ-130A-01.mp3",
		"data/paquete01_130/JC_Organ-130A-02.mp3",
		"data/paquete01_130/JC_Piano-130C-01.mp3"
	};

	String[] paq02130 =
	{
		"data/paquete02_130/JC_Bass-130A-02.mp3",
		"data/paquete02_130/JC_Bass-130C-02.mp3",
		"data/paquete02_130/JC_BeatA130-02.mp3",
		"data/paquete02_130/JC_BeatA130-04.mp3",
		"data/paquete02_130/JC_BeatA130-07.mp3",
		"data/paquete02_130/JC_BeatB130-02.mp3",
		"data/paquete02_130/JC_BeatB130-04.mp3",
		"data/paquete02_130/JC_BeatB130-07.mp3",
		"data/paquete02_130/JC_BeatC130-02.mp3",
		"data/paquete02_130/JC_BeatC130-04.mp3",
		"data/paquete02_130/JC_BeatC130-07.mp3",
		"data/paquete02_130/JC_EPiano130A-02.mp3",
		"data/paquete02_130/JC_Guitar130A-02.mp3",
		"data/paquete02_130/JC_Guitar130C-02.mp3",
		"data/paquete02_130/JC_Organ-130C-01.mp3",
		"data/paquete02_130/JC_Organ-130C-02.mp3",
		"data/paquete02_130/JC_Piano-130A-01.mp3",
		"data/paquete02_130/JC_Piano-130A-02.mp3",
		"data/paquete02_130/JC_Piano-130C-02.mp3"
	};

	color[] parqueZeroOneNF()
	{
		//01_95 - Parque
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq0195[i];

			if(paq0195[i].contains("Piano"))
			{
				crazyNumber = (int)random(parquePiano95.length);
				cc[i + 1] = parquePiano95[crazyNumber];
			}
			else if(paq0195[i].contains("Guitar"))
			{
				crazyNumber = (int)random(parqueGuitarra.length);
				cc[i + 1] = parqueGuitarra[crazyNumber];
			}
			else if(paq0195[i].contains("Organ"))
			{
				crazyNumber = (int)random(parqueOrgano.length);
				cc[i + 1] = parqueOrgano[crazyNumber];
			}
			else if(paq0195[i].contains("Bass"))
			{
				crazyNumber = (int)random(parqueBass.length);
				cc[i + 1] = parqueBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(parqueBeats95.length);
				cc[i + 1] = parqueBeats95[crazyNumber];
			}
		}
		return cc;
	}

	color[] parqueZeroOneT()
	{
		//01_110 - Parque
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq01110[i];

			if(paq01110[i].contains("Piano"))
			{
				crazyNumber = (int)random(parquePiano110.length);
				ccc[i + 1] = parquePiano110[crazyNumber];
			}
			else if(paq01110[i].contains("Guitar"))
			{
				crazyNumber = (int)random(parqueGuitarra.length);
				cc[i + 1] = parqueGuitarra[crazyNumber];
			}
			else if(paq01110[i].contains("Organ"))
			{
				crazyNumber = (int)random(parqueOrgano.length);
				cc[i + 1] = parqueOrgano[crazyNumber];
			}
			else if(paq01110[i].contains("Bass"))
			{
				crazyNumber = (int)random(parqueBass.length);
				cc[i + 1] = parqueBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(parqueBeats110.length);
				cc[i + 1] = parqueBeats110[crazyNumber];
			}
		}
		return cc;
	}

	color[] parqueZeroOneTw()
	{
		//01_120 - Parque
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq01120[i];

			if(paq01120[i].contains("Piano"))
			{
				crazyNumber = (int)random(parquePiano120.length);
				cc[i + 1] = parquePiano120[crazyNumber];
			}
			else if(paq01120[i].contains("Guitar"))
			{
				crazyNumber = (int)random(parqueGuitarra.length);
				cc[i + 1] = parqueGuitarra[crazyNumber];
			}
			else if(paq01120[i].contains("Organ"))
			{
				crazyNumber = (int)random(parqueOrgano.length);
				cc[i + 1] = parqueOrgano[crazyNumber];
			}
			else if(paq01120[i].contains("Bass"))
			{
				crazyNumber = (int)random(parqueBass.length);
				cc[i + 1] = parqueBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(parqueBeats120.length);
				cc[i + 1] = parqueBeats120[crazyNumber];
			}
		}
		return cc;
	}

	color[] parqueZeroTwoNF()
	{
		//02_95 - Parque
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq0295[i];

			if(paq0295[i].contains("Piano"))
			{
				crazyNumber = (int)random(parquePiano95.length);
				cc[i + 1] = parquePiano95[crazyNumber];
			}
			else if(paq0295[i].contains("Guitar"))
			{
				crazyNumber = (int)random(parqueGuitarra.length);
				cc[i + 1] = parqueGuitarra[crazyNumber];
			}
			else if(paq0295[i].contains("Organ"))
			{
				crazyNumber = (int)random(parqueOrgano.length);
				cc[i + 1] = parqueOrgano[crazyNumber];
			}
			else if(paq0295[i].contains("Bass"))
			{
				crazyNumber = (int)random(parqueBass.length);
				cc[i + 1] = parqueBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(parqueBeats295.length);
				cc[i + 1] = parqueBeats295[crazyNumber];
			}
		}
		return cc;
	}

	color[] parqueZeroTwoT()
	{
		//02_110 - Parque
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq02110[i];

			if(paq02110[i].contains("Piano"))
			{
				crazyNumber = (int)random(parquePiano95.length);
				cc[i + 1] = parquePiano95[crazyNumber];
			}
			else if(paq02110[i].contains("Guitar"))
			{
				crazyNumber = (int)random(parqueGuitarra.length);
				cc[i + 1] = parqueGuitarra[crazyNumber];
			}
			else if(paq02110[i].contains("Organ"))
			{
				crazyNumber = (int)random(parqueOrgano.length);
				cc[i + 1] = parqueOrgano[crazyNumber];
			}
			else if(paq02110[i].contains("Bass"))
			{
				crazyNumber = (int)random(parqueBass.length);
				cc[i + 1] = parqueBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(parqueBeats2110.length);
				cc[i + 1] = parqueBeats2110[crazyNumber];
			}
		}
		return cc;
	}

	color[] parqueZeroTwoTw()
	{
		//02_120 - Parque
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq02120[i];

			if(paq02120[i].contains("Piano"))
			{
				crazyNumber = (int)random(parquePiano95.length);
				cc[i + 1] = parquePiano95[crazyNumber];
			}
			else if(paq02120[i].contains("Guitar"))
			{
				crazyNumber = (int)random(parqueGuitarra.length);
				cc[i + 1] = parqueGuitarra[crazyNumber];
			}
			else if(paq02120[i].contains("Organ"))
			{
				crazyNumber = (int)random(parqueOrgano.length);
				cc[i + 1] = parqueOrgano[crazyNumber];
			}
			else if(paq02120[i].contains("Bass"))
			{
				crazyNumber = (int)random(parqueBass.length);
				cc[i + 1] = parqueBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(parqueBeats2120.length);
				cc[i + 1] = parqueBeats2120[crazyNumber];
			}
		}
		return cc;
	}

	color[] ciudadZeroOneNF()
	{
		//01_95 - Ciudad
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq0195[i];

			if(paq0195[i].contains("Piano"))
			{
				crazyNumber = (int)random(ciudadPiano952.length);
				cc[i + 1] = ciudadPiano952[crazyNumber];
			}
			else if(paq0195[i].contains("Guitar"))
			{
				crazyNumber = (int)random(ciudadGuitarra.length);
				cc[i + 1] = ciudadGuitarra[crazyNumber];
			}
			else if(paq0195[i].contains("Organ"))
			{
				crazyNumber = (int)random(ciudadOrgano.length);
				cc[i + 1] = ciudadOrgano[crazyNumber];
			}
			else if(paq0195[i].contains("Bass"))
			{
				crazyNumber = (int)random(ciudadBass.length);
				cc[i + 1] = ciudadBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(ciudadBeats952.length);
				cc[i + 1] = ciudadBeats952[crazyNumber];
			}
		}
		return cc;
	}

	color[] ciudadZeroTwoNF()
	{
		//02_95 - Ciudad
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq0295[i];

			if(paq0295[i].contains("Piano"))
			{
				crazyNumber = (int)random(ciudadPiano952.length);
				cc[i + 1] = ciudadPiano952[crazyNumber];
			}
			else if(paq0295[i].contains("Guitar"))
			{
				crazyNumber = (int)random(ciudadGuitarra.length);
				cc[i + 1] = ciudadGuitarra[crazyNumber];
			}
			else if(paq0295[i].contains("Organ"))
			{
				crazyNumber = (int)random(ciudadOrgano.length);
				cc[i + 1] = ciudadOrgano[crazyNumber];
			}
			else if(paq0295[i].contains("Bass"))
			{
				crazyNumber = (int)random(ciudadBass.length);
				cc[i + 1] = ciudadBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(ciudadBeats952.length);
				cc[i + 1] = ciudadBeats952[crazyNumber];
			}
		}
		return cc;
	}

	color[] ciudadZeroOneTh()
	{
		//01_130 - Ciudad
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq01130[i];

			if(paq01130[i].contains("Piano"))
			{
				crazyNumber = (int)random(ciudadPiano1302.length);
				cc[i + 1] = ciudadPiano1302[crazyNumber];
			}
			else if(paq01130[i].contains("Guitar"))
			{
				crazyNumber = (int)random(ciudadGuitarra.length);
				cc[i + 1] = ciudadGuitarra[crazyNumber];
			}
			else if(paq01130[i].contains("Organ"))
			{
				crazyNumber = (int)random(ciudadOrgano.length);
				cc[i + 1] = ciudadOrgano[crazyNumber];
			}
			else if(paq01130[i].contains("Bass"))
			{
				crazyNumber = (int)random(ciudadBass.length);
				cc[i + 1] = ciudadBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(ciudadBeats1302.length);
				cc[i + 1] = ciudadBeats1302[crazyNumber];
			}
		}
		return cc;
	}

	color[] ciudadZeroTwoTh()
	{
		//02_130 - Ciudad
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq02130[i];

			if(paq02130[i].contains("Piano"))
			{
				crazyNumber = (int)random(ciudadPiano1302.length);
				cc[i + 1] = ciudadPiano1302[crazyNumber];
			}
			else if(paq02130[i].contains("Guitar"))
			{
				crazyNumber = (int)random(ciudadGuitarra.length);
				cc[i + 1] = ciudadGuitarra[crazyNumber];
			}
			else if(paq02130[i].contains("Organ"))
			{
				crazyNumber = (int)random(ciudadOrgano.length);
				cc[i + 1] = ciudadOrgano[crazyNumber];
			}
			else if(paq02130[i].contains("Bass"))
			{
				crazyNumber = (int)random(ciudadBass.length);
				cc[i + 1] = ciudadBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(ciudadBeats130.length);
				cc[i + 1] = ciudadBeats130[crazyNumber];
			}
		}
		return cc;
	}

	color[] espacioZeroOneT()
	{
		//01_110 - espacio
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq01110[i];

			if(paq01110[i].contains("Piano"))
			{
				crazyNumber = (int)random(galaxiaPiano1.length);
				cc[i + 1] = galaxiaPiano1[crazyNumber];
			}
			else if(paq01110[i].contains("Guitar"))
			{
				crazyNumber = (int)random(galaxiaGuitarra.length);
				cc[i + 1] = galaxiaGuitarra[crazyNumber];
			}
			else if(paq01110[i].contains("Organ"))
			{
				crazyNumber = (int)random(galaxiaOrgano.length);
				cc[i + 1] = galaxiaOrgano[crazyNumber];
			}
			else if(paq01110[i].contains("Bass"))
			{
				crazyNumber = (int)random(galaxiaBass.length);
				cc[i + 1] = galaxiaBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(galaxiaBeats1102.length);
				cc[i + 1] = galaxiaBeats1102[crazyNumber];
			}
		}
		return cc;
	}

	color[] espacioZeroOneTw()
	{
		//01_120 - espacio
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq01120[i];

			if(paq01120[i].contains("Piano"))
			{
				crazyNumber = (int)random(galaxiaPiano1.length);
				cc[i + 1] = galaxiaPiano1[crazyNumber];
			}
			else if(paq01120[i].contains("Guitar"))
			{
				crazyNumber = (int)random(galaxiaGuitarra.length);
				cc[i + 1] = galaxiaGuitarra[crazyNumber];
			}
			else if(paq01120[i].contains("Organ"))
			{
				crazyNumber = (int)random(galaxiaOrgano.length);
				cc[i + 1] = galaxiaOrgano[crazyNumber];
			}
			else if(paq01120[i].contains("Bass"))
			{
				crazyNumber = (int)random(galaxiaBass.length);
				cc[i + 1] = galaxiaBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(galaxiaBeats1202.length);
				cc[i + 1] = galaxiaBeats1202[crazyNumber];
			}
		}
		return cc;
	}

	color[] espacioZeroOneTh()
	{
		//01_130 - espacio
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq01130[i];

			if(paq01130[i].contains("Piano"))
			{
				crazyNumber = (int)random(galaxiaPiano1.length);
				cc[i + 1] = galaxiaPiano1[crazyNumber];
			}
			else if(paq01130[i].contains("Guitar"))
			{
				crazyNumber = (int)random(galaxiaGuitarra.length);
				cc[i + 1] = galaxiaGuitarra[crazyNumber];
			}
			else if(paq01130[i].contains("Organ"))
			{
				crazyNumber = (int)random(galaxiaOrgano.length);
				cc[i + 1] = galaxiaOrgano[crazyNumber];
			}
			else if(paq01130[i].contains("Bass"))
			{
				crazyNumber = (int)random(galaxiaBass.length);
				cc[i + 1] = galaxiaBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(galaxiaBeats130.length);
				cc[i + 1] = galaxiaBeats130[crazyNumber];
			}
		}
		return cc;
	}

	color[] espacioZeroTwoT()
	{
		//02_110 - espacio
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq02110[i];

			if(paq02110[i].contains("Piano"))
			{
				crazyNumber = (int)random(galaxiaPiano2.length);
				cc[i + 1] = galaxiaPiano2[crazyNumber];
			}
			else if(paq02110[i].contains("Guitar"))
			{
				crazyNumber = (int)random(galaxiaGuitarra.length);
				cc[i + 1] = galaxiaGuitarra[crazyNumber];
			}
			else if(paq02110[i].contains("Organ"))
			{
				crazyNumber = (int)random(galaxiaOrgano.length);
				cc[i + 1] = galaxiaOrgano[crazyNumber];
			}
			else if(paq02110[i].contains("Bass"))
			{
				crazyNumber = (int)random(galaxiaBass.length);
				cc[i + 1] = galaxiaBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(galaxiaBeats1102.length);
				cc[i + 1] = galaxiaBeats1102[crazyNumber];
			}
		}
		return cc;
	}

	color[] espacioZeroTwoTw()
	{
		//02_120 - espacio
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq02120[i];

			if(paq02120[i].contains("Piano"))
			{
				crazyNumber = (int)random(galaxiaPiano2.length);
				cc[i + 1] = galaxiaPiano2[crazyNumber];
			}
			else if(paq02120[i].contains("Guitar"))
			{
				crazyNumber = (int)random(galaxiaGuitarra.length);
				cc[i + 1] = galaxiaGuitarra[crazyNumber];
			}
			else if(paq02120[i].contains("Organ"))
			{
				crazyNumber = (int)random(galaxiaOrgano.length);
				cc[i + 1] = galaxiaOrgano[crazyNumber];
			}
			else if(paq02120[i].contains("Bass"))
			{
				crazyNumber = (int)random(galaxiaBass.length);
				cc[i + 1] = galaxiaBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(galaxiaBeats1202.length);
				cc[i + 1] = galaxiaBeats1202[crazyNumber];
			}
		}
		return cc;
	}

	color[] espacioZeroTwoTh()
	{
		//02_130 - espacio
		color[] cc = new color[clusters];
		cc[0] = color(255);
		for(int i = 0; i < 19; i++)
		{
			rutaPaquetes[i] = paq02130[i];

			if(paq02130[i].contains("Piano"))
			{
				crazyNumber = (int)random(galaxiaPiano2.length);
				cc[i + 1] = galaxiaPiano2[crazyNumber];
			}
			else if(paq02130[i].contains("Guitar"))
			{
				crazyNumber = (int)random(galaxiaGuitarra.length);
				cc[i + 1] = galaxiaGuitarra[crazyNumber];
			}
			else if(paq02130[i].contains("Organ"))
			{
				crazyNumber = (int)random(galaxiaOrgano.length);
				cc[i + 1] = galaxiaOrgano[crazyNumber];
			}
			else if(paq02130[i].contains("Bass"))
			{
				crazyNumber = (int)random(galaxiaBass.length);
				cc[i + 1] = galaxiaBass[crazyNumber];
			}
			else{
				//beats
				crazyNumber = (int)random(galaxiaBeats130.length);
				cc[i + 1] = galaxiaBeats130[crazyNumber];
			}
		}
		return cc;
	}
}
