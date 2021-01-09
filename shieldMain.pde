Game game;

void setup() {
  size(500, 500);
  game = new Game();
}

void draw() {
  background(123);
  game.drawGame();
  
}

void keyPressed () {
  if (keyCode == TAB) {
    game.activateShield();
    println("this was run");
  }
}
