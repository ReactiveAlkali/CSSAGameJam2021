public class Star {
  private final int MAX_SIZE = 12;
  private float x;
  private float y;
  private float z;
  private float prevZ;

  public Star() {
    this.x = random(-width/2, width/2);
    this.y = random(-height/2, height/2);
    this.z = random(width/2);
    this.prevZ = z;
  }

  void moveStar(int speed) {
    this.z -= speed;

    if (this.z < 1) {
      this.z = width/2;
      this.x = random(-width/2, width/2);
      this.y = random(-height/2, height/2);
      this.prevZ = this.z;
    }
  }

  void drawStar() {
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);
    float radius = map(z, 0, width/2, MAX_SIZE, 0); //z value to increase the star size between 0 to 9
    
    float px = map(x / prevZ, 0, 1, 0, width/2);
    float py = map(y / prevZ, 0, 1, 0, height/2);
    
    fill(255);
    noStroke();
    ellipse(sx, sy, radius, radius);

    this.prevZ = z;

    stroke(255);
    line(px, py, sx, sy);
  }
}// Star
