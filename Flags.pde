
//
// class Flag - has additinal flagSize and isCaptured properties.
//
public class Flag extends Object {

  
  int flagSize;       // The radius of the flag (rect)
  boolean isCaptured;


  //
  // Flag constructor - sets the default coordinates and default color
  //
  Flag(int x, int y, color c) {
    initalX = x;
    initalY = y;
    initialColor = c;
    ResetCoordinates();    // sets the current coordinates and color to the default (inital) values; 
    flagSize = 30;
    isCaptured = false;
    //pv.set(x, y);
    //colr = c;
  }



  //
  // draws the flag in different color, depending on whether the flag was captured or not
  //
  void drawFlag() {
    stroke(0);
    if (isCaptured == true){
      fill(20,20,20);
    }
    else{
      fill(colr);
    }
    rect(x, y, flagSize, flagSize);
  }
  
  

  //
  // returns true if the current flag is captured by the other player..
  // sets the 'isCaptured' property of the flag
  //
  boolean isFlagCaptured(Player player) { 
    // pv.x is the X coordinate of the flag; pv.y is the Y coordiante of teh flag
    PVector flagVector = new PVector(this.x, this.y );
    PVector playerVector = new PVector ( player.x, player.y);
    float distance = PVector.dist( flagVector, playerVector);
    
      if (distance < flagSize) {
        isCaptured = true;
    
        //print("captured");
      }
      else {
        isCaptured = false;
      }
      return isCaptured;
  }
  
  
  //
  // set the captured flag coordinates to be the same as the player that captured it!
  //
  void CaptureTheFlag ( Player player ) {
      this.CopyCoordinates( player);
  }
    
     
}
