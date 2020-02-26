//--------------Kristina Kosseva-----------------//
//---------------------CTF-----------------------//
//            version 1.1   26-Feb-2020


final int upDirection = 0;
final int downDirection = 1;
final int leftDirection = 2;
final int rightDirection = 4;
final int maxX = 500;
final int maxY = 300;

Player player1 = new Player(50, 50, color(255, 20, 80));
Player player2 = new Player(200, 200, color(140, 40, 40));

PVector f1init = new PVector( 30, maxY/2 );
PVector f2init = new PVector( maxX-30, maxY/2);

Flag flag1 = new Flag((int)f1init.x, (int)f1init.y, color(150, 40, 40));
Flag flag2 = new Flag((int)f2init.x, (int)f2init.y, color(40, 40, 150));

boolean borderHitByPlayer1 = false;  // Flags when Border is hit by Player 1
boolean borderHitByPlayer2 = false;  // Flags when Border is hit by Player 2

//boolean flagHitP1, flagHitP2; // Players bump into each other


void setup() {
  size(500, 300);
  frameRate(120);
}


void draw() {

  background(255, 255, 255);
  // 1. keypresed() eventually updates the players positions (chanegs x, y coordinates )
  // calls player.movePlayer() method, only if a move key was pressed
  // 2. Check for walls collisions
  // 3. Check players collision
  // 4. Dispaly the players
  drawMap();


  //flag1.isFlagCaptured(player1);
  flag1.isFlagCaptured(player2);
  flag2.isFlagCaptured(player1);
  //flag2.isFlagCaptured(player2);

  if (player1.wasMoved) {
    player1.checkBoundaryCollision();
    boolean isCollision = player1.checkCollision(player2); 
    if ( isCollision == true) {
      if ( flag1.isCaptured == true) {
        flag1.pv = f1init;
        flag1.isCaptured = false;
      }
      if ( flag2.isCaptured == true) {
        flag2.pv = f2init;
        flag2.isCaptured = false;
      }
    }
  }
  player1.drawPlayer();
  flag1.drawFlag();

  //
  if (player2.wasMoved) {
    player2.checkBoundaryCollision();
    boolean isCollision = player2.checkCollision(player1); // x,y is for player 2
    if ( isCollision == true) {
      if ( flag1.isCaptured == true) {
        flag1.pv = f1init;
        flag1.isCaptured = false;
      }
      if ( flag2.isCaptured == true) {
        flag2.pv = f2init;
        flag2.isCaptured = false;
      }
    }
    player2.drawPlayer();
    flag2.drawFlag();
  }
}
