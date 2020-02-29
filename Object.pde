//
// base class for a game object ( player or flag or ...)
//

//
private class Object {

  ObjectType objectType;      // the object type
  float x;              // the current X coordinate of the object
  float y;              // the current Y coordinate of the object
  float homeX;          // the inital screen X coordinate
  float homeY;          // the inital screen Y coordinate
  float size;           // the size of the object
  color colr;           // the color of the object
  color initialColor;   // the inital color of the object
  PImage image;          // the PNG image for this object

  // a vector storing the X and Y coordinates of the center of the object
  //PVector pv;         // https://processing.org/tutorials/pvector/
  // https://natureofcode.com/book/chapter-1-vectors/
  int speed;
  Directions moveDirection;

  //
  // Object default constructor - set up the default values for all parameters
  //
  Object () {
    Defaults();
  }

  //
  // Object constructor sets the x, y, color and default(home) x/y coordinates
  //
  Object (float xPar, float yPar, color cPar) {
    Defaults();
    x = xPar;
    y = yPar;
    colr = cPar;
    homeX = x;
    homeY = y;
    initialColor = cPar;
  }

  //
  // set the Object default values
  //
  void Defaults ()
  {
    objectType = ObjectType.T_NONE;
    x = 0;
    y = 0;
    homeX = x;
    homeY = y;
    size = 50;
    colr = color(0, 0, 0);
    initialColor = colr;
    image = null;
    speed = 0;
    moveDirection = Directions.noMovement;
  }


  //
  // draws the object depending on his objectType
  //
  void Draw() {
    switch (objectType) {
    case T_CIRCLE:
      stroke(0);
      fill(colr);
      ellipse(x, y, size, size);
      break;
    case T_RECTANGLE:
      stroke(1);
      fill(colr);
      rect(x, y, size, size);
      break;
    case T_IMAGE:
      if (image != null) {
        imageMode(CENTER);  // Draw image using CENTER mode
        image(image, x, y, 60, 60);  // the two additional parameters are  are used to set the image's width and height.
      }
      break;
    case T_NONE:
    default:
      break;
    }
  }



  //
  // caluclates the difference between two objects
  //
  float Distance ( Object o1, Object o2 ) {
    // reference: http://www.jeffreythompson.org/collision-detection/table_of_contents.php 
    if ( o1 == null || o2 == null )
      return 0;      // check for not initialized objects ...

    // distance between 2 points
    if ( o1.objectType == ObjectType.T_POINT && o2.objectType == ObjectType.T_POINT ) {
      // distance between 2 points is easy..
      return dist(o1.x, o1.y, o2.x, o2.y);
    } else if ( o1.objectType == ObjectType.T_CIRCLE && o2.objectType == ObjectType.T_CIRCLE ) {
      // distance between 2 circles
      float distX = o1.x - o2.x;
      float distY = o1.y - o2.y;
      float distance = sqrt( (distX*distX) + (distY*distY) );
      return distance;
    } else if ( o1.objectType == ObjectType.T_CIRCLE && o2.objectType == ObjectType.T_RECTANGLE) {
      // distance between a circle and rectangle
      float radius = o1.size/2;   // the radius of the circle ( object 1 )
      float rw = o2.size/2;    // the width of the rectange ( object 2)
      float rh = o2.size/2;   // the height of the rectange ( object 2 )
      // temporary variables to set edges for testing
      float testX = o1.x;    
      float testY = o1.y;
      // which edge is closest?
      if (o1.x < o2.x)          //  if circle is LEFT from the rectangle
        testX = o2.x;           //     then test against the rectangle left edge
      else if (o1.x > o2.x+rw)  // if circle is RIGHT from the rectangle
        testX = o2.x + rw;      //     then test against the rectangle right edge
      if (o1.y < o2.y)          // if circle is ABOVE the rectange
        testY = o2.y;           //     then test check against the rectangle TOP edge
      else if (o1.y > o2.y+rh)  // if circle is ABOVE the rectange
        testY = o2.y + rh;      //     then test the rectangle BOTTOM edge

      // get the X and Y distances between the circle center to the closest edge of the rectangle
      float distX = o1.x-testX;
      float distY = o1.y-testY;
      float distance = sqrt( (distX*distX) + (distY*distY) );
      return distance;
    }



    return 0;  // unknown
  }


  //
  // moves the object in the direction specified in the direction property...
  //
  void moveObject() {
    if ( moveDirection == Directions.upDirection )
      y -= speed;
    else if ( moveDirection == Directions.downDirection )
      y += speed;
    else if ( moveDirection == Directions.leftDirection )
      x -= speed;
    else if ( moveDirection == Directions.rightDirection )
      x += speed;
  }




  //
  // sets the current X and Y coordinates to be the inital ones
  // called when a flag is dropped, game is restarted, etc...
  //
  void ResetCoordinates () {
    x = homeX;
    y = homeY;
    colr = initialColor;
    moveDirection = Directions.noMovement;
  }

  //
  // copyes the X and Y coordinates of another object
  //
  void CopyCoordinates ( Object other ) {
    this.x = other.x;
    this.y = other.y;
  }
}
