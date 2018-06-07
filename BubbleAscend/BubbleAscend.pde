Bubble[] Bubbles = new Bubble[1];

void setup(){
  size(640,360,P2D);
  for(int i=0;i<Bubbles.length;i++){
  Bubbles[i] = new Bubble(random(60));
  }
  }


void draw(){
  
  background(255);

  for(int i=0;i<Bubbles.length;i++){
  Bubbles[i].ascend();
  Bubbles[i].display();
  Bubbles[i].top();
println(frameRate);
  }
}