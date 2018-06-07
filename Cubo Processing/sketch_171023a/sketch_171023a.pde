float angleX;
float angle;
float c1;
float c2;
float c3;
Table table;
float r = 200;
PImage ball;
PImage earth;
PShape globe;
PShape sat;
void setup() {
  size(600, 600, P3D);
  earth = loadImage("earth.jpg");
  ball = loadImage("ball.jpg");
  // table = loadTable("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_day.csv", "header");
  table = loadTable("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv", "header");

  noStroke();
  //fill();
  
  globe = createShape(BOX, r);
  globe.setTexture(earth);
  println("GIOVANNI ME LA PELA");
  sat = createShape(SPHERE,120);
  sat.setTexture(ball);
}

void draw() {
  int posX = mouseX;
  map(posX,0,width,0,255);
  println(posX);
  
  c1 = c1+2.5;
  c2 = c2+5.5;
  c3 = c3+9.5;
  
  if (c1>255){
    c1=0;
  }
  if (c2>255){
    c2=0;
  }
  if (c3>255){
    c3=0;
  }
  
  lights();
  
  background(c1,c2,c3);
  
  pushMatrix();
  translate(mouseX,mouseY);
  rotateZ(angle);
  rotateX(angle);
  rotateY(angle);
  shape(sat);
  popMatrix();
  
  translate(mouseX,mouseY);
  rotateX(angleX);
  rotateY(angle);
  angle += 0.05;
  angleX += 0.02;

  //lights();
  fill(200);
  noStroke();
  //sphere(r);
  shape(globe);


  for (TableRow row : table.rows()) {
    float lat = row.getFloat("latitude");
    float lon = row.getFloat("longitude");
    float mag = row.getFloat("mag");
    float theta = radians(lat) + PI/2;
    float phi = radians(lon) + PI;
    float x = r * sin(theta) * cos(phi);
    float y = -r * sin(theta) * sin(phi);
    float z = r * cos(theta);
    PVector pos = new PVector(x, y, z);

    float h = pow(10, mag);
    float maxh = pow(10, 7);
    h = map(h, 0, maxh, 10, 100);
    PVector xaxis = new PVector(1, 0, 0);
    float angleb = PVector.angleBetween(xaxis, pos);
    PVector raxis = xaxis.cross(pos);



    pushMatrix();
    translate(x, y, z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);
    fill(#6CB7FF);
    box(h, 5, 5);
    popMatrix();

  }
}