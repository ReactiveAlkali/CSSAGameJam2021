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
    //this.particle = new particle[numParticles];
  }

  public void drawGame() {
    this.player.drawPlayer();
    this.player.movePlayer();

    activateShield();
  }


  private void activateShield() {  
    if (this.player.getShield() > 0) {
      this.player.drawShield();
    }
  }

  private void checkStatus() {
    if (this.player.getHealth() <= 0) {
      this.status = Status.INACTIVE;
    }
    println(this.status);
  }

  // === assessors ===
  public Status getStatus() {
    return this.status;
  }

  private void setStatus(Status stat) {
    this.status = stat;
  }
}// Game
