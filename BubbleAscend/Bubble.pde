class Bubble {
  float x;
  float y;
  float diameter;
  
  Bubble(float tempD){
   x = random(0,width); 
   y = random(0,height);
   diameter = tempD;
  }
  
  void ascend(){
   y = y-(random(0,3));
   x = x + random(-2,2);

  }
  
  void display(){
   stroke(0);
   noFill();
   //fill(127);
   ellipse(x,y,diameter,diameter);
  }
  
  void top(){
   if ( y < -diameter/2){
    y = height+diameter/2; 
   }
    
  }
  
  
  
  
}