class Display{
  
  //Default
  int health = 100;
  int shieldPower = 125;
  
  // top left [Default]
  int barX = 5;
  int barY = 5;
  
  public Display(Player current) {
    //update health and shield
    health = current.health;
    shieldPower = current.shield;
    //update position
    //barX = x;
    //barY = y;
  }
  
  // MENU
  void initialMessage() {
    int posX = width/4;
    int posY = height/4;
    int entityWidth = width/2;
    int entityHeight = height/2;
    int boxColor = 0;
    int textColor = 255;
    
    fill(boxColor);
    rect(posX, posY, entityWidth, entityHeight);
    textSize(32);
    fill(textColor);
    String message = "Start Game!";
    text(message, entityWidth/2, entityHeight);
    noFill();
  }

  void healthBar() {
    int x = barX;
    int y = barY;
    int barHeight = height/20;
    int barWidth = width/4;
    int sbarHeight = barHeight;
    int sbarWidth = (width/4)*health/100;
    
    //block 
    fill(0);//black
    rect(x, y,barWidth, barHeight);
    //stat bar
    fill(255,0,0);//red
    rect(x, y,sbarWidth, sbarHeight);
    noFill();
  }
  
  void shieldBar() {
    int barHeight = height/20;
    int barWidth = width/4;
    int sbarHeight = barHeight;
    int sbarWidth = (width/4)*shieldPower/100;
    
    int margin = barY + 1;
    int x = barX;
    int y = barY + barHeight + margin;
    //block 
    fill(0);//black
    rect(x, y,barWidth, barHeight);
    //stat bar
    fill(255,0,0);//red
    rect(x, y,sbarWidth, sbarHeight);
    noFill();
  }
}

