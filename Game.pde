enum Status {
  MENU, 
    ACTIVE, 
    INACTIVE;
}

public class Game {
  private Status status;
  private Player player;
  private Star[] starField;

  private ArrayList<Bullet> bullets;
  private ArrayList<Bullet> reflects = new ArrayList<Bullet>();

  // variables for enemies
  private ArrayList<Enemy> enemies;
  private int enemySpawnRate = 100;
  private int enemySpawnTimer = 0;

  public Game() {
    this.player = new Player();
    this.status = Status.MENU;
    this.starField = initStarField();

    this.enemies = new ArrayList<Enemy>();
    this.bullets = new ArrayList<Bullet>();
  }

  /* if we can somehow move void draw into this function 
   * that would help keep the drawing parts better organized
   */
  public void drawGame() {
    // player elements
    this.player.drawPlayer();
    this.player.movePlayer();
    this.player.drawShield();

    // bullet

    // enemy

    // display

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
    this.player.changeShieldStatus();
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
  }

  void addBullet(int x, int y) {
    bullets.add(new Bullet(x, y));
  }

  void checkCollisions() {
    int hp = player.getHealth();
    ArrayList<Bullet> hits = new ArrayList<Bullet>();
    ArrayList<Bullet> rHits = new ArrayList<Bullet>();
    ArrayList<Enemy> eHits = new ArrayList<Enemy>();

    for (Bullet q : bullets)
    {
      if (player.isColliding(q) && !reflects.contains(q))
      {
        if (player.isShieldOn())
        {
          q.reflect();
          reflects.add(q);
        } else
        {
          player.setHealth(hp - 10);//each bullet does 10 damage
          hits.add(q);
        }
      }
    }

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
}// Game
