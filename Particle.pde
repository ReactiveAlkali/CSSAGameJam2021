class Bullet {
  float x;//can be in entity
  float y;//can be in entity
  float bDiameter;//works as both width and height for entity class
  boolean isAlive = true;//can be in entity
  float speed = width * 2;//reaches end of screen in half second, may need balancing, for now only moves rigth to left

  public Bullet(float startX, float startY) {
    bDiameter = 20;
    circle(startX, startY, bDiameter);//last value size, adjust to make it look good

    x = startX;
    y = startY;
  }

  void update(float delta)
  {
    y -= speed * delta;

    if (y < - bDiameter)
    {
      isAlive = false;
    }
  }
  
  void draw()//can be put into entity class
  {
    if(isAlive)
    {
      pushMatrix();
      
      translate(x, y);
      circle(-bDiameter/2, -bDiameter/2, bDiameter);
      
      popMatrix();
    }
  }
}
