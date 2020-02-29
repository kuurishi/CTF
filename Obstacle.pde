//
// class Obstacle - has additinal and isCaptured properties.
//
public class Obstacle extends Object {

  
  //
  // Obstacle constructor - sets the default coordinates and default color
  //
  Obstacle(float x, float y, float oh, float ow, color c) {
    super(x, y, oh, ow, c);    // sets the base class constructor 
    objectType = ObjectType.T_RECTANGLE;
    size = max(oh,ow);    
  }


  //
  // draws the Obstacle
  //
  void drawFlag() {
    Draw();
  }


}
