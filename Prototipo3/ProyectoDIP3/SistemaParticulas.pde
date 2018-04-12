class SistemaParticulas {
  Ball[][] sp;
  int posicionX, posicionY;
  color[]colores = {#16a085, //verde
             #e67e22, //naranja
             #c0392b, //rojo
             #2980b9, //azul
             #f1c40f, //amarillo
             #8e44ad, //morado
             #f368e0, //rosa
             #ff5e57, //rojo claro
             #0be881, //verde claro
             #4bcffa, //azul claro
             #f53b57 //rosa fuerte
            };
  SistemaParticulas(int size) {
    int numParticulas = 4000/size;
    sp = new Ball[size][numParticulas];
  }
  void move() {
    for(int i = 0; i < sp.length; i++) {
      for(Ball b: sp[i]) {
        b.move();
        b.display();
      }
    }
   }
  void colorear() {
    for(int i = 0; i < sp.length; i++) {
      color c = colores[(int)random(colores.length)];
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
           if(azar) b.centroG(random(width), y*random(4), true);
           else {
             b.centroG(x * contador, y * 4, true);
           }
         }
       }
       contador++;
       main--;
     }
  }
}
