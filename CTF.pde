//--------------Kristina Kosseva-----------------//
//---------------------CTF-----------------------//
//            version 1.2   27-Feb-2020
//
//      referencies:
// http://www.jeffreythompson.org/collision-detection/object_oriented_collision.php
//
  
  

// Constatnts that define the object (player or flag or...) movement direction
enum Directions {   noMovement, upDirection, downDirection, leftDirection, rightDirection };

// the maximum X and Y coordinates of the screen
final int maxX = 800;
final int maxY = 500;
//
final int flagSizeParameter = 30;
final int playerSizeParameter = 50;
//
final float flag1HomeX = maxX-5-flagSizeParameter;        // the 'home' X position of flag1
final float flag2HomeX = 5;         // the 'home' X position of flag2
final float flagsHomeY = maxY/2;    // the 'home' Y position for both flags
final float player1HomeX = 50;      // the 'home' X position of player1
final float player2HomeX = maxX-50; // the 'home' X position of player2
final float playersHomeY = maxY/2;    // the 'home' Y position for both flags

PImage imgPlayer1;
PImage imgPlayer2;

Player player1 = new Player(player1HomeX, playersHomeY, color(255, 20, 80));
Player player2 = new Player(player2HomeX, playersHomeY, color(140, 40, 40));

Flag flag1 = new Flag( flag1HomeX, flagsHomeY, color(150, 40, 40));
Flag flag2 = new Flag( flag2HomeX, flagsHomeY, color(40, 40, 150));

boolean bDisplayMessage = false;
String displayMessage;
int startTime;
final int DISPLAY_DURATION = 5000; // 5 seconds



void setup() {
  size(800, 500);
  //rectMode(CENTER);
  frameRate(120);
   imgPlayer1 = loadImage("Player1.jpg");
   imgPlayer2 = loadImage("Player2.jpg");
   player1.image = imgPlayer1;
   player2.image = imgPlayer2;
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
  }
  else {
    // we will be checking for the second player and the second flag
    player = player2;
    otherPlayer = player1;
    flag = flag2;
    otherFlag = flag1;
  }
  
  // 
  player.movePlayer(player.moveDirection);
  player.checkBoundaryCollision();
  //
  if ( flag.isFlagCaptured(player) ) {
    flag.CaptureTheFlag(player);
  }
  //
  //

  // check if collision between players 
  if ( player.CheckPlayersCollision(otherPlayer) == true) {
    if ( flag.isCaptured == true) {
      // drop the flag!
      flag.ResetCoordinates();
      flag.isCaptured = false;
    }
  }


  player.drawPlayer();
  flag.drawFlag();

  if (player.IsPlayerAtHomeWithFlag(flag) == true) {
    // flag was captured and brought to player home!
    player.score++;
    displayMessage = "Player " + nr + " WINS!";
    print(displayMessage);
    // Record the time of the event
    startTime = millis();    // time now
    bDisplayMessage = true;
    
    player.ResetCoordinates();
    flag.ResetCoordinates();
  }
}
