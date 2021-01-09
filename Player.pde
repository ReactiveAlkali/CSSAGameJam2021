public class Player {
  private int x;
  private int y;
  private final int PLAYER_SIZE = 50;
  private final int DIAM = 100;
  private int health;
  private int shield;
  private final int maxHealth = 100;
  private final int maxShield = 120;
  private boolean shieldStatus;

  public Player() {
    this.x = width/2;
    this.y = height/2;
    this.health = maxHealth;
    this.shield = maxShield;
    this.shieldStatus = false;
  }

  public void drawPlayer() {
    strokeWeight(1);
    fill(255);
    rect(this.x - PLAYER_SIZE/2, this.y - PLAYER_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }

  public void drawShield() {
    checkShieldStatus();

    if (this.shieldStatus && this.shield > 0) {
      strokeWeight(5);
      noFill();
      ellipse(this.x, this.y, DIAM, DIAM);
    }
  }
  
  private void checkShieldStatus() {
      this.shieldStatus = this.shieldStatus == false ? true : false;
    
  }
  
  private void movePlayer() {
    this.x = mouseX;
    this.y = mouseY;
  }

  // === assessors ===
  public int getPlayerX() {
    return this.x;
  }

  public int getPLayerY() {
    return this.y;
  }

  public int getHealth() {
    return this.health;
  }

  public int getShield() {
    return this.shield;
  }

  void setHealth(int n) {
    this.health = n;
  }
}// Player
