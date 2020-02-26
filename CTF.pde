 //--------------Kristina Kosseva-----------------//
//---------------------CTF-----------------------//

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
      // 2. Dispaly the players
  player1.drawPlayer();
  player2.drawPlayer();
      // 3. Check for walls collisions
  player1.checkBoundaryCollision();
  player2.checkBoundaryCollision();
      // 4. Check players collision
      
  if (player1.wasMoved) {
      player1.checkCollision(player2); //x,y is for player 1
  }
  if (player2.wasMoved) {
    player2.checkCollision(player1); // x,y is for player 2
  }
}
