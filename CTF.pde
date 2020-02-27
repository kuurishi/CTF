//--------------Kristina Kosseva-----------------//
//---------------------CTF-----------------------//
//            version 1.2   27-Feb-2020
//
//      referencies:
// http://www.jeffreythompson.org/collision-detection/object_oriented_collision.php
//
  
  

// Constatnts that define the object (player or flag or...) movement direction
final int noMovement = 0;
final int upDirection = 1;
final int downDirection = 2;
final int leftDirection = 3;
final int rightDirection = 4;

// the maximum X and Y coordinates of the screen
final int maxX = 500;
final int maxY = 300;

Player player1 = new Player(50, 50, color(255, 20, 80));
Player player2 = new Player(200, 200, color(140, 40, 40));

Flag flag1 = new Flag( 30, maxY/2 , color(150, 40, 40));
Flag flag2 = new Flag( maxX-30, maxY/2, color(40, 40, 150));


void setup() {
  size(500, 300);
  frameRate(120);
}


void draw() {

  background(255, 255, 255);
  //
  // 1. keypresed() eventually updates the players positions (chanegs x, y coordinates )
  // calls player.movePlayer() method, only if a move key was pressed
  // 2. Check for walls collisions
  // 3. Check players collision
  // 4. Dispaly the players

  drawMap();

  Update( 1);
  Update( 2);

}


// Updates player1 or player2 depending on nr parameter
// Updates flag1 or flag2 depending on nr parameter
//
void Update ( int nr) {
  Player player, otherPlayer;
  Flag flag, otherFlag;
  //PVector init;
  
  if ( nr == 1 ) {
    // we will be checking for the first player and the first flag
    player = player1;
    otherPlayer = player2;
    flag = flag1;
    otherFlag = flag2;
    //init = f1init;
  }
  else {
    // we will be checking for the second player and the second flag
    player = player2;
    otherPlayer = player1;
    flag = flag2;
    otherFlag = flag1;
    //init = f2init;
  }
  
  // 
  player.movePlayer(player.moveDirection);
  //
  if ( flag.isFlagCaptured(otherPlayer) ) {
    flag.CaptureTheFlag(otherPlayer);
  }
  //
  player.checkBoundaryCollision();
  //

  // check if collision between players 
  if ( player.checkCollision(otherPlayer) == true) {
    if ( flag.isCaptured == true) {
      // drop the flag!
      flag.ResetCoordinates();
      flag.isCaptured = false;
    }
  }


  player.drawPlayer();
  flag.drawFlag();

}
