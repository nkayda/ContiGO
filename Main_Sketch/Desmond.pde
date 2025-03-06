//subclass of boss class
//basically just changed animation by using different arrays
//also changes projectile a bit

class Desmond extends Boss {
  boolean loss = false; //variable to make sure the deathtimer is changed only once
  
  //constructor
  Desmond(PVector pos) {
    super(pos);
    health = 15;
  }

  //drawing method
  //based on if the boss has been defeated or not
  //changes the array it takes frames from
  void drawCharacter() {
    pushMatrix();
    translate(pos.x, pos.y);

    if (deathSequenceBoss == -1) {
      playAnimation(desmondAnimation, 12, charWidth, charHeight, new PVector(-charWidth/2, -charHeight/2));
    }
    if (deathSequenceBoss > 0) {
      deathSequenceBoss--;
      playAnimation(desmondLossAnimation, 12, charWidth, charHeight, new PVector(-charWidth/2, -charHeight/2));
    }

    popMatrix();
  }

  //update function
  //drawing, updating, projectiles
  void update() {
    drawCharacter();
    checkProjectiles();
    if (frameCount % 50 == 0 && health > 0) {
      throwSound.play(0);
      noFill();
      stroke(255, 0, 0);
      for (int i = 0; i < 4; i++) {
        bossProjectiles.add(new Projectiles(new PVector(pos.x, pos.y+20), new PVector(-5, spray), timtams, new PVector(50, 70)));
        spray+=2;
        if (spray == 4) {
          spray = -4;
        }
      }
    }
    if (bossProjectiles.size() > 0) {
      for (int i = 0; i < bossProjectiles.size(); i++) {
        Projectiles currentProj = bossProjectiles.get(i);
        currentProj.update();
      }
    }

    //death consequences
    if (health == 0 && loss == false) {
      deathSequenceBoss = 180;
      loss = true;
      currentImgInd = 0;
    }
    if (deathSequenceBoss > 0) {
      deathSequenceBoss--;
      println(deathSequenceBoss);
    }
    if (deathSequenceBoss == 0) {
      bosses.remove(this);
      //player.health = 5;
      numBosses +=1;
    }
  }
}
