//
// class Player
//
public class Player extends Object {

  int score;      // game score for the player

  //
  // Player constructor - set up the initalX, initalY and initalColor when the object is created as a Circle..
  //
  Player(float x, float y, color c) {
    super(x, y, playerSizeParameter, playerSizeParameter, c);                      // set the object x,y and color.
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


  //
  // Check Player Collision to Obstacle
  boolean CheckPlayerCollisionToObstacle(Obstacle obst) {
    // clalculate the disctance between the two objects of a type T_CIRCLE and T_RECTANGLE
    float distance = Distance(this, obst);
    // if the distance between them is less than the radius of the player
    if (distance < (this.size/2 + speed)) {            // add speed for safety ( this is one step ahead in the movement direction )
      // move the player in the bacward direction!
      if (moveDirection == Directions.rightDirection) {
        x -= size/4;
      } else if (moveDirection == Directions.leftDirection) {
        x += size/4;
      } else if (moveDirection == Directions.upDirection) {
        y += size/4;
      } else if (moveDirection == Directions.downDirection) {
        y -= size/4;
      }
      return true;
    }
    return false;
  }




  void movePlayer() {
    //Directions dir = moveDirection;
    moveObject ( );
  }




  //
  // returns true if the current flag is captured by the other player..
  // sets the 'isCaptured' property of the flag
  //
  boolean isPlayerCapturingTheFlag(Flag flag) { 
    boolean isFlagCaptured;
    // calculate the distance between the player (circle) and this flag (rectangle)
    float distance = Distance( this, flag );    

    if (distance < flag.size/2 + this.size/2) {
      isFlagCaptured = true;
      //print("captured");
    } else {
      isFlagCaptured = false;
    }
    return isFlagCaptured;
  }



  // Checks whether the player is at home with the flag..
  // retuns true if:
  //     first player brings the flag back to the left  of the screen
  //    second player brings the flag back to the right of the screen
  boolean IsPlayerAtHomeWithFlag ( Flag flag ) {

    if (flag.isCaptured == false )
      return false;    // the flag is not captured at all

    // calculate the distance between the player X position and his home X position
    // the Y position is set to zero for the calculation!
    if ( dist(this.x, 0, this.homeX, 0) <= this.speed )  // less than 1 moving step ( speed )
      return true;
    else
      return false;
  }
}
