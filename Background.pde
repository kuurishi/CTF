void drawMap() {

  noStroke();
  fill(200, 30, 60, 90);
  rect(0, 0, width/2, height); //red background

  fill(60, 30, 200, 90);
  rect(width/2, 0, width/2, height); //blue background
  
  // draw the obstacles map
  for ( int obst=0; obst<obstacles.length; obst++ ) {
    obstacles[obst].Draw();
  }
}


void DisplayGameMessages () {
  if (gameState == GateState.gamePlay) {
    textAlign(LEFT);
    textSize(32);
    text("Player 1 score : "+player1.score, 50, 50);
    text("Player 2 score : "+player2.score, maxX/2+50, 50);

    if (bDisplayMessage == true ) {
      if (millis() - startTime  <= DISPLAY_DURATION) {
        text(displayMessage, maxX/2-100, maxY-50);
      } else {
        bDisplayMessage = false;
      }
    }
  }
}
