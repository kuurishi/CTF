void keyPressed() {
  
  switch (key) {   //--------------------Player 1 Movement---------------------//
  
  case 'a': 
    player1.movePlayer(leftDirection); // = true;
    
    break;
  
  case 'd':  // right
    player1.movePlayer(rightDirection); // = true
    break;

  case 'w':
    player1.movePlayer(upDirection);
    break;
    
  case 's':
    player1.movePlayer(downDirection);
    break;
       
                    //--------------------Player 2 Movement---------------------//
  
  case 'j': 
    player2.movePlayer(leftDirection);
    break;
  
  case 'l':
    player2.movePlayer(rightDirection);
    break;

  case 'i':
    player2.movePlayer(upDirection);
    break;
    
  case 'k':
    player2.movePlayer(downDirection);
    break;
    
  default: 
    println("unkown key: " + key);
  }
  
  
}


void keyReleased(){

  switch (key) {   //--------------------Player 1 Movement---------------------//
  
  case 'a': 
    player1.movePlayer(leftDirection); // = false;
    
    break;
  
  case 'd':  // right
    player1.movePlayer(rightDirection); // = false
    break;

  case 'w':
    player1.movePlayer(upDirection);
    break;
    
  case 's':
    player1.movePlayer(downDirection);
    break;
       
                    //--------------------Player 2 Movement---------------------//
  
  case 'j': 
    player2.movePlayer(leftDirection);
    break;
  
  case 'l':
    player2.movePlayer(rightDirection);
    break;

  case 'i':
    player2.movePlayer(upDirection);
    break;
    
  case 'k':
    player2.movePlayer(downDirection);
    break;
    
  default: 
    println("unkown key: " + key);
  }
  





}
