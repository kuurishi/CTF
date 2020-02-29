//
// class Player
//
public class Player extends Object {

  int score;      // game score for the player

  //
  // Player constructor - set up the initalX, initalY and initalColor when the object is created
  //
  Player(float x, float y, color c) {
    super(x,y,c);                      // set the object x,y and color.
    objectType = ObjectType.T_CIRCLE;
    size = playerSizeParameter;        // 50 diameter
    speed = 3;
    score = 0;
  }



  void drawPlayer() {
    Draw();
  }


  void checkBoundaryCollision () {

    if ( x < size/2 ) {
      x  = size;
    } else if ( x + size/2 > maxX ) {
      x = maxX - size;
    }

    if ( y  < size/2 ) {
      y = size;
    } else if ( y + size/2 > maxY ) {
      y = maxY -size;
    }
  }


  //
  // http://www.jeffreythompson.org/collision-detection/object_oriented_collision.php
  //
  boolean CheckPlayersCollision(Player other) {
    
    // clalculate the disctance between the two objects of a type T_CIRCLE ..
    float distance = Distance(this, other);
    // ee if the distance between them is less than the sum of their radii.
    if (distance < (this.size/2 + other.size/2 )) {
      // move the player in the bacward direction!
      if (moveDirection == Directions.rightDirection) {
        x -= size/2;
      } else if (moveDirection == Directions.leftDirection) {
        x += size/2;
      } else if (moveDirection == Directions.upDirection) {
        y += size/2;
      } else if (moveDirection == Directions.downDirection) {
        y -= size/2;
      }
      return true;
    }
    return false;
  }


  void movePlayer(Directions direction) {
    moveObject ( direction );
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
    } else {
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
