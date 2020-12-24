Population dots;

void setup(){
  size(800,800);
  dots = new Population(200);
}

void draw(){
  background(255);
  dots.update();
  dots.show();
}
