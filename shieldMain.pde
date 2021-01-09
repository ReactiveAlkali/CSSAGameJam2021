Game game;

float previousTimeMillis;

void setup() {
  size(1366, 768);
  game = new Game();
}

void draw() {

  background(123);
  
  game.draw();
}

void keyPressed() {
  
}
