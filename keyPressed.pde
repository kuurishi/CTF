//boolean keyLeft, keyRight, keyUp, keyDown;


//
// if a movement key was pressed, set the moveDirection of the object
// this will eventually start moving the object ( from movePlayer() method )
//
void keyPressed() {
  switch (key) {   //--------------------Player 1 Movement---------------------//
  case 'a': 
  case 'A':
    player1.moveDirection =  leftDirection;
    break;
  
  case 'd':  // right
  case 'D':
    player1.moveDirection = rightDirection;
    break;

  case 'w':
  case 'W':
    player1.moveDirection = upDirection;
    break;
    
  case 's':
  case 'S':
    player1.moveDirection = downDirection;
    break;
  default:
    break;
   
  }
  
                   
  switch (keyCode){  //--------------------Player 2 Movement---------------------//
  case LEFT:
    player2.moveDirection = leftDirection;
    break;
  
  case RIGHT:
    player2.moveDirection = rightDirection;
    break;

  case UP:
    player2.moveDirection = upDirection;
    break;
    
  case DOWN:
    player2.moveDirection = downDirection;
    break;
    
  default: 
    break;
  }
  
}


//
// if a movement key was released, set the moveDirection of the object
// this will eventuall STOP moving the object ( from movePlayer() method )
//
void keyReleased(){

  switch (key) {   //--------------------Player 1 Movement---------------------//
  case 'a': 
  case 'A':
    player1.moveDirection =  noMovement;
    break;
  
  case 'd':  // right
  case 'D':
    player1.moveDirection = noMovement;
    break;

  case 'w':
  case 'W':
    player1.moveDirection = noMovement;
    break;
    
  case 's':
  case 'S':
    player1.moveDirection = noMovement;
    break;
  default:
    break;
   
  }
  
                   
  switch (keyCode){  //--------------------Player 2 Movement---------------------//
  case LEFT:
    player2.moveDirection = noMovement;
    break;
  
  case RIGHT:
    player2.moveDirection = noMovement;
    break;

  case UP:
    player2.moveDirection = noMovement;
    break;
    
  case DOWN:
    player2.moveDirection = noMovement;
    break;
    
  default: 
    break;
  }
  
}
