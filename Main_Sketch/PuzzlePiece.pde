//class for individual puzzle pieces

class PuzzlePiece extends Characters {
  PVector corrPos; //the correct position for the piece, is checkec in the level
  float damp = 0.7;
  PImage img;

  //constructor
  PuzzlePiece(PVector pos, PVector corrPos, PImage img) {
    super(pos);
    this.corrPos = corrPos;
    charHeight = 120;
    charWidth = 120;
    this.img = img;
  }

  //basic draw
  void drawCharacter() {
    pushMatrix();
    translate(pos.x, pos.y);

    fill(200, 0);
    rect(-charWidth/2, -charHeight/2, charWidth, charHeight);
    
    image(img, -charWidth/2, -charHeight/2);
    
    popMatrix();
  }

  //basic update
  void update() {
    drawCharacter();
    if (this.pos != this.corrPos) {
      moveCharacter();
    }
    checkWalls();
  }

  //same move method as player
  void moveCharacter() {
    pos.add(vel);
    vel.mult(damp);
  }
  
  //sets particular boundaries for the movement
  void checkWalls() {
    if (pos.x < charWidth-30) pos.x = charWidth-30; 
    if (pos.x > width - charWidth/2-240) pos.x = width - charWidth/2-240;
    
    if (pos.y < (charHeight/2)+70) pos.y =  (charHeight/2)+70;
    if (pos.y > height - (charHeight/2)-25) pos.y = height-(charHeight/2)-25;
  }
}
