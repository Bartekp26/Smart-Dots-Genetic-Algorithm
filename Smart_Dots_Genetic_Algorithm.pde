Population dots;
Goal goal;
Obstacle[] obstacles;

void setup(){
  size(800,800);
  dots = new Population(200);
  goal = new Goal(width/2, 50, 30, 30);
  obstacles = new Obstacle[2];
  obstacles[0] = new Obstacle(0, 200, 200, 30);
  obstacles[1] = new Obstacle(400, 200, 400, 30);
}

void draw(){
  background(255);
  goal.show();
  
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i].show();
  }
  
  dots.update();
  dots.show();
}
