Game game;

static PImage background = null;

void setup() {
  size(1366, 768);
  game = new Game();
  background = loadImage("Assets/Background/background.jpg");
  background.resize(width, height);
}

void draw() {
  image(background, 0, 0);
  game.draw();
  game.drawGame();
}

void keyPressed () {
  if (keyCode == TAB) {
    game.activateShield();
  }
}
