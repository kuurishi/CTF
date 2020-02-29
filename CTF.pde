//--------------Kristina Kosseva-----------------//
//---------------------CTF-----------------------//
//            version 1.2   27-Feb-2020
// Krisi branch
//
//      reference:
// http://www.jeffreythompson.org/collision-detection/object_oriented_collision.php
//
  
  

// Constatnts that define the object (player or flag or...) movement direction
final int noMovement = 0;
final int upDirection = 1;
final int downDirection = 2;
final int leftDirection = 3;
final int rightDirection = 4;

// the maximum X and Y coordinates of the screen
final int maxX = 960;
final int maxY = 480;
//
final int flagSizeParameter = 30;
//
final int flag1HomeX = maxX-5-flagSizeParameter;        // the 'home' X position of flag1
final int flag2HomeX = 50;         // the 'home' X position of flag2
final int flagsHomeY = maxY/2;    // the 'home' Y position for both flags
final int player1HomeX = 50;      // the 'home' X position of player1
final int player2HomeX = maxX-50; // the 'home' X position of player2
final int playersHomeY = maxY/2;    // the 'home' Y position for both flags


Player player1 = new Player(player1HomeX, playersHomeY, color(255, 20, 80));
Player player2 = new Player(player2HomeX, playersHomeY, color(140, 40, 40));



boolean bDisplayMessage = false;
String displayMessage;
int startTime;
final int DISPLAY_DURATION = 5000; // 5 seconds

Flag flag1;
Flag flag2;

void setup() {
  size(960, 480);
  frameRate(120);
  
  flag1 = new Flag( flag1HomeX, flagsHomeY);
  flag2 = new Flag( flag2HomeX, flagsHomeY);
  
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

  // check collision between players 
  if ( player.checkCollision(otherPlayer) == true) {
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
    displayMessage = "Player " + nr + " SCORES!";
    print(displayMessage);
    // Record the time of the event
    startTime = millis();    // time now
    bDisplayMessage = true;
    
    player.ResetCoordinates();
    flag.ResetCoordinates();
    
  }


    if(player.score == 3){ //--------------------------- DISPLAY WINNER & RESTART GAME(displays restart button. if restart button is pressed, set score to 0 and restart coordinates) ---------------------------//
      // flag was brought to player home 3 times
      displayMessage = "Player " + nr + " WINS!";
      
    }
    
}
