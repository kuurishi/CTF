//
// class Player
//
public class Player extends Object  {

  
  int playerSize; //Radius of the Player (circle)

  //
  // Player constructor - set up the initalX, initalY and initalColor when the object is created
  //
  Player(int x, int y, color c) {
    playerSize = 50;      // TODO !!
    this.x = initalX = x;
    this.y = initalY = y;
    //pv.set(x,y);
    this.colr = initialColor = c;
    speed = 3;
  }


  void drawPlayer() {
    stroke(0);
    fill(colr);
    ellipse(x, y, playerSize, playerSize);
  }


  void checkBoundaryCollision () {
    
    if ( x < playerSize/2 ) {
      x  = playerSize;
    }
    else if ( x + playerSize/2 > maxX ) {
      x = maxX - playerSize;
    }
    
    if ( y  < playerSize/2 ) {
      y = playerSize;
    }
    else if ( y + playerSize/2 > maxY ) {
      y = maxY -playerSize;
    }  
  }


//
// http://www.jeffreythompson.org/collision-detection/object_oriented_collision.php
//
  boolean checkCollision(Player other) {
    PVector thisPlayer = new PVector ( this.x, this.y);
    PVector otherPlayer = new PVector ( other.x, other.y);
    float distance = PVector.dist ( thisPlayer, otherPlayer);
    if (distance < playerSize ) {
      if (moveDirection == rightDirection) {
        x -= playerSize/2;
      } else if (moveDirection == leftDirection) {
        x += playerSize/2;
      } else if (moveDirection == upDirection) {
        y += playerSize/2;
      } else if (moveDirection == downDirection) {
        y -= playerSize/2;
      }
      return true; 
    }
    return false;
  }


  void movePlayer(int direction) {

    moveDirection = direction;

    switch ( direction ) {
    case upDirection:
      y -= speed;
      break;

    case downDirection:
      y += speed;
      break;

    case leftDirection:
      x -= speed;
      break;

    case rightDirection:
      x += speed;
      break;

    default:
      return;
    }
  }
}
