//-------------------------------------------------------------
// Util
//-------------------------------------------------------------
// Clase con metodos utiles
//
// Version: 0.1
// Autor:   Jose A. Fernandez | http://about.me/fernandezja
//-------------------------------------------------------------


public class Util{
  
  float _colorValorR, _colorValorG, _colorValorB;
  color _colorNuevo;
  
  //Obtiene un color random
  color colorRandom(){
    
    _colorValorR = random(255);
    _colorValorG = random(255);
    _colorValorB = random(255);
    
    _colorNuevo = color(_colorValorR, _colorValorG, _colorValorB, 100);
    //println("RGB: "+_colorValorR+"/"+_colorValorG+"/"+_colorValorB);
    //println(_colorNuevo);
    return _colorNuevo;
  }
  
//  point posicionRandom(int ancho,int alto){    
//    return point(random(ancho), random(alto));
//  }
  
  
}
