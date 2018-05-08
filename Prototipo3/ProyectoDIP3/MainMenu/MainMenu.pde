//git push origin MainMenu
import ddf.minim.*;
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
import gifAnimation.*;

//Ruta de las canciones a cargar
String[] rutaPaquetes =  new String[19];

//Menu de help
HelpMenu h;
Boton atras, start, help;
PFont mono;
Gif[] gifs = new Gif[4];
float tiempo;

//Sistema de particulas y Kinect
SistemaParticulas p1, o;
float margenDerecho; //describe el limite a la derecha
float margenIzquierdo; // describe el limite a la izquierda
int paquete;
int clusters = 19;
PImage img;
boolean centered;
Kinect kinect;
KinectTracker tracker;
Minim minim;
AudioPlayer song;
AudioInput input;
PImage startScreen;
int stage;

//Font para el texto
PFont baron, manbow;

//MouseOver de los botones
boolean startOver = false;
boolean helpOver = false;
boolean clickedStart = false;
boolean clickedHelp = false;
boolean clickedAtras = false;

void settings() {  
    for(int i = 0; i < gifs.length; i++) {
        gifs[i] = new Gif(this, "helpImages/"+(i+1)+".gif");
    }
    h = new HelpMenu(gifs);
    size(displayWidth, displayHeight);//necesario para kinect no cambiar!
    margenDerecho = floor((width-width/10));
    margenIzquierdo = floor((width/10));
    kinect = new Kinect(this);
    tracker = new KinectTracker();
    p1 = new SistemaParticulas(clusters, kinect);
    o = new SistemaParticulas(1, kinect);
    centered = false;
}

void setup(){
tiempo = 0;
paquete = (int)random(3);
p1.colorear();
 p1.generarPosiciones(clusters);
 o.colorear(255);


//Musica
minim = new Minim(this);
song = minim.loadFile("Soulful.mp3");

//cual stage es el que activara
stage = 1;
startScreen = loadImage("data/start.png");
image(startScreen, 0, 0, displayWidth, displayHeight);
baron = createFont("Baron Neue.ttf", 1);
manbow = createFont("manbow tone.ttf", 1);
start = new Boton(displayWidth/2, displayHeight/2, 180, 80, "START", 25, baron);
help = new Boton(displayWidth/2, 2*displayHeight/3, 180, 80, "HELP", 25, baron);
atras = new Boton(displayWidth - 200, 100, 180, 80, "BACK", 25, baron);
}

void draw(){

if (stage == 1){
    song.play();
    System.out.println(tracker.getCount());
    o.centroG(false, 1, displayWidth/2 - 50, displayHeight/4 - 50);
    tracker.setBackground(3);
    tracker.display();
    tracker.track();
    start.display();
    help.display();
    title();
    stepBack();
    o.move();
    }  else if (stage == 2) {
        background(0);
        mouseClick();
        centerWindow();
        tracker.display();
        tracker.track();
        atras.display();
        stepBack();
        h.volumen();
        h.backbtn();
        h.gifs();
    }  else if (stage == 3) {
            //Juego
            tracker.setBackground(paquete);
            song.pause();
            mouseClick();
            centerWindow();
            atras.display();
            tracker.display();
            tracker.track();
            stepBack();
            p1.seleccionados();
            PVector t = tracker.getPos();
             p1.centroG(true, 1, t.x, t.y);
             p1.move();
      }  
      mouseClick();
}
void dispose() {
kinect.stopDepth();
}
void centerWindow()
{
if(frame != null && centered == false)
{
frame.setLocation(displayWidth/2-width/2,displayHeight/2-height/3);
centered = true;
}
}
void stepBack() {
if(tracker.getCount() > 30000) {
tracker.loc = new PVector(0, 0);
background(255, map(tracker.getCount(), 30000, 100000, 255, 0));
fill(0);
textAlign(CENTER);
textFont(baron);
textSize(150);
text("Step back!", width/2, height/2);

}
}
void title() {
textAlign(CENTER);
textFont(manbow);
textSize(150);
fill(255);
text("GR   OVE", displayWidth/2, displayHeight/4);
}
void mouseClick(){
    float tamano = map(tiempo, 0, 590, 0, 100);
    stroke(255);
    noFill();
    strokeWeight(4);
    ellipse(100, 100, 100, 100);
    fill(255);
    noStroke();
    ellipse(100, 100, tamano, tamano);
    if (start.over() && stage == 1){
    tiempo += frameRate;
    if(tiempo >= 590) {
    tiempo = 590;
    clickedStart = true;
    clickedHelp = false;
    clickedAtras = false;
    stage = 3;
    }
    }else if(help.over() && stage == 1){
    tiempo += frameRate;
    if(tiempo >= 590) {
    tiempo = 590;
    clickedHelp = true;
    clickedStart = false;
    clickedAtras = false;
    stage = 2;
    }
    }
    else if(atras.over() && (stage == 3 || stage == 2)) {
    tiempo += frameRate;
    if(tiempo >= 590) {
    paquete = (int)random(3);
    tiempo = 590;
    clickedAtras = true;
    clickedHelp = false;
    clickedStart = false;
    stage = 1;
    }
    }
    else {
    tiempo = 0;
    }
}
