//
// base class for a game object ( player or flag or ...)
//
private class Object {

  int x;              // the current X coordinate of the object
  int y;              // the current Y coordinate of the object
  int homeX;        // the inital screen X coordinate
  int homeY;        // the inital screen Y coordinate
  color initialColor;  // the inital color of the object
  
  // a vector storing the X and Y coordinates of the center of the object
  //PVector pv;        // https://processing.org/tutorials/pvector/
                     // https://natureofcode.com/book/chapter-1-vectors/
  color colr;        // the color of the object
  int speed;
  int moveDirection;
  
  //
  // Object constructor - set up the default values for all parameters
  //
  Object () {
    //pv = new PVector (0,0);
    x = 0;
    y = 0;
    homeX = x;
    homeY = y;
    colr = color(0,0,0);
    initialColor = colr;
    speed = 0;
    moveDirection = noMovement;
  }
  
  //
  // sets the current X and Y coordinates to be the inital ones
  // called when a flag is dropped, game is restarted, etc...
  //
  void ResetCoordinates () {
    x = homeX;
    y = homeY;
    colr = initialColor;
    moveDirection = noMovement;
  }
  
  //
  // copyes the X and Y coordinates of another object
  //
  void CopyCoordinates ( Object other ) {
    this.x = other.x;
    this.y = other.y;
  }
  
  
}
