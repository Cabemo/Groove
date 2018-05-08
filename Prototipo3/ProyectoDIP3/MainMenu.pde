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
PFont mono;
Gif[] gifs = new Gif[4];

//Sistema de particulas y Kinect
SistemaParticulas p1;
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

//inicializando botones
int startX, startY;
int helpX, helpY;
int atrasX, atrasY;
int atrasSize = 90, startSize = 90, helpSize = 90;
int stage;

//Font para el texto
PFont baron, manbow;

//MouseOver de los botones
boolean startOver = false;
boolean helpOver = false;
boolean clickedStart = false;
boolean clickedHelp = false;
boolean clickedAtras = false;

color startColor, helpColor, atrasColor;
color startHighlight, helpHighlight, atrasHighlight;

void settings()
{  
    for(int i = 0; i < gifs.length; i++)
   {
     gifs[i] = new Gif(this, "helpImages/"+(i+1)+".gif");
   }
   h = new HelpMenu(gifs);
   size(displayWidth, displayHeight);//necesario para kinect no cambiar!
  //fullScreen();
  margenDerecho = floor((width-width/10));
  margenIzquierdo = floor((width/10));
  kinect = new Kinect(this);
  tracker = new KinectTracker();
   p1 = new SistemaParticulas(clusters, kinect);
 centered = false;
}

void setup(){
    p1.colorear();
   p1.generarPosiciones(clusters);
  //Botones
  startX = displayWidth/2-(startSize);
  startY = displayHeight/2-displayHeight/10;
  helpX = displayWidth/2-(startSize);
  helpY = displayHeight/2+displayHeight/8;
  atrasX = displayWidth-3*atrasSize;
  atrasY = displayHeight/13;
  startColor = color(255);
  helpColor = color(255);
  atrasColor = color(255);
  startHighlight = color(100);
  helpHighlight = color(100);
  atrasHighlight = color(100);

    //Musica
    minim = new Minim(this);
    song = minim.loadFile("Soulful.mp3");

  //cual stage es el que activara
  stage = 1;
  startScreen = loadImage("data/start.png");
  image(startScreen, 0, 0, displayWidth, displayHeight);
  baron = createFont("Baron Neue.ttf", 32, true);
  manbow = createFont("manbow tone.ttf", 110, true);

}

void draw(){
  update(mouseX, mouseY);
  mouseClick();
  if (startOver && !helpOver) {
    startColor = startHighlight;
  }else if (helpOver && !startOver) {
    helpColor = helpHighlight;
    startColor = color(255);
    song.pause();
  }else{

  helpColor = color(255);
  startColor = color(255);
  song.pause();
  }
    if (stage == 1){
      stroke(0);
  fill(startColor);
  rect(startX, startY, startSize+90, startSize-10, 15);
  fill(helpColor);
  rect(helpX, helpY, helpSize+90, helpSize-10, 15);
    textAlign(CENTER);
    textFont(manbow);
    textSize(150);
    fill(255);
    text("GR   OVE", displayWidth/2, displayHeight/4);
    textFont(baron);
    textSize(25);
    fill(0);
    text("START", displayWidth/2, startY+((startSize)/2)+2);
    text("HELP", displayWidth/2, helpY+(startSize)/2+2);
}else if (stage == 2) {
  background(0);
      h.volumen();
   h.backbtn();
   h.gifs();
    }else if (stage == 3) {
    //Juego
    if(overAtras()) {
      atrasColor = atrasHighlight;
    }
    else atrasColor = color(0);
    song.pause();
    mouseClick();
    centerWindow();
    tracker.display();
    fill(255);
    rect(atrasX, atrasY, atrasSize+90, atrasSize-10, 15);
    tracker.track();
    PVector t = tracker.getPos();
     p1.centroG(true, 1, t.x, t.y);
     p1.move();
    }
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
void update(int x, int y){
  if (overStart() && stage == 1) {
  song.play();
  startOver = true;
  helpOver = false;
}else if (overHelp()) {
  startOver = false;
  helpOver = true;
  }else{
  startOver = helpOver = false;
  }
}

boolean overStart(){
  if (mouseX >= startX && mouseX <= startX+startSize+90 && mouseY >= startY && mouseY <= startY+startSize-10) {
  return true;
  }else return false;
}

boolean overHelp(){
  if (mouseX >= helpX && mouseX <= helpX+helpSize+90 && mouseY >= helpY && mouseY <= helpY+helpSize-10) {
  return true;
  }else return false;
}
boolean overAtras(){
  if (mouseX >= atrasX && mouseX <= atrasX+atrasSize+90 && mouseY >= atrasY && mouseY <= atrasY+atrasSize-10) {
  return true;
  }else return false;
}

void mouseClick(){
  if (overStart() && mousePressed){
    clickedStart = true;
    clickedHelp = false;
    clickedAtras = false;
    stage = 3;
  }else if(overHelp() && mousePressed){
    clickedHelp = true;
    clickedStart = false;
    clickedAtras = false;
    stage = 2;
  }
  else if(overAtras() && mousePressed) {
    clickedAtras = true;
    clickedHelp = false;
    clickedStart = false;
    stage = 1;
}
}
