// based off my a3
//basic character superclass that all moving entities are tied to

class Characters {
  PVector pos;
  PVector vel;
  int health;
  int charWidth;
  int charHeight;

  float damp = 1;

  //constructor
  Characters(PVector pos) {
    this.pos = pos;
    this.vel = new PVector();
  }

  //basic move
  void moveCharacter() {
    pos.add(vel);
    vel.mult(damp);
  }

  //basic accellerate used for player
  void accelerate(PVector directionMovement) {
    vel.add(directionMovement);
  }

  //placeholder drawing method
  void drawCharacter() {
    pushMatrix();
    translate(pos.x, pos.y);
    noStroke();
    fill(255, 0, 0);
    rect(-charWidth/2, -charHeight/2, charWidth, charHeight, 5);
    popMatrix();
  }

  //basic hit method
  boolean hitCharacter(Characters c){ // checks collision between characters
    //if the position of c is __ compared to this.pos.x, this.pos.y do something
    if (abs(pos.x - c.pos.x)-30 < (charWidth/2 + c.charWidth/2)-30 && abs(pos.y - c.pos.y)-30 < (charHeight/2 + c.charHeight/2)-30){
      return true;
    }
    return false;
  }

  //obvious
  void decreaseHealth(int damage){
    if(hitCharacter(this)){
      health -= damage;
    }
  }

  //default wall checker
  void checkWalls() {
    if (pos.x < charWidth-27) pos.x = charWidth-27; 
    if (pos.x > width - charWidth/2) pos.x = width - charWidth/2;
    
    if (pos.y < (charHeight/2)) pos.y =  (charHeight/2);
    if (pos.y > height - (charHeight/2)-5) pos.y = height-(charHeight/2)-5;
  }

  //basic update
  void update() {
    moveCharacter();
    checkWalls();
  }
}
