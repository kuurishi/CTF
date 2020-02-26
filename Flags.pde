
public class Flag extends Object {

  
  int flagSize; //Radius of the flag (rect)
  boolean isCaptured;

  Flag(int x, int y, color c) {
    flagSize = 30;
    isCaptured = false;
    pv.set(x, y);
    colr = c;
  }


  void drawFlag() {
    stroke(0);
    
     
    if (isCaptured == true){
      fill(20,20,20);
    }
    else{
      fill(colr);
    }
    
    
    rect(pv.x, pv.y, flagSize, flagSize);
  }
  
  


  //
  // http://www.jeffreythompson.org/collision-detection/object_oriented_collision.php
  //
  
  

  //
  boolean isFlagCaptured(Player player) { 
    // pv.x is the X coordinate of the flag; pv.y is the Y coordiante of teh flag
 
    float distance = PVector.dist( pv, player.pv);
    
      if (distance < flagSize) {
        isCaptured = true;
        pv.x = player.pv.x;
        pv.y = player.pv.y;
        print("captured");
      }
      else {
        isCaptured = false;
      }
      
      return isCaptured;
      
  }
    
     
}
    /* 
     
     
     
     
           
   //if (player.distance){ //flag is captured
     if (flag.pv = player.pv){
     switch(){
     case 'player vs player collision': 
     drop flag;
     playerSpeed = 0 for 3 seconds;
     case 'score': 
     case 1 = false;
     score point;
     }

     else{
     return;
     }
     
     
     float distance = PVector.dist(Flag, Player);
     if (distance < flagSize) {
     if (lastDirection == rightDirection) {
     pv.x -= flagSize/2;
     } else if (lastDirection == leftDirection) {
     pv.x += playerSize/2;
     } else if (lastDirection == upDirection) {
     pv.y += playerSize/2;
     } else if (lastDirection == downDirection) {
     pv.y -= playerSize/2;
     }
     }
     wasMoved = false;
     }
     
     
     void movePlayer(int n) {
     
     lastDirection = direction;
     wasMoved = true;
     
     switch ( direction ) {
     case upDirection:
     pv.y -= speed;
     break;
     
     case downDirection:
     pv.y += speed;
     break;
     
     case leftDirection:
     pv.x -= speed;
     break;
     
     case rightDirection:
     pv.x += speed;
     break;
     
     default:
     return;
     }
     }
     }
     */
