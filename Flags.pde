/* class Flag {

  int posX, posY; //Center Coordinates of Player Picture
  int flagSize; //Radius of the Player (circle)
  color colr; //Color of the Player


  Player(int x, int y, color c) {
    flagSize = 50;
    posX = x;
    posY = y;
    colr = c;
  }


  void drawFlag() {

    fill(colr);
    ellipse(posX, posY, flagSize, flagSize);
  }








}


/* 

----------------------Flag Looks/Characteristics:------------------------------

  Flag 1:
    - default state
    - item boost state
  
  Flag 2:
    - default state
    - item boost state

class flag()
-----------------Player has the Flag:-------------------

 
  Player 1 has Flag:

    If (PlayerPos == FlagPos other){
      FlagPos other =PlayerPos; 
      
      keep this state until PlayerPos = BorderPlayer
      or playercollision
    }
    
      
    if (Player1Pos == Flag2Pos) && Player1Pos == BorderPlayer1{
      display "Winner: Player 1"
      
    }
      
    
    
  Player 2 has Flag:

    If (Player2Pos == Flag1Pos){
      Flag1Pos=Player2Pos; 
      keep this state until Player2Pos = BorderPlayer2
      or playercollision
    }
    
    if (Player2Pos == Flag1Pos) && Player2Pos == BorderPlayer2{
      display "Winner: Player 2"
    }
      





*/
