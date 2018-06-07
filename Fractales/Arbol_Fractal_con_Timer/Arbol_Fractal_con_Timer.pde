// Árbol Fractal con Timer
// Listas-arreglos que van a guardar las ramas y las hojas
ArrayList<Branch> tree;
ArrayList<Leaf> leaves;
void setup() {size(640,360); background(255); //Canvas blanco de dicho tamaño
  // Se crea una lista-array y se le agregan ramas y hojas a estas
  tree = new ArrayList<Branch>();
  leaves = new ArrayList<Leaf>();
  //Las ramas tienen un posición, velocidad y timer inicial de la rama (tamaño)
  Branch b = new Branch(new PVector(width/2,height),new PVector(0,-1),124);
  // Agregarlo a la lista-array
  tree.add(b);}
void draw() {background(255); //Diujar en el canvas con fondo blanco
  // Se detendrá si el arbol es muy grande
  for (int i = tree.size()-1; i >= 0; i--) {//Para cada rama del arbol
    Branch b = tree.get(i); // Obtiene una rama
    b.update(); //Actualiza la rama
    b.render(); //Dibuja la rama
    // Está listo para poner las hojas?
    if (b.timeToBranch()) {
      if (tree.size() < 1024) { //Si el tamaño del árbol es menor a cierto valor, este sigue creciendo
        //tree.remove(i);          // Esto elimina las lineas o ramas anteriores
        tree.add(b.branch( 30));   // Añade una rama a la derecha
        tree.add(b.branch(-30));}  // Añade una rama a la izquierda
      else {leaves.add(new Leaf(b.end));}}} //Si el arbol no crece, añade las hojas al final de la rama
  for (Leaf leaf : leaves) {leaf.display();}} //Dibuja las hojas, pero si el arreglo está vació dibuja nada