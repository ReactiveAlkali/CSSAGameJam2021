static PImage playerImage = null;

public class Player extends Entity {
  private final int DIAM = 100;
  private final int maxHealth = 100;
  private final int maxShield = 200;

  private int health;
  private int shield;
  private boolean shieldStatus;

  public Player() {
    this.x = width/2;
    this.y = height/2;
    this.entityWidth = 100;
    this.entityHeight = 100;
    this.health = maxHealth;
    this.shield = maxShield;
    this.shieldStatus = false;

    if (playerImage == null)
      playerImage = loadImage("Assets/Blue/alienship_new.png");
  }

  public void drawPlayer() {
    pushMatrix();

    translate(this.x, this.y);
    rotate(HALF_PI);
    image(playerImage, -entityWidth/2, -entityHeight/2, entityWidth, entityHeight);

    popMatrix();
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
  public float getPlayerX() {
    return this.x;
  }

  public float getPLayerY() {
    return this.y;
  }

  public int getHealth() {
    return this.health;
  }

  public int getShield() {
    return this.shield;
  }

  public boolean isShieldOn()
  {
    return this.shieldStatus;
  }

  public void changeShield(int n)
  {
    this.shield += n;
  }

  public void setHealth(int n) {
    this.health = n;
  }
}// Player

