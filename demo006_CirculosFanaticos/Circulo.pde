class Circulo{
  
  float _posX, _posY, _ancho, _alto;
  float _velocidad;
  color _colorFondo;
  
  float _colorValorR, _colorValorG, _colorValorB;
  
  
  
  //Velocidad: Propiedad get/set
  float getVelocidad(){
    return _velocidad;
  }
  void setVelocidad(float velocidad){
    _velocidad = velocidad;
  }
  
  //Color de Fondo: Propiedad get/set
  color getColorFondo(){
    return _colorFondo;
  }
  void setColorFondo(color colorFondo){
    _colorFondo = colorFondo;
  }
  
  TuioCursor _tuioCursor;
  
  //TuioCursor: Propiedad get/set
  TuioCursor getTuioCursor(){
    return _tuioCursor;
  }
  void setTuioCursor(TuioCursor tuioCursor){
    _tuioCursor = tuioCursor;
  }
  
  //Verifica que exista cursor a seguir
  boolean existeCursor(){
    return (getTuioCursor()!=null);
  }
  
  //Constructor
  Circulo(float x, float y, float ancho, float alto){
    _posX = x;
    _posY = y;
    _ancho = ancho;
    _alto = alto;
    
    //Setear parametros por default
    setVelocidad(0.05);
    
    //Setear el color de fondo a partir de un color Random (ayuda con Util)
    util = new Util();
    setColorFondo(util.colorRandom());
    
  }
   
  void dibujar(){
    posicionar();
    
    fill(getColorFondo());
    ellipse(_posX, _posY, _ancho, _alto);
  }
  
  void posicionar(){
    
    if(!existeCursor()){
      return;
    }
    
    float targetX = getTuioCursor().getScreenX(width);
    float dx = targetX - _posX;
    if(abs(dx) > 1) {
      _posX += dx * getVelocidad();
    }
    
    float targetY =  getTuioCursor().getScreenY(height);
    float dy = targetY - _posY;
    if(abs(dy) > 1) {
      _posY += dy * getVelocidad();
    }
  }
}

