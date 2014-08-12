class CPunto {
  boolean mover;
  float x, y;
  CPunto(float x, float y) {
    this.x = x; 
    this.y = y;
    mover = false;
  }
  void act() {
    if (mousePressed) {
      if (!mover) {
        float dis = dist(mouseX, mouseY, x, y);
        if (dis < 50) mover = true;
        else mover = false;
      }
    }
    else mover = false;
    if (mover) {
      x += mouseX-pmouseX;
      y += mouseY-pmouseY;
    }
    dibujar();
  }
  void dibujar() {
    strokeWeight(1);
    stroke(255);
    fill(255,100);
    ellipse(x, y, 50, 50);
  }
}