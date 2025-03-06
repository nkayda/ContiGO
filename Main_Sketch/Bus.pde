//class for any info on the bus
//used in level two
//are added when the player hits a button, but their behaviour depends on other conditions

class Bus extends Ant {
  int waitTimer = 80; //how long the bus stays at the bu stop when the player succeeds

  //constructor for the bus, obvious fields
  Bus(PVector pos) {
    super(pos);
    this.vel = new PVector(-25, 0);
    this.charWidth = 1800;
    this.charHeight = 700;
    this.damp = 1;
  }

  //update function, obvious
  void update() {
    drawCharacter();
    moveCharacter();
    checkWalls();
  }

  //if the player wins succeeds, this method is called on the bus
  void updateWin() {
    drawCharacter();

    //moves the bus until it hits a certain point on the screen
    if (pos.x > width/2 - 300) {
      pos.add(vel);
    }

    //stops and waits
    //removes bottle from list so it disappears from the screen, then continues moving
    else {
      if (removedBottle == false) {
        bottle.remove(bottle.get(0));
        removedBottle = true;
      }
      waitTimer--;
      if (waitTimer < 0) {
        pos.add(vel);
      }
    }
  }

  //draws bus based on an array list and animates by running through each frame
  //same as the animation method i made, but this one has its own specific variable so it doesn't interfere with other animations
  void drawCharacter() {
    pushMatrix();
    translate(0, -300);

    for (int i = 0; i < busAni.length; i++) {
      busAni[i].resize(charWidth, charHeight);
    }
    if (frameCount % 10 == 0) {
      busInd++;
    }
    if (busInd == busAni.length) {
      busInd = 0;
    }
    image(busAni[busInd], pos.x, pos.y);

    popMatrix();
  }

  //if the bus hits the left side it will be removed from the list
  void checkWalls() {
    if (pos.x < -charWidth) bus.remove(this);
  }
}
