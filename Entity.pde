class Entity {
  int x;
  int y;

  int entityWidth;
  int entityHeight;

  public boolean isColliding(Entity other)
  {    
    boolean collidingX = false;
    boolean collidingY = false;

    float minX = this.x - entityWidth / 2;
    float maxX = this.x + entityWidth / 2;

    float minY = this.y - entityHeight / 2;
    float maxY = this.y + entityHeight / 2;

    float otherMinX = other.x - entityWidth / 2;
    float otherMaxX = other.x + entityWidth / 2;

    float otherMinY = other.y - entityHeight / 2;
    float otherMaxY = other.y + entityHeight / 2;

    //check collisions along the X-axis
    if ((minX >= otherMinX && minX <= otherMaxX) ||
      (maxX >= otherMinX && maxX <= otherMaxX))
    {
      collidingX = true;
    }

    //check collisions along the Y-axis
    if ((minY >= otherMinY && minY <= otherMaxY) ||
      (maxY >= otherMinY && maxY <= otherMaxY))
    {
      collidingY = true;
    }

    return collidingX && collidingY;
  }
}
