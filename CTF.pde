//--------------Kristina Kosseva-----------------//
//---------------------CTF-----------------------//
//            version 1.2   27-Feb-2020
//
//      referencies:
// http://www.jeffreythompson.org/collision-detection/object_oriented_collision.php
//

// the maximum X and Y coordinates of the screen
final int maxX = 800;
final int maxY = 600;
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

// create the array of players
Player player1 = new Player(player1HomeX, playersHomeY, color(255, 20, 80));
Player player2 = new Player(player2HomeX, playersHomeY, color(140, 40, 40));
Player[] players = {player1, player2};

// create the array of flags
Flag flag1 = new Flag( flag1HomeX, flagsHomeY, color(150, 40, 40));
Flag flag2 = new Flag( flag2HomeX, flagsHomeY, color(40, 40, 150));
Flag[] flags = {flag1, flag2};

// display messages variables
boolean bDisplayMessage = false;
String displayMessage;
int startTime;
final int DISPLAY_DURATION = 5000; // 5 seconds

GateState gameState = GateState.gameStartMenu;
boolean isGameOver = false;
int gameNumber = 0;
final int MaxGames = 3;


void setup() {
  size(800, 600);

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
  drawMap();
  //
  switch ( gameState ) {
    case gameStartMenu:
      GameStartMenu();
      if (keyPressed) {
         gameState = GateState.gamePlay;
         gameNumber = 0;
         players[0].score = players[1].score = 0;
         isGameOver = false;
      }
      break;
      
    case gamePlay:
      PlayTheGame();
      DisplayGameMessages();
      if (isGameOver) {
        gameState = GateState.gameEndMenu;
      }
      break;
      
    case gameEndMenu:
      GameEndMenu();
      if ( keyPressed ) {        
        if ( key == ' ' ) {
          // space key - play again!
          gameState = GateState.gameStartMenu;
          isGameOver = false;
        }
        else if ( keyCode == ESC ){
          exit();
        }
      }

      break;
  }

} // end of Draw()





void PlayTheGame () {
  


  // for each player
  for ( int playerNr=0; playerNr<players.length; playerNr++ ) {
    // temporary variables for code clarity ..
    Player player = players[playerNr];
    Flag flag = flags[playerNr];
    
    // move players checking for boundary collisions
    player.movePlayer();
    player.checkBoundaryCollision();
    //
    // check if the current player has captured the flag?
    if ( players[playerNr].isPlayerCapturingTheFlag(flag) ) {
      flag.isCaptured = true;    // the flag object number is the same as the player number, i.e. flag1 belongs to player1
      flag.CaptureTheFlag(player);
    }
    //
    //
    // check the current player for collision to other players
    for ( int otherPlayerNr=0; otherPlayerNr<players.length; otherPlayerNr++ ) {
      if ( playerNr != otherPlayerNr) {    // do not check for a player collision with himelf! :) 
        if ( player.CheckPlayersCollision(players[otherPlayerNr]) == true) {
          // the player that we are checking has now bumped into other player!
          if ( flag.isCaptured == true) {  // did the bumping player wear a flag?
            // whoever bumps other players, he drops the flag!
            flag.ResetCoordinates();
            flag.isCaptured = false;
          }
        }
      }
    }
    //
    if ( player.IsPlayerAtHomeWithFlag(flag) == true) {
      // flag was captured and brought to player home!
      player.score++;
      displayMessage = "Player " + (playerNr+1) + " WINS!";
      print(displayMessage);
      // Record the time of the event
      startTime = millis();    // time now
      bDisplayMessage = true;
      // play again!
      player.ResetCoordinates();
      flag.ResetCoordinates();
      flag.isCaptured = false;
      //
      gameNumber++;
      if (gameNumber >= MaxGames) {
        gameState = GateState.gameEndMenu;
      }
      
    }
    // 
    players[playerNr].drawPlayer();
  } // for each player

  // draw the flags
  for ( int flagNr=0; flagNr<flags.length; flagNr++ ) {
    flags[flagNr].drawFlag();
  }
  
}
