
public class Player extends Entity {
  private final int DIAM = 100;
  private final int maxHealth = 100;
  private final int maxShield = 120;

  private int health;
  private int shield;
  private boolean shieldStatus;

  public Player() {
    this.x = width/2;
    this.y = height/2;
    this.entityWidth = 25;
    this.entityHeight = 25;
    this.health = maxHealth;
    this.shield = maxShield;
    this.shieldStatus = false;
  }

  public void drawPlayer() {
    fill(255);
    rect(this.x - entityWidth/2, this.y - entityWidth/2, entityWidth, entityWidth);
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
