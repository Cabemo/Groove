SistemaParticulas p1;
void settings() {
  size(1200,600);
  p1 = new SistemaParticulas(10);
}
void setup() {
  p1.colorear();
}
void draw() {
  background(0);
  p1.centroG(true, 1);
}
