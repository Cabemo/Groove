class SistemaParticulas {
  Ball[][] sp;
  SistemaParticulas(int size) {
    int numParticulas = 4000/size;
    sp = new Ball[size][numParticulas];
  }
  void colorear() {
    int R = (int)random(256), 
        G = (int)random(256), 
        B = (int)random(256);
    for(int i = 0; i < sp.length; i++) {
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
    
     for(int i = 0; i < sp.length; i++) {
       for(Ball b : sp[i]) {
         if(main > 0) {
            b.centroG(mouseX, mouseY, true);
            main --;
         }
         else {
           if(azar) b.centroG(random(x) * sp.length + x, random(y) * 6 + y, false);
           else {
             int contador = 2;
             b.centroG(x * contador, y * 4, false);
           }
         }
       } 
     }
  }
}
