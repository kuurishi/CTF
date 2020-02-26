class Player {

  int posX, posY; //Center Coordinates of Player Picture
  int playerSize; //Radius of the Player (circle)
  color colr; //Color of the Player
  int speed;
  int lastDirection;
  boolean wasMoved;


  Player(int x, int y, color c) {
    playerSize = 50;
    posX = x;
    posY = y;
    colr = c;
    speed = 7;
    lastDirection = -1; // some invalid value
    wasMoved = false;
  }


  void drawPlayer() {

    fill(colr);
    ellipse(posX, posY, playerSize, playerSize);
  }


  void checkBoundaryCollision () {
    if ( posY<0 ) {
      posY = 0;
    }
    if ( posY>maxY ) {
      posY = maxY;
    }    
    if ( posX<0 ) {
      posX = 0;
    }
    if ( posX>maxX ) {
      posX = maxX;
    }
  }


  void checkCollision(Player other) {
    if ( (abs(posX - other.posX) < playerSize) && (abs(posY - other.posY) < playerSize)) {
      // if the X coordinates are close and the  Y coordinates are close too...
        if (lastDirection == rightDirection){
          posX = posX - playerSize;
        }
        else if (lastDirection == leftDirection){
          posX = posX + playerSize;
        }
        else if (lastDirection == upDirection){
          posY = posY + playerSize;
        }
        else if (lastDirection == downDirection){
          posY = posY - playerSize;
        }
    }
    wasMoved = false;
  }


  void movePlayer(int direction) {

    lastDirection = direction;
    wasMoved = true;
    
    switch ( direction ) {
      case upDirection:
        posY = posY - speed;
  
        break;
  
      case downDirection:
        posY = posY + speed;
  
        break;
  
      case leftDirection:
        posX = posX - speed;
  
  
        break;
  
      case rightDirection:
        posX = posX + speed;
  
  
        break;
  
      default:
        return;
      }
  }
}
