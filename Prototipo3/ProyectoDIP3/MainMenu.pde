//git push origin MainMenu
import processing.video.*;
import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioInput input;
Movie movie;
PImage startScreen;

//inicializando botones
int startX, startY;
int helpX, helpY;
int startSize = 90;
int helpSize = 90;
int stage;

//Font para el texto
PFont baron, manbow;

//MouseOver de los botones
boolean startOver = false;
boolean helpOver = false;
boolean clickedStart = false;
boolean clickedHelp = false;

color startColor, helpColor;
color startHighlight, helpHighlight;

void setup(){
  size(displayWidth, displayHeight);
  //Botones
  startX = displayWidth/2-(startSize);
  startY = displayHeight/2-displayHeight/10;
  helpX = displayWidth/2-(startSize);
  helpY = displayHeight/2+displayHeight/8;
  startColor = color(0);
  helpColor = color(0);
  startHighlight = color(100);
  helpHighlight = color(100);

    //Musica
    minim = new Minim(this);
    song = minim.loadFile("Soulful.mp3");

  //cual stage es el que activara
  stage = 1;
  startScreen = loadImage("Start.jpg");
  image(startScreen, 0, 0, displayWidth, displayHeight);
  baron = createFont("Baron Neue.ttf", 32, true);
  manbow = createFont("manbow tone.ttf", 110, true);

}

void draw(){
  stroke(0);
  fill(startColor);
  rect(startX, startY, startSize+90, startSize-10, 15);
  fill(helpColor);
  rect(helpX, helpY, helpSize+90, helpSize-10, 15);

  update(mouseX, mouseY);
  if (startOver && !helpOver) {
    startColor = startHighlight;
    helpColor = color(0);
  }else if (helpOver && !startOver) {
    helpColor = helpHighlight;
    startColor = color(0);
    song.pause();
  }else{

  helpColor = color(0);
  startColor = color(0);
  song.pause();
  }
    if (stage == 1){
    textAlign(CENTER);
    textFont(manbow);
    fill(255);
    text("GR   OVE", displayWidth/2, displayHeight/4);
    textFont(baron);
    textSize(25);
    fill(255,0,0);
    text("START", displayWidth/2, displayHeight*(0.46));
    text("HELP", displayWidth/2, displayHeight*0.685);
}else if (stage == 2) {
  //Instanciar la pagina de help
    }else{
  //Instanciar la pagina de juego
    }
}

void update(int x, int y){
  if (overStart(startX, startY, startSize+90, startSize-10)) {
  song.play();
  startOver = true;
  helpOver = false;
}else if (overHelp(helpX, helpY, helpSize+90, helpSize-10)) {
  startOver = false;
  helpOver = true;
  }else{
  startOver = helpOver = false;
  }
}

boolean overStart(int x, int y, int width, int height){
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
  return true;
  }else return false;
}

boolean overHelp(int x, int y, int width, int height){
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
  return true;
  }else return false;
}

void mouseClicked(){
  if (clickedStart){
    clickedStart = true;
    clickedHelp = false;
    stage = 3;
  }else if(clickedHelp){
    clickedHelp = true;
    clickedStart = false;
    stage = 2;
  }
}
