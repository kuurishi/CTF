//boolean keyLeft, keyRight, keyUp, keyDown;


//
// if a movement key was pressed, set the moveDirection of the object
// this will eventuall start moving the object ( from movePlayer() method )
//
void keyPressed() {
  switch (key) {   //--------------------Player 1 Movement---------------------//
  case 'a': 
  case 'A':
    player1.moveDirection =  Directions.leftDirection;
    break;
  
  case 'd':  // right
  case 'D':
    player1.moveDirection = Directions.rightDirection;
    break;

  case 'w':
  case 'W':
    player1.moveDirection = Directions.upDirection;
    break;
    
  case 's':
  case 'S':
    player1.moveDirection = Directions.downDirection;
    break;
  default:
    break;
   
  }
  
                   
  switch (keyCode){  //--------------------Player 2 Movement---------------------//
  case LEFT:
    player2.moveDirection = Directions.leftDirection;
    break;
  
  case RIGHT:
    player2.moveDirection = Directions.rightDirection;
    break;

  case UP:
    player2.moveDirection = Directions.upDirection;
    break;
    
  case DOWN:
    player2.moveDirection = Directions.downDirection;
    break;
    
  default: 
    //println("unkown key: " + key);
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
    player1.moveDirection =  Directions.noMovement;
    break;
  
  case 'd':  // right
  case 'D':
    player1.moveDirection = Directions.noMovement;
    break;

  case 'w':
  case 'W':
    player1.moveDirection = Directions.noMovement;
    break;
    
  case 's':
  case 'S':
    player1.moveDirection = Directions.noMovement;
    break;
  default:
    break;
   
  }
  
                   
  switch (keyCode){  //--------------------Player 2 Movement---------------------//
  case LEFT:
    player2.moveDirection = Directions.noMovement;
    break;
  
  case RIGHT:
    player2.moveDirection = Directions.noMovement;
    break;

  case UP:
    player2.moveDirection = Directions.noMovement;
    break;
    
  case DOWN:
    player2.moveDirection = Directions.noMovement;
    break;
    
  default: 
    //println("unkown key: " + key);
  }
  
}
