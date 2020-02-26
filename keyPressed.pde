boolean keyLeft, keyRight, keyUp, keyDown;



void keyReleased(){

  switch (key) {   //--------------------Player 1 Movement---------------------//
  
  case 'a': 
    player1.movePlayer(leftDirection);
    keyLeft = false;
    break;
  
  case 'd':  // right
    player1.movePlayer(rightDirection);
    keyRight = false;
    break;

  case 'w':
    player1.movePlayer(upDirection);
    keyUp = false;
    break;
    
  case 's':
    player1.movePlayer(downDirection);
    keyDown = false;
    break;
  }       
                   //--------------------Player 2 Movement---------------------//
  switch (keyCode){
  case LEFT:
    player2.movePlayer(leftDirection);
    keyLeft = false;
    break;
  
  case RIGHT:
    player2.movePlayer(rightDirection);
    keyRight = false;
    break;

  case UP:
    player2.movePlayer(upDirection);
    keyUp = false;
    break;
    
  case DOWN:
    player2.movePlayer(downDirection);
    keyDown = false;
    break;
    
  default: 
    println("unkown key: " + key);
  }
  
}


void keyPressed() {

  switch (key) {   //--------------------Player 1 Movement---------------------//
  
  case 'a': 
  case 'A':
    player1.movePlayer(leftDirection); // = true;
    keyLeft = true;
    break;
  
  case 'd':  // right
    player1.movePlayer(rightDirection); // = true
    keyRight = true;
    break;

  case 'w':
    player1.movePlayer(upDirection);
    keyUp = true;
    break;
    
  case 's':
    player1.movePlayer(downDirection);
    keyDown = true;
    break;
  }
  
                   //--------------------Player 2 Movement---------------------//
  switch (keyCode){
  case LEFT:
    player2.movePlayer(leftDirection);
    keyLeft = true;
    break;
  
  case RIGHT:
    player2.movePlayer(rightDirection);
    keyRight = true;
    break;

  case UP:
    player2.movePlayer(upDirection);
    keyUp = true;
    break;
    
  case DOWN:
    player2.movePlayer(downDirection);
    keyDown = true;
    break;
    
  default: 
    println("unkown key: " + key);
  }
  
}
