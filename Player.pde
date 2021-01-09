
public class Player {
  private final int PLAYER_SIZE = 25;
  private final int DIAM = 100;
  private final int maxHealth = 100;
  private final int maxShield = 120;
  private int x;
  private int y;

  private int health;
  private int shield;
  private boolean shieldStatus;

  public Player() {
    this.x = width/2;
    this.y = height/2;
    this.health = maxHealth;
    this.shield = maxShield;
    this.shieldStatus = false;
  }

  public void drawPlayer() {
    fill(255);
    rect(this.x - PLAYER_SIZE/2, this.y - PLAYER_SIZE/2, PLAYER_SIZE, PLAYER_SIZE);
  }

  private void movePlayer() {
    this.x = mouseX;
    this.y = mouseY;
  }

  public void drawShield() {        
    if (this.shieldStatus) {
      noFill();
      ellipse(this.x, this.y, DIAM, DIAM);
    }
  }

  private boolean changeShieldStatus() {
    return this.shieldStatus = this.shieldStatus == false ? true : false;
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

  public void setHealth(int n) {
    this.health = n;
  }
}// Player
