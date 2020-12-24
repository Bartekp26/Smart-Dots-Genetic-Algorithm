Dot dot;

void setup(){
  size(800,800);
  dot = new Dot();
}

void draw(){
  background(255);
  dot.update();
  dot.show();
}
