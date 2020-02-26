//--------------Kristina Kosseva-----------------//
//---------------------CTF-----------------------//
//            version 1.1   26-Feb-2020


final int upDirection = 0;
final int downDirection = 1;
final int leftDirection = 2;
final int rightDirection = 4;
final int maxX = 1420;
final int maxY = 800;

Player player1 = new Player(50, 50, color(255,20,80));
Player player2 = new Player(200, 200, color(140,40,40));

boolean borderHitByPlayer1 = false;  // Flags when Border is hit by Player 1
boolean borderHitByPlayer2 = false;  // Flags when Border is hit by Player 2

//boolean flagHitP1, flagHitP2; // Players bump into each other


void setup() {
  size(1420,800);
  frameRate(120);

}


void draw() {
  
  background(255,255,255);
      // 1. keypresed() eventually updates the players positions (chanegs x, y coordinates )
      // calls player.movePlayer() method, only if a move key was pressed
      // 2. Check for walls collisions
      // 3. Check players collision
      // 4. Dispaly the players
      
  if (player1.wasMoved) {
    player1.checkBoundaryCollision();
    player1.checkCollision(player2); //x,y is for player 1
  }
  player1.drawPlayer();
  //
  if (player2.wasMoved) {
    player2.checkBoundaryCollision();
    player2.checkCollision(player1); // x,y is for player 2
  }
  player2.drawPlayer();

}
