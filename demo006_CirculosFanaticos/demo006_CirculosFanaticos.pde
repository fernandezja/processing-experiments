//-------------------------------------------------------------------------------
// Circulos a Diferentes Velocidades
//-------------------------------------------------------------------------------
// A probar:
//     - Arreglos de objetos (crearlos, asignarlos y recorrerlos)
//     - Objetos (objeto Circulo, encapsula Ellipsis y la velocidad. Metodo Dibujar)
//     - Propiedades (Get/Set) en objetos (Ejemplo getVelocidad, setVelocidad)
//     - Clase con metodos utiles "Util" (por ejemplo colorRandom())
//     - Utilizando TUIO (http://www.tuio.org/?processing)
//
// Autor: Jose A. Fernandez | http://about.me/fernandezja | @fernandezja
//-------------------------------------------------------------------------------

import TUIO.*;
TuioProcessing tuioClient;
int tuioCursoresCantidadTotal, tuioCursoresCantidadTotalAnterior;
boolean tuioCursoresCambio;


int circulosCantidad = 50;
int circuloAnchoConstante = 50;
color fondoColorAmarillo = color(233,235,214);

//Definiendo un arreglo de objetos Circulos
Circulo[] circulosArray;

//Objeto con metodos utiles
Util util;



void setup() 
{

  size(700, 700);
  smooth();
  noStroke();
  
  frameRate(30);
  
  //Inicializando el objeto Tuio
  tuioClient  = new TuioProcessing(this);
  tuioCursoresCantidadTotalAnterior = -1;  //Cantidad de cursores anteriores
  tuioCursoresCantidadTotal = 0;           //Cantidad actual de cursores
  tuioCursoresCambio = false;              //Conocer si hay un cambio en cursores
  
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
  
  //Obteniendo cursoroes de TUIO
  Vector tuioCursorList = tuioClient.getTuioCursors();
  tuioCursoresCantidadTotal = tuioCursorList.size();
  
  //Verificando la cantidad de cursores
  if (tuioCursoresCantidadTotalAnterior!= tuioCursoresCantidadTotal){
    tuioCursoresCantidadTotalAnterior = tuioCursoresCantidadTotal;
    tuioCursoresCambio = true;
  }
  
  //Recorriendo circulos 
  for (int i = 0; i<circulosCantidad-1; i++) {
      Circulo c = circulosArray[i];
      
      //Asignando un cursos a seguir al azar solo si cambio
      if(tuioCursoresCambio){
         c.setTuioCursor(null);
      }
      
      //Si el cursos no esta relacionado al circulo se asigna (solo si existen cursores)
      if(!c.existeCursor() && tuioCursoresCantidadTotal > 0){
        //Si el cursor asignado no existe entonces se asigna uno al azar
        int indice = (int)random(tuioCursorList.size());
        TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(indice);
        c.setTuioCursor(tcur);
      }
      
      //Dibuando el circulo
      c.dibujar();
  }
  
  //Definiendo que no existen cambios
  tuioCursoresCambio = false;
}




// these callback methods are called whenever a TUIO event occurs

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  println("add object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  println("remove object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  println("update object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
          +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
}

// called when a cursor is added to the scene
void addTuioCursor(TuioCursor tcur) {
  println("add cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY());
}

// called when a cursor is moved
void updateTuioCursor (TuioCursor tcur) {
  println("update cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY()
          +" "+tcur.getMotionSpeed()+" "+tcur.getMotionAccel());
}

// called when a cursor is removed from the scene
void removeTuioCursor(TuioCursor tcur) {
  println("remove cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+")");
}

// called after each message bundle
// representing the end of an image frame
void refresh(TuioTime bundleTime) { 
  redraw();
}



