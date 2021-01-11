
enum Status {
  MENU,
    PLAY,
    OPTION,
    CREDIT,
    QUIT, 
  ACTIVE, 
  INACTIVE;
}


public class Game {
  private Status status;
  private Player player;
  private Star[] starField;
  private Display display;

  private ArrayList<Bullet> bullets;
  private ArrayList<Bullet> reflects = new ArrayList<Bullet>();
  
  //shield variables
  private int lastChange = millis();
  private int current;
  private boolean shieldDrained = false;

  // variables for enemies
  private ArrayList<Enemy> enemies;
  private float enemySpawnRate = 100.f;
  private float enemySpawnTimer = 0.f;
  private float spawnRateIncrease = 0.001;

  public Game() {
    this.player = new Player();
    this.status = Status.MENU;
    this.starField = initStarField();
    this.display = new Display();

    this.enemies = new ArrayList<Enemy>();
    this.bullets = new ArrayList<Bullet>();
  }
  /* if we can somehow move void draw into this function 
   * that would help keep the drawing parts better organized
   */
  public void drawGame() {
    // player elements
    Status gameStatus = this.display.state();
    Status playerStatus = playerStatus(); 
    //STATE MENU
    if( gameStatus == Status.MENU){
      this.display.initialMessage();
    }
    
    //STATE PLAY
    if( gameStatus == Status.PLAY) {
      if (playerStatus == Status.ACTIVE) {
        this.player.drawPlayer();
        this.player.movePlayer();
        this.player.drawShield();
    
        // bullet
        // enemy
        // display bars
        this.display.healthBar(this.player.getHealth());
        this.display.shieldBar(this.player.getShield());
      }else
        this.display.gameOver();
    }
    //quit
    if( gameStatus == Status.QUIT) {
      exit();
    }
    
    //credits
    if (gameStatus == Status.CREDIT) {
      this.display.credits();;
    }
    
    // star
    drawStarField();
  }

  void draw() {
    for (Enemy e : enemies) {
      e.draw();
    }
    update();
  }

  private void activateShield() {  
    if (!shieldDrained)
    {
      this.player.changeShieldStatus();
      lastChange = millis();
    }
  }

  private Star[] initStarField() {
    this.starField = new Star[400];

    for (int i = 0; i < this.starField.length; i++) {
      this.starField[i] = new Star();
    }
    return starField;
  }

  private void drawStarField() {
    int speed = 5;
    translate(width/2, height/2);

    for (int i = 0; i < starField.length; i++) {
      starField[i].moveStar(speed);
      starField[i].drawStar();
    }
  }

  //private void checkStatus() {
  //  if (this.player.getHealth() <= 0) {
  //    this.status = Status.INACTIVE;
  //  }
  //}

  // === assessors ===
  public Status getStatus() {
    return this.status;
  }

  //private void setStatus(Status stat) {
  //  this.status = stat;
  //}


  //==========================
  void spawnEnemies() {
    enemySpawnTimer--;

    if (enemySpawnTimer <= 0) {
      int rand = (int) random(height);
      Enemy enemy = new Enemy(width, rand);
      enemies.add(enemy);
      enemySpawnTimer = enemySpawnRate;
    }
  }

  void update() {
    spawnEnemies();
    current = millis();
    
    if (player.isShieldOn() && !shieldDrained)
    {
      if (current - lastChange >= 1)
      {
        player.changeShield(-5);
        lastChange = current;
      }

      if (player.getShield() <= 0)
      {
        this.activateShield();
        shieldDrained = true;
      }
    } else
    {
      if (current - lastChange >= 1 && player.getShield() < 200)
      {
        player.changeShield(5);
        lastChange = current;
      }
    }
    
    if (player.getShield() >= 200)
    {
      shieldDrained = false;
    }

    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      e.update();

      // Remove enemies as they exit the screen
      if (e.x <= 0)
        enemies.remove(i);
    }

    for (Bullet q : bullets)
    {
      q.update();
    }

    checkCollisions();
    
    increaseSpawnRate();
  }

  void addBullet(float x, float y) {
    bullets.add(new Bullet(x, y));
  }

  void checkCollisions() {
    int hp = player.getHealth();
    ArrayList<Bullet> hits = new ArrayList<Bullet>();
    ArrayList<Bullet> rHits = new ArrayList<Bullet>();
    ArrayList<Enemy> eHits = new ArrayList<Enemy>();

    //player collision with bullets
    for (Bullet q : bullets)
    {
      if (player.isColliding(q) && !reflects.contains(q))
      {
        if (player.isShieldOn())
        {
          q.reflect(player.x, player.y);
          reflects.add(q);
        } else
        {
          player.setHealth(hp - 10);//each bullet does 10 damage
          hits.add(q);
        }
      }
    }
    
    //player collision with enemies
    for (Enemy z : enemies)
    {
      if (player.isColliding(z))
      {
        eHits.add(z);
        player.setHealth(hp - 30);
      }
    }
    
    //enemy collision with reflected bullets
    for (Bullet q : reflects)
    {
      for (Enemy z : enemies)
      {
        if (q.isColliding(z))
        {
          rHits.add(q);
          eHits.add(z);
        }
      }
    }
    bullets.removeAll(rHits);
    reflects.removeAll(rHits);
    bullets.removeAll(hits);
    enemies.removeAll(eHits);
  }
   
  void increaseSpawnRate() {
    if(enemySpawnRate > 10) 
      enemySpawnRate -= spawnRateIncrease;
  }
  
  //Determine the player status Active or Inactive
  Status playerStatus() {
    Status current = Status.ACTIVE;
    if (this.player.getHealth() < 0){
      current = Status.INACTIVE;
    }
    return current;
  }
}// Game