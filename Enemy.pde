public class Enemy extends Entity {
  
  private int speed = 2;
  private int fireRate = 4;
  private int fireTimer = 0;
  
  // Constructor for creating an enemy instance
  // Accepts the location to construct the enemy
  Enemy(int x, int y) {
    this.x = x;
    this.y = y;
    
    this.entityWidth = 60;
    this.entityHeight = 30;
  }
  
  void draw() {
    ellipse(this.x, this.y, entityWidth, entityHeight);
  }
  
  void moveEnemy() {
    x -= speed;
  }
  
  void update() 
  {
    //SHOOTING
    fireTimer -= 1;
    if(fireTimer <= 0 ) 
    {
      fireTimer = fireRate;
      // create bullet
    }
  }
  
  // dection
}// Enemy
