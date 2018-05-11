//LIBRERIAS
import ddf.minim.*;
import ddf.minim.analysis.*;
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
import gifAnimation.*;

//FUNCIONAMIENTO
String[] rutaPaquetes;//-------------------------------------------------------- Contiene rutas de los contenidos de cada paquete (colores y música)
SistemaParticulas p1, o;//------------------------------------------------------ Sistemas de particulas de inicio y de juego
Kinect kinect;//---------------------------------------------------------------- Objeto kinect (utiliza openkinect)
KinectTracker tracker;//-------------------------------------------------------- Rastreador de kinect
int limInferior, limSuperior;//------------------------------------------------- Límites de tiempo (manejados en unidades de frameRate)
PVector jugador;//-------------------------------------------------------------- Objeto que contendra la ubicación del jugador
float tiempo;//----------------------------------------------------------------- Variable para medir variación de timpo en unidades de frameRate (59/60 frames por segundo)
SettingMenu s;//---------------------------------------------------------------- Objeto de menu para cambio de volúmen
HelpMenu h;//------------------------------------------------------------------- Objeto de menú para ayuda y tutoriales

//GENERAL
int stage;//-------------------------------------------------------------------- Contiene el índice de la pantalla en la que se encuentra
int paquete;//------------------------------------------------------------------ Contiene el paquete que será utilizado (fondo, instrumentos, colores)
boolean centered;//------------------------------------------------------------- Informa si la pantalla se encuentra centrada para centrarla si no es así

//ESTILO
Boton atras, start, help, play, minus, plus, settings, yes, no, ok;//--------------- Botones
Gif[] gifs = new Gif[3];//------------------------------------------------------ Gifs de tutorial
PImage startScreen;//----------------------------------------------------------- Contiene imagen de inicio
PFont baron, manbow;//---------------------------------------------------------- Estilos de texto para título y botones
float margenDerecho;//---------------------------------------------------------- Describe el limite a la derecha
float margenIzquierdo;//-------------------------------------------------------- Describe el limite a la izquierda
int clusters = 20;//------------------------------------------------------------ El número de partículas que se va a utilizar (19 instrumentos y el rastreador(objeto tracker)
PImage b;//--------------------------------------------------------------------- Contendrá la imagen de fondo que se utilizará dependiendo el paquete
String[] backgrounds = {//------------------------------------------------------ Direcciones de fondos
    "data/parque.png",
    "data/ciudad.png",
    "data/espacio.png"
};

//MUSICA
AudioPlayer[] players;//-------------------------------------------------------- Para reproducir sonidos de las particulas
FFT[] beatDetectors;//---------------------------------------------------------- Para analizar el beat
AudioPlayer song;//------------------------------------------------------------- Contiene la canción de stage 1 (pantalla de inicio)
float[] fuerzas;//-------------------------------------------------------------- Contiene las variaciones de fuerza de aceleración de las partículas
Minim minim;//------------------------------------------------------------------ Contiene funcionalidades para players


void settings() {
    size(displayWidth, displayHeight); //necesario para kinect no cambiar!
}

void setup() {
    //ESTILO
    startScreen = loadImage("data/start.png");
    image(startScreen, 0, 0, displayWidth, displayHeight);
    baron = createFont("Baron Neue.ttf", 1);
    manbow = createFont("manbow tone.ttf", 1);
    margenDerecho = floor((width - width / 10));
    margenIzquierdo = floor((width / 10));
    start = new Boton(displayWidth / 4, 11 * displayHeight / 19, 180, 80, "START", 25, baron);
    yes = new Boton(displayWidth / 4, 11 * displayHeight / 19, 180, 80, "Yes", 25, baron);
    no = new Boton(3 * displayWidth / 4, 11 * displayHeight / 19, 180, 80, "No", 25, baron);
    ok = new Boton(displayWidth / 2, displayHeight / 2, 180, 80, "Ok", 25, baron);
    settings = new Boton(displayWidth / 2, 11 * displayHeight / 19, 180, 80, "SETTINGS", 25, baron);
    help = new Boton(3 * displayWidth / 4, 11 * displayHeight / 19, 180, 80, "HELP", 25, baron);
    atras = new Boton(displayWidth - 200, 50, 90, 45, "BACK", 20, baron);
    play = new Boton(displayWidth - 300, 50, 90, 45, "PLAY", 20, baron);
    minus = new Boton(displayWidth / 2 - 300, height / 2, 80, 80, "-", 40, baron);
    plus = new Boton(displayWidth / 2 + 300, height / 2, 80, 80, "+", 40, baron);
     for (int i = 0; i < gifs.length; i++) {
         gifs[i] = new Gif(this, "helpImages/" + (i + 1) + ".gif");
     }

    //FUNCIONAMIENTO
    rutaPaquetes = new String[19];
    kinect = new Kinect(this);
    tracker = new KinectTracker(kinect);
    p1 = new SistemaParticulas(clusters, kinect);
    p1.colorear();
    p1.generarPosiciones(clusters);
    o = new SistemaParticulas(1, kinect);
    o.colorear(255);
    jugador = new PVector(0, 0);
    limInferior = 2000;
    limSuperior = 4000;
    tiempo = 0;
    s = new SettingMenu();
    h = new HelpMenu(gifs);

    //GENERAL
    stage = 4;
    paquete = (int) random(3);
    centered = false;

    //MUSICA
    minim = new Minim(this);
    fuerzas = new float[clusters];
    fuerzas[fuerzas.length - 1] = 0.9;
    song = minim.loadFile("Soulful.mp3");
    beatDetectors = new FFT[clusters - 1];
    players = new AudioPlayer[clusters - 1];
    for (int i = 0; i < players.length; i++) {
        fuerzas[i] = 0.9;
        players[i] = minim.loadFile(rutaPaquetes[i], 2048);
        beatDetectors[i] = new FFT(players[i].bufferSize(), players[i].sampleRate());
    }
}

void draw() {
    jugador = tracker.getPos();
    centerWindow();
    if (stage == 1) {//--------------------------------------------------------- Pantalla de inicio
        image(startScreen, 0, 0);
        title("GR     OVE");
        song.play();
        o.centroG(displayWidth / 2 - 50, displayHeight / 4 - 50);
        start.display(jugador);
        settings.display(jugador);
        help.display(jugador);
        if(tutorial) h.gif(0);
        o.move();
    } else if (stage == 2) {//-------------------------------------------------- Pantalla de settings
        background(0);
        title("SETTINGS");
        atras.display(jugador);
        minus.display(jugador);
        plus.display(jugador);
        s.volumen();
    } else if (stage == 3) {//-------------------------------------------------- Pantalla de juego
        image(b, 0, 0);
        song.pause();
        atras.display(jugador);
        play.display(jugador);
        p1.seleccionados();
        p1.centroG(jugador.x, jugador.y);
        p1.move();
    } else if (stage == 4) {
        background(0);
        title("Tutorial");
        yes.display(jugador);
        no.display(jugador);
      }
    tracker.track();
    stepBack();
    mouseClick(jugador);
}
/*****************CONTROL DE APAGADO DE SENSOR INFRARROJO KINECT***************/
void dispose() {
    kinect.stopDepth();
}
/********************CONTROL DE CENTRADO DE VENTANA****************************/
void centerWindow() {
    if (frame != null && centered == false) {
        frame.setLocation(displayWidth / 2 - width / 2, displayHeight / 2 - height / 3);
        centered = true;
    }
}
/********************CONTROL DE POSICIONAMIENTO DE JUGADOR*********************/
void stepBack() {
    if (tracker.getCount() > 30000) {
        tracker.loc = new PVector(0, 0);
        background(255, map(tracker.getCount(), 30000, 100000, 255, 0));
        fill(0);
        textAlign(CENTER);
        textFont(baron);
        textSize(150);
        text("Step back!", width / 2, height / 2);

    }
}
/*******************************CREA TITULO************************************/
void title(String title) {
    textAlign(CENTER);
    textFont(manbow);
    textSize(150);
    fill(255);
    text(title, displayWidth / 2, displayHeight / 4);
}
/********************CONTROL DE POSICIONAMIENTO DE RASTREADOR*****************/
void mouseClick(PVector jugador) {
    float tamano = map(tiempo, 0, limInferior, 0, 75);
    stroke(255);
    noFill();
    strokeWeight(4);
    ellipse(100, 100, 75, 75);
    fill(255);
    noStroke();
    ellipse(100, 100, tamano, tamano);
    if (stage == 1) {
        if(tutorial) {

        } else {

            tiempo += frameRate;
            if (tiempo >= limInferior) {
                b = loadImage(backgrounds[paquete]);
                b.resize(displayWidth, displayHeight);
                tiempo = limInferior;
                stage = 3;
            }
        }      
    } else if(stage == 4) {
        if(yes.over(jugador)) {
            tiempo += frameRate;
            if(tiempo >= limInferior) {
                tutorial = true;
                stage = 1;
            }
        } else if(no.over(jugador)) {
            tiempo += frameRate;
            if(tiempo >= limInferior) {
                tutorial = false;
                stage = 1;
            }
        }
    } else if (settings.over(jugador) && stage == 1) {
        tiempo += frameRate;
        if (tiempo >= limInferior) {
            tiempo = limInferior;
            stage = 2;
        }
    } else if (help.over(jugador) && stage == 1) {
        tiempo += frameRate;
        if (tiempo >= limInferior) {
            tiempo = limInferior;
            stage = 4;
        }
    } else if (atras.over(jugador) && (stage == 2 || stage == 3)) {
        tiempo += frameRate;
        if (tiempo >= limInferior) {
            imageMode(CORNER);
            paquete = (int) random(3);
            p1.generarPosiciones(clusters);
            p1.colorear();
            tiempo = limInferior;
            stage = 1;
            for (int i = 0; i < p1.seleccionados.length; i++) {
                p1.seleccionados[i] = false;
                if(i != 19) players[i].pause();
            }
        }
    } else if (play.over(jugador) && stage == 3) {
        tiempo += frameRate;
        if (tiempo >= limInferior) {
            tiempo = 0;
            for (int i = 1; i < p1.seleccionados.length; i++) {
                if (p1.seleccionados[i]) players[i - 1].loop(3);
            }
        }
    } else if ((plus.over(jugador) || minus.over(jugador)) && stage == 2) {
        tiempo += frameRate;
        if (tiempo >= limInferior) {
            tiempo = 0;
            if (plus.over(jugador)) s.increaseVolume();
            else s.lowerVolume();
            for (int i = 0; i < players.length; i++) {
                players[i].setGain(s.getVolume());
                song.setGain(s.getVolume());
            }
        }
    } else {
        tiempo = 0;
    }
}
