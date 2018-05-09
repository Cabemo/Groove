import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

class SistemaParticulas {
	Ball[][] sp;
  boolean[] seleccionados;
  int t;
  int noSeleccionados;
  float[] tiempo;
	float[][] posiciones;
	RutasPaquetes rutas;
	color[] colores = new color[clusters];
  Kinect kinect;
  
	SistemaParticulas(int size, Kinect kinect) {
		int numParticulas = 1500/size;
    seleccionados = new boolean[size];
    tiempo = new float[size];
		sp = new Ball[size][numParticulas];
		posiciones = new float[size][2];
    this.kinect = kinect; 
    noSeleccionados = 0;
    t = 0;
	}
	
	void move() {
		for(int i = 0; i < sp.length; i++)
		{
			for(Ball b: sp[i])
			{
				b.move();
				b.display();
			}
		}
	}

	void colorear() {
      int auxPaq;
      rutas = new RutasPaquetes();

      if(paquete == 0)
      {
        //parque
        //solo elige entre 95, 110 y 120
        auxPaq = (int)random(6);
        switch (auxPaq)
        {
          case 0:
            //01_95
            colores = rutas.parqueZeroOneNF();
          break;
          case 1:
            //01_110
            colores = rutas.parqueZeroOneT();
          break;
          case 2:
            //01_120
            colores = rutas.parqueZeroOneTw();
          break;
          case 3:
            //02_95
            colores = rutas.parqueZeroTwoNF();
          break;
          case 4:
            //02_110
            colores = rutas.parqueZeroTwoT();
          break;
          case 5:
            //02_120
            colores =  rutas.parqueZeroTwoTw();
          break;
        }
      }
      else if(paquete == 1)
      {
        //ciudad
        //95 y 130 unicamente
        auxPaq = (int)random(4);
        switch (auxPaq)
        {
          case 0:
            colores = rutas.ciudadZeroOneNF();
          break;
          case 1:
            colores = rutas.ciudadZeroTwoNF();
          break;
          case 2:
            colores = rutas.ciudadZeroOneTh();
          break;
          case 3:
            colores = rutas.ciudadZeroTwoTh();
          break;
        }
      }
      else
      {
        //espacio
        //110,120,130
        auxPaq = (int)random(6);
         switch (auxPaq)
        {
          case 0:
            colores = rutas.espacioZeroOneT();
          break;
          case 1:
            colores = rutas.espacioZeroOneTw();
          break;
          case 2:
            colores = rutas.espacioZeroOneTh();
          break;
          case 3:
            colores = rutas.espacioZeroTwoT();
          break;
          case 4:
            colores = rutas.espacioZeroTwoTw();
          break;
          case 5:
            colores = rutas.espacioZeroTwoTh();
          break;
        }
      }
    color c;
    println(sp.length);
		for(int i = 0; i < sp.length; i++) {
      if(i == 0) c = #FFFFFF;
			else c = colores[i];
			for(int j = 0; j < sp[0].length; j++) {
				sp[i][j] = new Ball(c);
			}
		}
	}

	void colorear(color c) {
		for(int i = 0; i < sp.length; i++) {
			for(int j = 0; j < sp[0].length; j++) {
				sp[i][j] = new Ball(c);
			}
		}
	}

	void generarPosiciones(int size) {
		float inc = TWO_PI/25.0, a = 0.0, value = 0.0;
		for(int i = 0; i < posiciones.length; i++) {
			for(int j = 0; j < 2; j++) {
				if(j == 0) {
					value = sin(a)+(i*width/size);
					posiciones[i][j] = map(value, 0,width,margenIzquierdo,margenDerecho);
					a += inc;
					inc = TWO_PI/random(1,100);
				}
				else if(j == 1) posiciones[i][j] = random(height*2/3)+floor((height/20));
			}
		}
	}
  void seleccionados() {
    PVector jugador = tracker.getPos();
    for(int i = 1; i < seleccionados.length; i++) {
      if(seleccionados[i]) {
        noSeleccionados++;
        fill(colores[i], 100);
        float size = noise(t);
        size = map(size, 0, 1, displayWidth/40, displayWidth/20);
        ellipse(posiciones[i][0], posiciones[i][1], size, size);
      }
      if(jugador.x >= posiciones[i][0] - (displayWidth/40) && jugador.x <= posiciones[i][0] + (displayWidth/40)) {
        if(jugador.y >= posiciones[i][1] - (displayWidth/40) && jugador.y <= posiciones[i][1] + (displayWidth/40)) {
          tiempo[i] += frameRate;
          fill(255);
          ellipse(100, 100, map(tiempo[i], 0, 1400, 0, 150), map(tiempo[i], 0, 1400, 0, 150));
          if(tiempo[i] >= 700 && tiempo[i] < 1400) {
            
                    players[i - 1].play();
                    beatDetectors[i - 1].forward(players[i - 1].mix);
                    float temp = 0;
                    for(int j = 0; j < beatDetectors[i - 1].specSize(); j++) temp += beatDetectors[i - 1].getBand(j);
                    temp /= beatDetectors[i - 1].specSize();
                    fuerzas[i] = temp;
              if(jugador.x >= posiciones[i][0] - (displayWidth/40) && jugador.x <= posiciones[i][0] + (displayWidth/40)) {
                if(jugador.y >= posiciones[i][1] - (displayWidth/40) && jugador.y <= posiciones[i][1] + (displayWidth/40)) {
                  tiempo[i] += frameRate;
                  noFill();
                stroke(255);
                strokeWeight(4);
                ellipse(100,100,150,150);
                }
              }
              else tiempo[i] = 0;
            }
            else if(tiempo[i] >= 1400) {
                players[i - 1].pause();
                tiempo[i] = 0;
                seleccionados[i] = !seleccionados[i];
            }
          }
        }
      else {
       if(!players[i - 1].isPlaying()) players[i - 1].rewind();
        tiempo[i] = 0;
      }
    }
  }

	void centroG(float mainX, float mainY) {
		int x = width/2;
		int y = 2*height/3;
		
		 for(int i = 0; i < sp.length; i++) {
			for(Ball b : sp[i]) {
					if(i == 0) {
						b.centroG(mainX, mainY, false);
					}
					else {
            if(seleccionados[i]) {
                  fill(255);
                  rect(x, height - width/40, width, height/12);
                  b.centroG(mainX, mainY, false);
            }
            else b.centroG(posiciones[i][0], posiciones[i][1], true); 
              }
            }
					}
			}
		}
