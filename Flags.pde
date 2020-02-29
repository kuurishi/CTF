//
// class Flag - has additinal and isCaptured properties.
//
public class Flag extends Object {

  boolean isCaptured;
  
  //
  // Flag constructor - sets the default coordinates and default color
  //
  Flag(float x, float y, color c) {
    super(x, y, c);    // sets the base class constructor 
    objectType = ObjectType.T_RECTANGLE;
    size = flagSizeParameter;    
    isCaptured = false;
  }


  //
  // draws the flag in different color, depending on whether the flag was captured or not
  //
  void drawFlag() {
    if (isCaptured == true) 
      colr = color(20, 20, 20);
    else 
      colr = initialColor;
    Draw();
  }



  //
  // returns true if the current flag is captured by the other player..
  // sets the 'isCaptured' property of the flag
  //
  boolean isFlagCaptured(Player player) { 
    // calculate the distance between the player (circle) and this flag (rectangle)
    float distance = Distance( player, this );    

    if (distance < this.size/2 + player.size/2) {
      isCaptured = true;
      //print("captured");
    } else {
      isCaptured = false;
    }
    return isCaptured;
  }


  //
  // set the captured flag coordinates to be the same as the player that captured it!
  //
  void CaptureTheFlag ( Player player ) {
    //this.CopyCoordinates( player);
    this.AttachToUpperRight( player);
  }
}
