//based on my a3 code
//stores all info for any projectile

class Projectiles {
  PVector pos;
  PVector vel;
  PVector dim;
  boolean shown; //determines if the projectile is removed from the list or not
  PImage img; //image displayed in daw
  int rotation = 0; //connected to the spinning of the image
  
  //constructor
  Projectiles(PVector pos, PVector vel, PImage img, PVector dim){
    this.pos = pos;
    this.vel = vel;
    this.dim = dim;
    shown = true;
    this.img = img;
  }
  
  //basic move
  void move(){
    pos.add(vel);
  }
  
  //basic check walls
  void checkWalls(){
    if (pos.y < -dim.y/2) shown = false;
    if (pos.x > width) shown = false;
  }
  
  //basic update
  void update(){
    move();
    drawProjectile();
    checkWalls();
  }
  
  //basic draw
  void drawProjectile(){
    pushMatrix();
    translate(pos.x, pos.y);
    
    rotate(rotation * radians(-10));
    image(img, -dim.x, -dim.y);
    rotation += 1;
    rotation = rotation % 36;
    
    popMatrix();
  }
  
  //basic hit
  boolean hit(Characters e){ //checks collision between enemy and projectile
    if (abs(pos.x - e.pos.x) < (dim.x/2 + e.charWidth/2) && abs(pos.y - e.pos.y) < dim.y/2 + e.charHeight/2 && e.health > 0){
      shown = false;
      hit.play(0);
      return true;
    }
    return false;
  }
}
