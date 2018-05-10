//git push origin MainMenu
import ddf.minim.*;
import ddf.minim.analysis.*;
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
import gifAnimation.*;
String[] backgrounds = {
          "data/parque.png",
          "data/ciudad.png",
          "data/espacio.png"};
PImage b;
//Ruta de las canciones a cargar
String[] rutaPaquetes =  new String[19];

//Menu de help
SettingMenu h;
HelpMenu s;
Boton atras, start, help, play, minus, plus;
PFont mono;
int limInferior, limSuperior;
Gif[] gifs = new Gif[4];
float tiempo;

//Sistema de particulas y Kinect
SistemaParticulas p1, o;
float margenDerecho; //describe el limite a la derecha
float margenIzquierdo; // describe el limite a la izquierda
int paquete;
int clusters = 20;
PImage img;
boolean centered;
Kinect kinect;
KinectTracker tracker;

//MUSICA
Minim minim;
AudioPlayer[] players;
FFT[] beatDetectors;
float[] fuerzas;
AudioPlayer song;
AudioInput input;
PImage startScreen;
int stage;

//Font para el texto
PFont baron, manbow;

void settings() {
    for(int i = 0; i < gifs.length; i++) {
        gifs[i] = new Gif(this, "helpImages/"+(i+1)+".gif");
    }
    limInferior = 2000;
    limSuperior = 4000;
    h = new SettingMenu();
    s = new HelpMenu(gifs);
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

//MUSICA
minim = new Minim(this);
song = minim.loadFile("Soulful.mp3");
players = new AudioPlayer[clusters - 1];
fuerzas = new float[clusters];
beatDetectors = new FFT[clusters - 1];
fuerzas[fuerzas.length - 1] = 0.9;
for(int i = 0; i < players.length; i++) {
  fuerzas[i] = 0.9;
  players[i] = minim.loadFile(rutaPaquetes[i], 2048);
  beatDetectors[i] = new FFT(players[i].bufferSize(), players[i].sampleRate());
}
//cual stage es el que activara
stage = 1;
startScreen = loadImage("data/start.png");
image(startScreen, 0, 0, displayWidth, displayHeight);
baron = createFont("Baron Neue.ttf", 1);
manbow = createFont("manbow tone.ttf", 1);
start = new Boton(displayWidth/2, displayHeight/2, 180, 80, "START", 25, baron);
help = new Boton(displayWidth/2, 2*displayHeight/3, 180, 80, "HELP", 25, baron);
atras = new Boton(displayWidth - 200, 50, 90, 40, "BACK", 15, baron);
play = new Boton(displayWidth - 300, 50, 90, 40, "PLAY", 15, baron);
minus = new Boton(displayWidth/2 - 300, height/2, 80, 80, "-", 40, baron);
plus = new Boton(displayWidth/2 + 300, height/2, 80, 80, "+", 40, baron);
}

void draw(){
if (stage == 1){
    image(startScreen, 0, 0);
    song.play();
    o.centroG(displayWidth/2 - 50, displayHeight/4 - 50);
    //tracker.display();
    start.display();
    help.display();
    tracker.track();
    title();
    stepBack();
    o.move();
    }  else if (stage == 2) {
        background(0);
        mouseClick();
        centerWindow();
        //tracker.display();
        atras.display();
        minus.display();
        plus.display();
        tracker.track();
        stepBack();
        h.volumen();
        h.backbtn();
        //h.gifs();
    }  else if (stage == 3) {
            //Juego
            image(b, 0, 0);
            song.pause();
            mouseClick();
            centerWindow();
            //tracker.display();
            atras.display();
            play.display();
            tracker.track();
            stepBack();
            p1.seleccionados();
            PVector t = tracker.getPos();
             p1.centroG(t.x, t.y);
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
text("GR     OVE", displayWidth/2, displayHeight/4);
}
void mouseClick(){
    float tamano = map(tiempo, 0, limInferior, 0, 75);
    stroke(255);
    noFill();
    strokeWeight(4);
    ellipse(100, 100, 75, 75);
    fill(255);
    noStroke();
    ellipse(100, 100, tamano, tamano);
    if (start.over() && stage == 1){
    tiempo += frameRate;
    if(tiempo >= limInferior) {
    b = loadImage(backgrounds[paquete]);
    b.resize(displayWidth, displayHeight);
    tiempo = limInferior;
    stage = 3;
    }
    }else if(help.over() && stage == 1){
    tiempo += frameRate;
    if(tiempo >= limInferior) {
    tiempo = limInferior;
    stage = 2;
    }
    }
    else if(atras.over() && (stage == 3 || stage == 2)) {
      for(int i = 0; i < p1.seleccionados.length; i++) p1.seleccionados[i] = false;
    tiempo += frameRate;
    if(tiempo >= limInferior) {
    paquete = (int)random(3);
    p1.generarPosiciones(clusters);
    p1.colorear();
    tiempo = limInferior;
    stage = 1;
    }
    }
    else if(play.over() && stage == 3) {
    tiempo += frameRate;
    if(tiempo >= limInferior) {
      tiempo = 0;
      for(int i = 1; i < p1.seleccionados.length; i++) {
        if(p1.seleccionados[i]) players[i - 1].loop(3);
    }
    }
    }
    else if((plus.over() || minus.over()) && stage == 2) {
      tiempo += frameRate;
      if(tiempo >= limInferior) {
      tiempo = 0;
      if(plus.over()) h.increaseVolume();
      else h.lowerVolume();
      for(int i = 0; i < players.length; i++) {
      players[i].setGain(h.getVolume());
      song.setGain(h.getVolume());
      println(h.getVolume());
      }
    }
    }

    else {
    tiempo = 0;
    }
    }
