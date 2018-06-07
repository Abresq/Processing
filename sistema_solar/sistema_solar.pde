Planet sun;
void setup(){
  size(600,600);
  sun = new Planet(100,0);
  sun.spawnMoons(5);
  
  
}
void draw(){
  background(0);
  translate(width/2,height/2);
  sun.show();
  
  
}