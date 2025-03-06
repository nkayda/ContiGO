//base parent class for the three different bosses
//stores the methods the all have in common as wel as the ones that will be replaced

class Boss extends Characters {
  ArrayList<Projectiles> bossProjectiles = new ArrayList<Projectiles>();
  int spray = -4; //changes the velocity of the projectiles so they spray out at an angle
  int deathSequenceBoss = -1; //death visuals indicator

  Boss(PVector pos) {
    super(pos);
    charWidth = 300;
    charHeight = 500;
    health = 8;
    this.vel = new PVector(-3,0);
  }

  //base drawing method (is different for each subclass)
  void drawCharacter() {
    pushMatrix();
    translate(pos.x, pos.y);
    
    fill(255, 0, 0);
    rect(-charWidth/2, - charHeight/2, charWidth, charHeight);
    
    popMatrix();
  }

  //goes thru each projectile list amd checks against every enemy to see if it hits
  void checkProjectiles() {
    for (int i = 0; i < bossProjectiles.size(); i++) {
      Projectiles currentProj = bossProjectiles.get(i);
      if (currentProj.hit(player) && player.health > 0) {
        player.decreaseHealth(1);
        numHits++;
        println('h' + numHits);
        currentProj.shown = false;
      }
      if (!currentProj.shown) {
        bossProjectiles.remove(currentProj);
      }
    }
  }

  //generally calls all required methods for use (draw, checkprojectiles)
  //also spawns projectiles at a fixed rate and updates
  void update() {
    drawCharacter();
    checkProjectiles();
    if (frameCount % 60 == 0 && health > 0) {
      noFill();
      stroke(255, 0, 0);
      for (int i = 0; i < 5; i++) {
        bossProjectiles.add(new Projectiles(new PVector(pos.x, pos.y+20), new PVector(-5, spray), novel, new PVector(30, 40)));
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
  }
}
