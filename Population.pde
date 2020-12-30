class Population{
  Dot[] dots;
  float fitnessSum;
  int generation = 1;
  
  int bestDot = 0;
  int minStep = 400;
  
  Population(int size){
    dots = new Dot[size];
    for(int i = 0; i < size; i++){
      dots[i] = new Dot();
    }
  }
  
  
  void show(){
    for(int i = 0; i < dots.length; i++){
      dots[i].show();
    }
  }
  
  
  void update(){
    for(int i = 0; i < dots.length; i++){
      if(dots[i].brain.step > minStep){
        dots[i].dead = true;
      } else {
        dots[i].update();
      }
    }
  }
  
  
  void calculateFitness(){
    for(int i = 0; i < dots.length; i++){
      dots[i].calculateFitness();
    }
  }
  
  
  boolean allDotsDead(){
    for(int i = 0; i < dots.length; i++){
      if(!dots[i].dead && !dots[i].reachedGoal){
        return false;
      }
    }
    return true;
  }
  
//----------------------------------------------------
  
   void naturalSelection(){
     Dot[] newDots = new Dot[dots.length];
     setBestDot();
     calculateFitnessSum();
     
     newDots[0] = dots[bestDot].cloneBaby();
     newDots[0].isBest = true;
     for(int i = 1; i < dots.length; i++){
       
       Dot parent = selectParent();
       
       newDots[i] = parent.cloneBaby();
       
     }
     
     dots = newDots.clone();
     generation++;
     
   }
   
   
   void calculateFitnessSum(){
     fitnessSum = 0;
     
     for(int i = 0; i < dots.length; i++){
       fitnessSum += dots[i].fitness;
     }
   }
   
   
   Dot selectParent(){
     float random = random(fitnessSum);
     float runningSum = 0;
     
     for(int i = 0; i < dots.length; i++){
       runningSum += dots[i].fitness;
       if(runningSum > random){
         return dots[i];
       }
     }
     
     return null;
   }
 
//---------------------------------------------------
 
  void mutateBabies(){
    for(int i = 1; i < dots.length; i++){
      dots[i].brain.mutate();
    
    }
  }
 
//---------------------------------------------------

void setBestDot(){
  float max = 0;
  int maxIndex = 0;
  
  for(int i = 0; i < dots.length; i++){
    if(dots[i].fitness > max){
      max = dots[i].fitness;
      maxIndex = i;
    }
  }
  
  bestDot = maxIndex;
  
  if(dots[bestDot].reachedGoal){
    minStep = dots[bestDot].brain.step;
    println("step: ", minStep);
  }
}
 
 
 
 
}
