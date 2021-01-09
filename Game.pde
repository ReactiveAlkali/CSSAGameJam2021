enum Status {
  MENU, 
    ACTIVE, 
    INACTIVE;
}

public class Game {
  private Player player;
  private Status status;

  public Game() {
    this.player = new Player();
    this.status = Status.MENU;
    
  }

  public void drawGame() {
    this.player.drawPlayer();
    this.player.movePlayer();
    this.player.drawShield();    
    
  }

  private void activateShield() {  
      this.player.changeShieldStatus();
  }

//----------------------------------------------
  private void checkStatus() {
    if (this.player.getHealth() <= 0) {
      this.status = Status.INACTIVE;
    }
  }

  // === assessors ===
  public Status getStatus() {
    return this.status;
  }

  private void setStatus(Status stat) {
    this.status = stat;
  }
}// Game
