//Arbol Fractal con Mouse
float theta; //declarar varaible de algulo   
void setup() { size(1200, 800);} // hace una ventna de dicho tamaño
void draw() { 
  background(255); // Esto dibuja una ventana de fondo de color blanco
  theta = map(mouseY,0,width,0,PI/2); // Se escoge un angulo entre 0 y 90 de acuerdo a la posicion del mouse
  translate(width/2, height); //traslada el origen de la esquina superior izquierda al el centro de la parte baja, para iniciar ahí el arbol
  stroke(0);
  branch(175);} //tamaño en pixeles de la rama principal
void branch(float len) { //Función rama
  float sw = map(len,1,3720,1,10); // len se convierte en un valor dentro del rango de 2 a 120, en valres que vande desde 0(el borde izquierdo de la ventana) hasta 10 (borde derecho)
  strokeWeight(sw); //este valor indica el grosor de la rama    
  line(0, 0, 0, -len);
  // Mover al final de la línea
  translate(0, -len); 
  len *= 0.67; //Proporcion del cambio en el tamaño de la rama, cada rama tendra 2/3 partes del largo de la rama anterior
  // Nota: todas las funciones recursivas deben tener salida (recordar factorial)
  // En programación el limite está dado por los pixeles, es decir cuando es mayor a 2 pixeles es viable
  if (len > 2) {
    pushMatrix();    // Guarda el estado de transfomación actual (donde estamos ahorita)
    rotate(theta);   // Rota a rama de acuerdo al angulo theta
    branch(len);     // Ahora es cuando se hace la rama
    popMatrix();     // Una vez que se llega a este punto, el "pop" nos lleva a restaurar el estado anterior
  // Se repite lo mismo pero con la rama de la izquierda
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();}}
