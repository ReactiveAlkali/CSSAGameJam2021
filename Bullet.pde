static PImage redbulletImage = null;
static PImage blueBulletImage = null;

class Bullet extends Entity {
  int bDiameter;//works as both width and height for entity class
  boolean isAlive = true;//can be in entity
  float speedX = 5;//reaches end of screen in half second, may need balancing, for now only moves rigth to left
  float speedY = 0;
  
  PImage currImage = null;
  float imageRotation = 3.f * HALF_PI;

  public Bullet(float startX, float startY) {
    bDiameter = 20;
    if(redbulletImage == null)
      redbulletImage = loadImage("Assets/Red/bullet_red.png");
    if(blueBulletImage == null)
      blueBulletImage = loadImage("Assets/Blue/bullet.png");
      
    currImage = redbulletImage;

    this.x = startX;
    this.y = startY;
    this.entityWidth = 50;
    this.entityHeight = 100;
  }

  void update()
  {
    x -= speedX;
    y += speedY;

    if (x < - this.entityWidth)
    {
      isAlive = false;
    }
    draw();
  }
  
  void reflect(float playerX, float playerY)
  { 
    // Calculates the reflection angle
    float diffX = this.x - playerX;
    float diffY = playerY - this.y;
    float reflectAngle = acos(diffX / sqrt(sq(diffX) + sq(diffY)));
    
    if(diffY < 0)
      reflectAngle = 0 - reflectAngle;
    
    // Set new speeds
    speedX = -speedX * cos(2 * reflectAngle);
    speedY = speedX * sin(2 * reflectAngle);
    
    // Set sprite
    if(diffX < 0) {
      imageRotation = HALF_PI + 2 * reflectAngle;
    }
    else {
      imageRotation = HALF_PI - 2 * reflectAngle;
    }
    currImage = blueBulletImage;
  }
  
  
  void draw()//can be put into entity class
  {
    if(isAlive)
    {
      pushMatrix();
      
      translate(x, y);
      rotate(imageRotation);
      image(currImage, -entityWidth/2, -entityHeight/2, entityWidth, entityHeight);
      
      popMatrix();
    }
  }
}
