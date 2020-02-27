//
// class Player
//
public class Player extends Object  {

  
  int playerSize; // the radius of the Player (circle)
  int score;      // game score for the player

  //
  // Player constructor - set up the initalX, initalY and initalColor when the object is created
  //
  Player(int x, int y, color c) {
    playerSize = 50;      // TODO !!
    this.x = homeX = x;
    this.y = homeY = y;
    //pv.set(x,y);
    this.colr = initialColor = c;
    speed = 3;
    score = 0;
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
  
  
  //
  // retuns true if:
  //     first player brings the flag back to the left  of the screen
  //    second player brings the flag back to the right of the screen
  boolean IsPlayerAtHomeWithFlag ( Flag flag ) {
    int playerNumber;

    // first determine whether we are checking for the first player home or for the second player home X position?
    if (this.homeX < maxX/2) {
      // the inital X coordinate of the player is in the left part of the screen
      playerNumber = 1;
    }
    else {
      playerNumber = 2;
    }
    
        
    if ( flag.isCaptured == false ) {
      // flag s not captured at all!
      return false;
    }
    
    
    // the player is carrying the flag!
    switch ( playerNumber ) {
      case 1:
        if (this.x <= this.homeX) {
          print("flag 1 at home! ");
          return true;
        }
        break;
      case 2:
        if (this.x >= this.homeX) {
          print("flag 2 at home! ");
          return true;
        }
        break;
      default:
        return false;     // wrong flag number
    }
    return false;
  }
    
 
  
  
  
  
  
  
}
