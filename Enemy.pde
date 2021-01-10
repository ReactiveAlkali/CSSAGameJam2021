static PImage enemyImage = null;

public class Enemy extends Entity {
  
  private int speed = 2;
  private int fireRate = 100;
  private int fireTimer = 0;
  
  // Constructor for creating an enemy instance
  // Accepts the location to construct the enemy
  Enemy(int x, int y) {
    this.x = x;
    this.y = y;
    
    if(enemyImage == null)
      enemyImage = loadImage("Assets/Red/spaceship_enemy_red.png");
    
    this.entityWidth = 75;
    this.entityHeight = 75;
  }
  
  void draw() {
    pushMatrix();
    
    translate(x,y);
    rotate(3.f * HALF_PI);
    image(enemyImage, -entityWidth / 2, -entityHeight / 2, entityWidth, entityHeight);
    
    popMatrix();
  }
  
  void moveEnemy() {
    x -= speed;
  }
  
  void update() 
  {
    moveEnemy();
    
    //SHOOTING
    fireTimer -= 1;
    if(fireTimer <= 0 ) 
    {
      fireTimer = fireRate;
      game.addBullet(this.x, this.y);
    }
  }
  
  // dection
}// Enemy
