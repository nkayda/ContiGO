final int LEVEL_ONE_INTRO = 2;
final int LEVEL_ONE = 3;
final int LEVEL_ONE_LOSE = 4;

PImage playerImg, antImg1, antImg2;
PImage levelOneIntroImg, levelOneTimerImg, levelOneWinImg, levelOneLoseImg, levelOneBgImg;
int levelOneTimer = ONE_SECOND*30; // supposed to be 30, but I changed it to 10 for testing
int levelOneScore = 100;
int levelOneBgMovement = 0;

boolean levelOneIntroPlaying = false;
boolean levelOnePlaying = false;

ArrayList<Ant> ants = new ArrayList<Ant>();
PImage healthPointFull, healthPointGone;

//simply displays the intro screen for lvl 1
void levelOneIntro() {
  image(levelOneIntroImg, 0, 0);
}

//gameplay for lvl 1
// ants crossing the screen, player tries to avoid, similar to flappy bird
void levelOne() {
  grass.play();
  fill(255);
  //x width of bg is 3522
  rect(0, 0, width, height);
  image(levelOneBgImg, levelOneBgMovement, 0);
  levelOneBgMovement -= 2;

  // frequency of spawning
  int pace = 90;
  if (levelOneTimer <= ONE_SECOND*20 && levelOneTimer > ONE_SECOND*10) {
    pace = 60;
  } else if (levelOneTimer <= ONE_SECOND*10) {
    pace = 40;
  }

  //spawning of ants
  //some sense of randomness due t x psoition and also which formation is called upon
  if (frameCount % pace == 0 && levelOneTimer > 0 && player.health > 0 && ants.size() <= 12) {
    int layout = (int)random(1, 4);
    if (layout == 1) {
      ants.add(new Ant(new PVector(random(width+40, width+200), 60)));
      ants.add(new Ant(new PVector(random(width+40, width+200), 220)));
      ants.add(new Ant(new PVector(random(width+40, width+200), height-220)));
      ants.add(new Ant(new PVector(random(width+40, width+200), height-60)));
      println('1');
    } else if (layout == 2) {
      ants.add(new Ant(new PVector(random(width+40, width+200), 60)));
      ants.add(new Ant(new PVector(random(width+40, width+200), height- 360)));
      ants.add(new Ant(new PVector(random(width+40, width+200), height-200)));
      ants.add(new Ant(new PVector(random(width+40, width+200), height-60)));
      println('2');
    } else if (layout == 3) {
      ants.add(new Ant(new PVector(random(width+40, width+200), 60)));
      ants.add(new Ant(new PVector(random(width+40, width+200), 220)));
      ants.add(new Ant(new PVector(random(width+40, width+200), 400)));
      ants.add(new Ant(new PVector(random(width+40, width+200), height-60)));
      println('3');
    } else if (layout == 4) {
      ants.add(new Ant(new PVector(random(width+40, width+200), 60)));
      ants.add(new Ant(new PVector(random(width+40, width+200), 220)));
      ants.add(new Ant(new PVector(random(width+40, width+200), 340)));
      ants.add(new Ant(new PVector(random(width+40, width+200), 480)));
      println('4');
    }
  }

  //updates player and ants
  player.update();
  if (levelOneTimer > 0) {
    for (int i = 0; i < ants.size(); i++) {
      Ant currentAnt = ants.get(i);
      currentAnt.update();

      if (levelOneTimer > ONE_SECOND*20) {
        currentAnt.vel = new PVector(-5, 0);
      } 
      else if (levelOneTimer <= ONE_SECOND*20 && levelOneTimer > ONE_SECOND*15) {
        currentAnt.vel = new PVector(-7, 0);
      } 
      else if (levelOneTimer <= ONE_SECOND*15 && levelOneTimer > ONE_SECOND*10) {
        currentAnt.vel = new PVector(-10, 0);
      }
      else if (levelOneTimer <= ONE_SECOND*10) {
        currentAnt.vel = new PVector(-13, 0);
      }
    }
  }

  //removes ants from screen if the game ends or player dies
  if (levelOneTimer == 0 || player.health == 0) {
    for (int i = 0; i < ants.size(); i++) {
      Ant currentAnt = ants.get(i);
      ants.remove(currentAnt);
    }
  }
  
  //draws timer
  image(levelOneTimerImg, -10, -50);
  levelOneTimer--;
  timerCountdown(levelOneTimer, 45, 75);

  //draws health bar
  for (int i = 0; i < player.health; i++) {
    image(healthPointFull, 80+i*40, 85);
  }
  for (int i = 0; i < 3-player.health; i++) {
    image(healthPointGone, 160+i*-40, 85);
  }

  //player dies screen
  if (player.health == 0) {
    for (int i = 0; i < ants.size(); i++) {
      Ant currentAnt = ants.get(i);
      ants.remove(currentAnt);
    }
    lose.play(0);
    state = LEVEL_ONE_LOSE;
  }


  //player wins screen
  if (levelOneTimer < 0) {
    if (levelOneScore == 100) { //bonus for if the player doesnt get hit
      bonus.play(0);
    }
    image(levelOneWinImg, 0, 0);
    fill(255);
    textSize(50);
    text(levelOneScore, width-475, height-320);
    bonusTracking[0] = 0;
    if (levelOneScore == 100) { //bonus for if the player doesnt get hit
      fill(232, 143, 143);
      textSize(30);
      text("CONGRATS! YOU EARNED A BONUS STICKER DUE TO A MAX SCORE!", 85, height-50);
      bonusTracking[0] = 1;
    }
  }
}

//if the player dies then it shows the lose screen
//the game can restart if the player presses enter (as decided in keyboard input section)
void levelOneLose() {
  grass.pause();
  grass.rewind();
  image(levelOneLoseImg, 0, 0);
  player.pos.x = width/2;
  player.pos.y = height/2;
  for (int i = 0; i < ants.size(); i++) {
    Ant currentAnt = ants.get(i);
    ants.remove(currentAnt);
  }
}
