class SistemaParticulas {
  Ball[][] sp;
  SistemaParticulas(int size) {
    int numParticulas = 4000/size;
    sp = new Ball[size][numParticulas];
  }
  void colorear() {
    for(int i = 0; i < sp.length; i++) {
      int R = (int)random(255);
      int G = (int)random(255);
      int B = (int)random(255);
      for(int j = 0; j < sp[0].length; j++) {
        sp[i][j] = new Ball(color(R, G, B));
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
  void centroG(boolean azar, int main) {
    int x = width/(sp.length + 2);
    int y = height/8;
    int contador = 1;
     for(int i = 0; i < sp.length; i++) {
       for(Ball b : sp[i]) {
         if(main > 0) {
            b.centroG(mouseX, mouseY, false);
         }
         else {
           if(azar) b.centroG(random(x) * sp.length + x, random(y) * 6 + y, true);
           else {
             b.centroG(x * contador, y * 4, true);
           }
         }
        b.move();
        b.display();
       }
       contador++;
       main--;
     }
  }
}
