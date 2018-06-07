class Particle {
  PVector pos = new PVector(random(width - 1), random(height - 1));
  PVector vel = new PVector(0, 0); 
  PVector acc = new PVector(0, 0); 
  PVector prevPos = pos.copy(); 
  float maxSpeed = 2;
  
  void update() {

    prevPos.x = pos.x; 
    prevPos.y = pos.y; 
    

    vel.add(acc); 
    vel.limit(maxSpeed); // limit velocity
    pos.add(vel); 
    

    if(pos.x >= width) pos.x = prevPos.x = 0;
    if(pos.x < 0) pos.x = prevPos.x = width - 1;
    if(pos.y >= height) pos.y = prevPos.y = 0;
    if(pos.y < 0) pos.y = prevPos.y = height - 1;
    

    acc.mult(0); 
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void show() {
    stroke(random(255), random(255), random(255));
    strokeWeight(1);
    line(pos.x, pos.y, prevPos.x, prevPos.y);
  }
  
  void follow(PVector[] flowField) {

    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);
    int index = x + y * cols;
    
    
    PVector force = flowField[index];
    applyForce(force);
  }
}