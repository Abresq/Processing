// Hojas que van al final de la última rama
class Leaf {
  PVector pos; 
  Leaf(PVector l) {pos = l.get();} 
  void display() {noStroke(); //Crea algo sin contorno
    fill(50,100); //Relleno de un color con cierta difuminación
    ellipse(pos.x,pos.y,4,4);} //con la fomra de un círculo en la pocision dada
}