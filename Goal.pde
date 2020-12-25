class Goal extends Object{

  Goal(int x, int y, int width, int height){
    super(x,y, width, height);
  }
  
  void show(){
    fill(255, 50, 50);
    noStroke();
    ellipse(x, y, width, height);
  }
  
  boolean ifReached(float x, float y){
    if (dist(x, y, this.x, this.y) < this.width/2 ) return true; else return false;
  }

}
