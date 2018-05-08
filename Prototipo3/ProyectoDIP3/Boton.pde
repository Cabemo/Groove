class Boton {
  int x, y , w, h, textSize;
  PFont fuente;
  String text;
  color c;
  PVector jugador;
  Boton(int x, int y, int w, int h, String text, int textSize, PFont fuente) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.textSize = textSize;
    this.fuente = fuente;
    jugador = tracker.getPos();
  }
  void display() {
    rectMode(CENTER);
    fill(c = ((over() ? color(0) : color(255))));
    noStroke();
    rect(x, y, w, h);
    fill(c = ((over() ? color(255) : color(0))));
    textFont(fuente);
    textAlign(CENTER, CENTER);
    textSize(textSize);
    text(text, x, y);
  }
  boolean over(){
    jugador = tracker.getPos();
    if (jugador.x >= x-(w/2) && jugador.x <= x+(w/2) && jugador.y <= y+(h/2) && jugador.y >= y-(h/2)) return true;
    else return false;
  }
}
