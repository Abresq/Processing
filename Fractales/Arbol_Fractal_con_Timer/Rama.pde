// Rama del arbol
class Branch {
  // Cada rama tiene posición, velocidad y un timer 
  PVector start; //Cada rama tiene un inicio
  PVector end; //Cada rama tiene un final
  PVector vel; //Cada rama tiene una velocidad
  float timer; //Cada rama tiene un timer
  float timerstart; //Cada rama tiene un timer de inicio
  boolean growing = true; //Crecimiento del árbol
  Branch(PVector l, PVector v, float n) {
    start = l.get();
    end = l.get();
    vel = v.get();
    timerstart = n;
    timer = timerstart;}
  // Mover de posición
  void update() {if (growing) {end.add(vel);}}
  // Crear un ponto en una posición
  void render() {stroke(0,0,0); line(start.x,start.y,end.x,end.y);} //que no hay contorno, e indica el inicio y final de la línea
  // Se terminó el tiempo?
  boolean timeToBranch() {timer--;
    if (timer < 0 && growing) {growing = false;return true;} 
    else {return false;}}
  //Crear una nueva rama en la posición actual, cambiando la direcion respecto a un angulo  
  Branch branch(float angle) {
    float theta = vel.heading2D(); // Dirección a la que me dirijo
    float mag = vel.mag();  // Velocidad actual
    theta += radians(angle); //Rotaión de la rama
    PVector newvel = new PVector(mag*cos(theta),mag*sin(theta)); //Transformar coordenadas polares a cartesianas
    return new Branch(end,newvel,timerstart*0.66f);}//Esta función regresa una nueva rama
    //al final de la vieja rama (vector), la velocidad, timer
}