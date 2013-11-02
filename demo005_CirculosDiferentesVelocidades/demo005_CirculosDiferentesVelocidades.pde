//-------------------------------------------------------------------------------
// Circulos a Diferentes Velocidades
//-------------------------------------------------------------------------------
// A probar:
//     - Arreglos de objetos (crearlos, asignarlos y recorrerlos)
//     - Objetos (objeto Circulo, encapsula Ellipsis y la velocidad. Metodo Dibujar)
//     - Propiedades (Get/Set) en objetos (Ejemplo getVelocidad, setVelocidad)
//     - Clase con metodos utiles "Util" (por ejemplo colorRandom())
//
// Autor: Jose A. Fernandez | http://about.me/fernandezja | @fernandezja
//-------------------------------------------------------------------------------


int circulosCantidad = 30;
int circuloAnchoConstante = 50;
color fondoColorAmarillo = color(233,235,214);

//Definiendo un arreglo de objetos Circulos
Circulo[] circulosArray;

//Objeto con metodos utiles
Util util;



void setup() 
{

  size(600, 600);
  smooth();
  noStroke();
  frameRate(30);
   
  //Inicializando el objeto Util
  util = new Util();
  
  //Creando circulos al azar ()
  //TODO: Luego con los dedos...
  circulosArray = new Circulo[circulosCantidad];
  for (int i = 0; i<circulosCantidad-1; i++) {      
      //Creando nuevo circulo
      Circulo c = new Circulo(circuloAnchoConstante * i + 50, circuloAnchoConstante * i + 50,circuloAnchoConstante, circuloAnchoConstante);
      
      //Seteando velocidad 
      c.setVelocidad(0.01 * random(10));
      
      //Agregando el ciruclo al arreglo
      circulosArray[i] = c;
  }
}



void draw() 
{
  background(fondoColorAmarillo);
  
  for (int i = 0; i<circulosCantidad-1; i++) {
      Circulo c = circulosArray[i];
      c.dibujar();
  }
}



