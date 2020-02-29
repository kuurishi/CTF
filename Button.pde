
void GameStartMenu () {
  background(255);
  textSize(32);
  textAlign(CENTER);
  
  text("Player 1 keys : AWSD", maxX/2,50);
  text("Player 2 keys : arrows",maxX/2, 150);
  text("press any key for a start", maxX/2, maxY/2);
}

void GameEndMenu () {
  background(255);
  textSize(32);
  textAlign(CENTER);
  String winner;
  //determine who is the winner
 
 if ( players[0].score > players[1].score ) {
   winner = "Player 1 is the WINNER!";
 }
 else if ( players[0].score < players[1].score ) {
      winner = "Player 2 is the WINNER!";
 }
 else {
         winner = "TIE!";
 }
  
  text(winner, maxX/2, maxY/2);
  text("Pres space to play again", maxX/2, maxY/1.5);
  print ( winner );
}








/*


if PlayerScore = 3,
  display Game Winner: Player_



if ("Game Winner: Player_ " is displayed && any keyPressed) {
  display EndGameButton();

}




EndGameButton:

  - restartGame
      restart game scores && start newGame in the same load file
      
  - mainMenu 
      Start New (starts newGame, asks for Player 1 and Player 2 Names and creates a load file Name1_Name2) 
      Load (displays saved games (Example: Player2 won 3 games, Player1 won 2 games)
      Quit







*/
