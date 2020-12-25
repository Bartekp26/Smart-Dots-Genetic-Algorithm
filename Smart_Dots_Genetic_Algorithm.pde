Population dots;
Goal goal;

void setup(){
  size(800,800);
  dots = new Population(200);
  goal = new Goal(width/2, 50, 30, 30);
}

void draw(){
  background(255);
  goal.show();
  dots.update();
  dots.show();
}
