
class Bullet extends Entity {
  int bDiameter;//works as both width and height for entity class
  boolean isAlive = true;//can be in entity
  int speed = 5;//reaches end of screen in half second, may need balancing, for now only moves rigth to left

  public Bullet(int startX, int startY) {
    bDiameter = 20;
    circle(startX, startY, bDiameter);//last value size, adjust to make it look good

    this.x = startX;
    this.y = startY;
    this.entityWidth = bDiameter;
    this.entityHeight = bDiameter;
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
  
  void draw()//can be put into entity class
  {
    if(isAlive)
    {
      pushMatrix();
      
      translate(x, y);
      circle(-this.entityWidth/2, -this.entityWidth/2, this.entityWidth);
      
      popMatrix();
    }
  }
}
