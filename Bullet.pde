static PImage redbulletImage = null;

class Bullet extends Entity {
  int bDiameter;//works as both width and height for entity class
  boolean isAlive = true;//can be in entity
  int speed = 5;//reaches end of screen in half second, may need balancing, for now only moves rigth to left

  public Bullet(int startX, int startY) {
    bDiameter = 20;
    if(redbulletImage == null)
      redbulletImage = loadImage("Assets/Red/bullet_red.png");
    //circle(startX, startY, bDiameter);//last value size, adjust to make it look good
    

    this.x = startX;
    this.y = startY;
    this.entityWidth = 50;
    this.entityHeight = 100;
  }

  void update()
  {
    x -= speed;

    if (x < - this.entityWidth)
    {
      isAlive = false;
    }
    draw();
  }
  
  void reflect()
  {
    speed = -5;
  }
  
  void draw()//can be put into entity class
  {
    if(isAlive)
    {
      pushMatrix();
      
      translate(x, y);
      rotate(3.f * HALF_PI);
      image(redbulletImage, -entityWidth/2, -entityHeight/2, entityWidth, entityHeight);
      
      popMatrix();
    }
  }
}
