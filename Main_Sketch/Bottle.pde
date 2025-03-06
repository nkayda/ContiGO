//player class
//holds information for the bottle (player) specifically

class Bottle extends Characters {
  float damp = 0.7;
  ArrayList<Projectiles> playerProjectiles = new ArrayList<Projectiles>();
  int tiltStyle = 0; //same system as the ants animation, but the rotation is adjusted instead of teh image changing
  int tiltAni = 1; //adds to the tilt style variable to compare later in drawCharacterLevelTwo()

  //constructor for the class takes in posiiton
  Bottle (PVector pos) {
    super(pos);
    charHeight = 160;
    charWidth = 70;
    health = 3;
  }

  //moves character accoring to the indicated velocity in keyboard input
  void moveCharacter() {
    pos.add(vel);
    vel.mult(damp); // this overwrites the other move method
  }

  //misc update things, obvious function
  void update() {
    drawCharacter();
    moveCharacter();
    checkWalls();
  }

  //different check walls for a different stage
  //prevents the player from getting too close to the boss
  void checkWallsTwo() {
    if (pos.x < charWidth-27) pos.x = charWidth-27;
    if (pos.x > width - 330 - charWidth/2) pos.x = width - 330 - charWidth/2;

    if (pos.y < (charHeight/2)) pos.y =  (charHeight/2);
    if (pos.y > height - (charHeight/2)-5) pos.y = height-(charHeight/2)-5;
  }

  //update specifically for the boss fight
  //this is so the player can shoot and the wall boundaries can be different
  void updateTwo() {
    drawCharacter();
    moveCharacter();
    checkWallsTwo();

    //updates and tracks projectile function
    for (int i = 0; i < playerProjectiles.size(); i++) {
      Projectiles currentProj = playerProjectiles.get(i);
      currentProj.update();
      if (bosses.size() > 0) {
        if (currentProj.hit(bosses.get(0)) && bosses.get(0).health > 0) {
          bosses.get(0).health--;
          currentProj.shown = false;
        }
      }
      if (!currentProj.shown) {
        playerProjectiles.remove(currentProj);
      }
    }
    
    //player death consequence
    if (health == 0) {
      state = BOSS_FIGHT_LOSE;
    }
  }

  //adds projectile so that the player can shoot if they are alive
  void shoot() {
    if (health > 0 && playerProjectiles.size() < 5) {
      playerProjectiles.add(new Projectiles(new PVector(pos.x, pos.y), new PVector(5, 0), splat, new PVector(20, 20)));
    }
  }

  //draws character in the desired position location and rotates according to the key input
  void drawCharacter() {
    pushMatrix();
    translate(pos.x, pos.y);

    if ((up == true && right == true) || (down == true && right == true)) rotate(radians(15));
    if ((up == true && left == true) || (down == true && left == true)) rotate(radians(-15));

    image(playerImg, -charWidth/2, -charHeight/2);
    popMatrix();
  }

  //draws character in the desired position location and tilts/shakes according to the tiltStyle system (only used in level 2)
  void drawCharacterLevelTwo() {
    pushMatrix();
    translate(pos.x, pos.y);

    tiltStyle += tiltAni;

    if (tiltStyle == 0) {
      tiltAni = 1;
    }
    if (tiltStyle == 20) {
      tiltAni = -1;
    }

    if (tiltAni == 1) {
      rotate(radians(5));
    }
    if (tiltAni == -1) {
      rotate(radians(-5));
    }

    image(playerImg, -charWidth/2, -charHeight/2);
    popMatrix();
  }
}
