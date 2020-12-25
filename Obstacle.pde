class Obstacle extends Object{
  
  Obstacle(int x, int y, int width, int height){
    super(x, y, width, height);
  }

  void show(){
      fill(100);
      rect(x, y, width, height);
  }
  
  boolean ifHit(float x, float y){
    if (x > this.x && x < this.x+this.width && y > this.y && y < this.y+this.height) return true; else return false;
  }
}
