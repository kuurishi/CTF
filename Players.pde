
private class Object {

  // a vector storing the X and Y coordinates of the center of the object
  PVector pv;        // https://processing.org/tutorials/pvector/
                     // https://natureofcode.com/book/chapter-1-vectors/
  color colr;        // the color of the object
  int speed;
  int lastDirection;
  boolean wasMoved;
  
  Object () {
    pv = new PVector (0,0);
    colr = color(0,0,0);
    speed = 0;
    lastDirection = -1;
    wasMoved = false;
  }
  
}


public class Player extends Object  {

  
  int playerSize; //Radius of the Player (circle)


  Player(int x, int y, color c) {
    playerSize = 50;
    pv.set(x,y);
    colr = c;
    speed = 7;
  }


  void drawPlayer() {
    stroke(0);
    fill(colr);
    ellipse(pv.x, pv.y, playerSize, playerSize);
  }


  void checkBoundaryCollision () {
    
    if ( pv.x < playerSize/2 ) {
      pv.x  = playerSize;
    }
    else if ( pv.x + playerSize/2 > maxX ) {
      pv.x = maxX - playerSize;
    }
    
    if ( pv.y  < playerSize/2 ) {
      pv.y = playerSize;
    }
    else if ( pv.y + playerSize/2 > maxY ) {
      pv.y = maxY -playerSize;
    }  
  }


//
// http://www.jeffreythompson.org/collision-detection/object_oriented_collision.php
//
  boolean checkCollision(Player other) {
    float distance = PVector.dist( pv, other.pv);
    if (distance < playerSize ) {
      if (lastDirection == rightDirection) {
        pv.x -= playerSize/2;
      } else if (lastDirection == leftDirection) {
        pv.x += playerSize/2;
      } else if (lastDirection == upDirection) {
        pv.y += playerSize/2;
      } else if (lastDirection == downDirection) {
        pv.y -= playerSize/2;
      }
      return true; 
    }
    wasMoved = false;
    return false;
  }


  void movePlayer(int direction) {

    lastDirection = direction;
    wasMoved = true;

    switch ( direction ) {
    case upDirection:
      pv.y -= speed;
      break;

    case downDirection:
      pv.y += speed;
      break;

    case leftDirection:
      pv.x -= speed;
      break;

    case rightDirection:
      pv.x += speed;
      break;

    default:
      return;
    }
  }
}
