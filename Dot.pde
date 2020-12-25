class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  
  boolean dead = false;
  boolean reachedGoal = false;


  Dot() {
    brain = new Brain(1000);
    
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }


  void show() {
      fill(0);
      ellipse(pos.x, pos.y, 4, 4);
  }


  void move() {

    if (brain.directions.length > brain.step) {
      acc = brain.directions[brain.step];
      brain.step++;
    } else {
      dead = true;
    }

    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
  }


  void update() {
    if (!dead) {
      move();
      if (pos.x < 3 || pos.y < 3 || pos.x > width-3 || pos.y > height-3) {
        dead = true;
      } else if (goal.ifReached(pos.x, pos.y)){
        reachedGoal = true;
      } else if (obstacles[0].ifHit(pos.x, pos.y)){
        dead = true;
      }
    }
  }
  
}
