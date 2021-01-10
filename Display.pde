static PImage playImage = null;
static PImage creditImage = null;
static PImage playPressedImage = null;
static PImage creditPressedImage = null;
static PImage exitImage = null;
static PImage exitPressedImage = null;
static PImage gameOverImage = null;
static PImage creditsImage = null;
static PImage gameTitle = null;

class Display{
  boolean ActiveP = false;
  boolean ActiveC = false;
  boolean ActiveE = false;
  // top left [Default]
  int barX = 5;
  int barY = 5;

  //[DEFAULT]
  public Display() {

  if(playImage == null)
    playImage = loadImage("Assets/MenuScreen/play_buttons.png");
  if(creditImage == null)
    creditImage = loadImage("Assets/MenuScreen/Creditst_buttons.png");
  if(exitImage == null)
    exitImage = loadImage("Assets/MenuScreen/exit_buttons.png");

  if(playPressedImage == null)
    playPressedImage = loadImage("Assets/MenuScreen/play_buttons_pressed_blue.png");
  if(creditPressedImage == null)
    creditPressedImage = loadImage("Assets/MenuScreen/Creditst_buttons_pressed.png");
  if(exitPressedImage == null)
    exitPressedImage = loadImage("Assets/MenuScreen/exit_buttons_pressed.png");
    
  if(gameOverImage == null)
    gameOverImage = loadImage("Assets/gameOverOrig.png"); 
  if(creditsImage == null)
    creditsImage = loadImage("Assets/credits.png"); 
  if(gameTitle == null)
    gameTitle = loadImage("Assets/titleGame.png"); 
    
  }

  //MAIN
  public Display(int x, int y) {
    //update position
    barX = x;
    barY = y;
  }

  //MENU
  void initialMessage() {
    int margin = (width - 3*(playImage.width))/6;
    int heightFix = 3*height/4;
    int playX = margin;
    int playY = heightFix;
    int creditX = margin + width/3;
    int creditY = heightFix;
    int quitX = margin + 2*width/3;
    int quitY = heightFix;
    int gtX = (width - gameTitle.width)/2;
    int gtY = (height - gameTitle.height)/2;
    //Display Image
    image(gameTitle,gtX ,gtY - playImage.height/4);
    image(playImage,playX,playY);
    image(creditImage,creditX,creditY);
    image(exitImage,quitX,quitY);

    //Display Image on Mouse Pressed

      if((mouseX > playX) && (mouseY > playY) && (mouseX < playX + playImage.width) && (mouseY < playY + playImage.height)) {
        image(playPressedImage,playX,playY);
        if(mousePressed)
          ActiveP = true;
      }
      
      if((mouseX > creditX) && (mouseY > creditY) && (mouseX < creditX + creditImage.width) && (mouseY < creditY + creditImage.height)){
        image(creditPressedImage,creditX,creditY);
        if(mousePressed)
          ActiveC = true;
      }
      if((mouseX > quitX) && (mouseY > quitY) && (mouseX < quitX + exitImage.width) && (mouseY < quitY + exitImage.height)){
        image(exitPressedImage,quitX,quitY);
        if(mousePressed)
          ActiveE = true;
      }
  }
  
  void gameOver(){
    int goX = (width - gameOverImage.width)/2;
    int goY = (height - gameOverImage.height)/2;
    image(gameOverImage,goX,goY);
  }
  
  void credits(){
    int goX = (width - gameOverImage.width)/2;
    int goY = (height - gameOverImage.height)/2;
    image(creditsImage,goX,goY);
  }
  


  //Describe State of Player
  /*
  */
  Status state() {
    Status state = Status.MENU;
    if(ActiveP){
       state = Status.PLAY;
    }
    if(ActiveC)
       state = Status.CREDIT;
    if(ActiveE)
       state = Status.QUIT;
    return state;
  }

  void healthBar(int currentHealth) {
    int x = barX;
    int y = barY;
    int barHeight = height/20;
    int barWidth = width/4;
    int sbarHeight = barHeight;
    int sbarWidth = (width/4)*currentHealth/100;

    //block 
    stroke(255,0,0);
    fill(0);//black
    rect(x, y,barWidth, barHeight);
    //stat bar
    fill(255,0,0);//red
    rect(x, y,sbarWidth, sbarHeight);
    //HealthText
    fill(255);
    textSize(barHeight);
    text("HEALTH", x + 5, y + textAscent() - textDescent()/2);
    noFill();
    noStroke();
  }
  
  void shieldBar(int currentShield) {
    int barHeight = height/20;
    int barWidth = width/4;
    int sbarHeight = barHeight;
    int sbarWidth = (width/4)*(currentShield/2)/100;
    
    int margin = barY + 1;
    int x = barX;
    int y = barY + barHeight + margin;
    stroke(255,0,0);
    //block 
    fill(0);//black
    rect(x, y,barWidth, barHeight);
    //stat bar
    fill(255,0,0);//red
    rect(x, y,sbarWidth, sbarHeight);
    fill(255);
    textSize(barHeight);
    text("SHIELD", x + 5, y + textAscent() - textDescent()/2);
    noFill();
    noStroke();
  }
}
