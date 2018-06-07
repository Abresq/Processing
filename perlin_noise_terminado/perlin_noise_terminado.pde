float inc = 0.1;
float scl = 10;
int cols, rows;
float zoff = 0;
Particle[] particles;
PVector[] flowField;

void setup()
{
  size(1200, 800, P2D);
  cols = floor(width / scl);
  rows = floor(height / scl);
  
  particles = new Particle[100000];
  for(int i = 0; i < particles.length; ++i)
    particles[i] = new Particle();
    
  flowField = new PVector[cols * rows];
  
  background(255);
}

void draw()
{
  float yoff = 0;
  for(int y = 0; y < rows; y++) {
    float xoff = 0;
    for(int x = 0; x < cols; x++) {
      // set the vector in the flow field
      int index = x + y * cols; 
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 2;
      PVector v = PVector.fromAngle(angle);
      v.setMag(1);
      flowField[index] = v;
      
      xoff += inc;
    }
    yoff += inc;
    zoff += 0.0003;
  }
  

  for(int i = 0; i < particles.length; ++i) {
    particles[i].follow(flowField);
    particles[i].update();
    particles[i].show();
  }
}