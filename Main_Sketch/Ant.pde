//class for the ant enemies in level 1
//they crawl across the screen and damage the character when they collide
//they spawn every once in a while (in an arraylist) and then are removed when the get to the edge of the screen

class Ant extends Characters{
  int antStyle = 0; //determines which frame is shown in the animation
  int antAni = 1; //is what is added to the ant animation to switch between when appropriate

  //constructor for the class, takes parameter for the position
  Ant(PVector pos) {
    super(pos);
    health = 2;
    charHeight = 90;
    charWidth = 150;
  }

  //moves, draws, etc appropriate actions and tracks damage when thje ant hits the player
  void update() {
    pos.add(vel);
    drawCharacter();
    checkWalls();
    if (hitCharacter(player) == true){
      player.health -= 1;
      levelOneScore -= 25;
      fill(255, 0, 0);
      ants.remove(this);
      println(player.health);
    }
  }

  //switches between the two frames that make up the ant
  void drawCharacter() {
    pushMatrix();
    translate(pos.x, pos.y);
    antStyle += antAni;
    
    //fill(255, 0, 0);
    //rect(-charWidth/2, (-charHeight/2)+10, charWidth/3, charHeight);
    //fill(0, 255, 0);
    //rect(-30, 0, charWidth-40, charHeight-15);
    
    if (antStyle == 0){
      antAni = 1;
    }
    if (antStyle == 20){
      antAni = -1;
    }
    
    if (antAni == 1){
      image(antImg1, (-charWidth/2)-10, (-charHeight/2)-10);
    }
    if (antAni == -1){
      image(antImg2, (-charWidth/2)-10, (-charHeight/2)-10);
    }
    popMatrix();
  }
  
  //checks to see if the ant hits the player, takes player as the parameter to compare positions
  boolean hitCharacter(Characters c){ // checks collision between characters
    //if the position of c is __ compared to this.pos.x, this.pos.y do something
    if (abs(pos.x - c.pos.x) < (charWidth/2 + c.charWidth/2) && abs(pos.y - c.pos.y) < (charHeight/4 - 10 + c.charHeight/2)){
      hit.play(0);
      return true;
    }
    return false;
  }
  
  //checks to see if the ant has hit the left wall and removes from rhe arraylist if it does
  void checkWalls() {
    if (pos.x < -charWidth/2) ants.remove(this); 
  }
}
