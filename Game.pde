enum Status {
  MENU, 
    ACTIVE, 
    INACTIVE;
}

public class Game {
  //private Player;
  private ArrayList<Bullet> bullets;
  
  // variables for enemies
  private ArrayList<Enemy> enemies;
  private int enemySpawnRate = 100;
  private int enemySpawnTimer = 0;
  
  
  public Game() {
   private Player player;
   private Status status;
    
    enemies = new ArrayList<Enemy>();
    bullets = new ArrayList<Bullet>();
  }
  
  public void drawGame() {
    this.player.drawPlayer();
    this.player.movePlayer();
    this.player.drawShield();    
    
  }
  private void checkStatus() {
    if (this.player.getHealth() <= 0) {
      this.status = Status.INACTIVE;
    }
  }

  void draw() {
    clear();
    background(255);
    
    for(Enemy e : enemies) 
      e.draw();
      
    updateEnemies();
  }
  
  private void activateShield() {  
      this.player.changeShieldStatus();
  }
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


  //==========================
  void spawnEnemies() {
    enemySpawnTimer--;
    
    if(enemySpawnTimer <= 0) {
      int rand = (int) random(height);
      Enemy enemy = new Enemy(width, rand);
      enemies.add(enemy);
      enemySpawnTimer = enemySpawnRate;
    }
  }
  
  void updateEnemies() {
    spawnEnemies();
    
    for(int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      e.update();
      
      // Remove enemies as they exit the screen
      if(e.x <= 0)
        enemies.remove(i);
    }
  }
  
  void addBullet(int x, int y) {
    bullets.add(new Bullet(x, y)); 
  }
  
  void ckeckEnemyCollisions() {
    
  }
 
  void addBullet(int x, int y) {
    bullets.add(new Bullet(x, y));
  }
  
  // check for collision
  
  //gameOver(){
  //}
  
  //setParticleCount() {
     // removes an enemy from the list 
  //}
  
  
  // dection
}

