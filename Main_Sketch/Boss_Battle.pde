//states for relevant stages
final int BOSS_INTRO = 12;
final int BOSS_FIGHT = 13;
final int BOSS_FIGHT_LOSE = 14;
final int BOSS_FIGHT_WIN = 15;

//image variables forlevel
PImage bossFightIntroImg, bossFightLoseImg, bossFightWinImg, bossFightBgImg;
ArrayList<Boss> bosses = new ArrayList<Boss>();

//aniamtion lists that store frames
PImage[] juliaAnimation = new PImage[5];
PImage[] juliaLossAnimation = new PImage[2];

PImage[] roanAnimation = new PImage[5];
PImage[] roanLossAnimation = new PImage[2];

PImage[] desmondAnimation = new PImage[5];
PImage[] desmondLossAnimation = new PImage[2];

PImage novel, splat, cookie, timtams;
//cookie based on: https://cookierun.fandom.com/wiki/GingerBrave
//timtams based on: https://www.amazon.ca/Arnotts-Tim-Tam-Original-200g/dp/B01LTIQJW4
//people based on my friends
int bossFightTimer;

int numBosses; //tracks how many bosses have been shown
int numHits = 0; //tracks how many times the player gets hit (this will cause points to be lost)
int bossEndTimer = ONE_SECOND;
int newSpawnTimer = 120; //space between boss spawnings
int bossFightScore = 300; //starting score for the level

//stage for the intro
void bossFightIntro() {
  image(bossFightIntroImg, 0, 0);
  player.health = 5;
}

//stage for the fight
void bossFight() {
  
  image(bossFightBgImg, 0, 0);

  //draws timer
  image(levelOneTimerImg, -10, -50);
  bossFightTimer++;
  timerCountUp(bossFightTimer, 45, 75);

  //draws health bar
  for (int i = 0; i < player.health; i++) {
    image(healthPointFull, 40+i*40, 85);
  }
  for (int i = 0; i < 5-player.health; i++) { //fix this
    image(healthPointGone, 200+i*-40, 85);
  }

  //updates player adn bosses
  player.updateTwo();
  for (int i = 0; i < bosses.size(); i++) {
    bosses.get(i).update();
  }

  //spawns each boss accoridng to if there is already a boss on or not
  if (bosses.size() == 0) {
    if (numBosses == 1) { //spawns roan
      newSpawnTimer--;
      if (newSpawnTimer == 0) {
        bosses.add(new Roan(new PVector(width-200, height/2)));
        newSpawnTimer = 120;
      }
    }
    if (numBosses == 2) { //spawns desmond
      newSpawnTimer--;
      if (newSpawnTimer == 0) {
        bosses.add(new Desmond(new PVector(width-200, height/2)));
        newSpawnTimer = 120;
      }
    }
    if (numBosses == 3) { //switches to next state
      bossEndTimer--;
      if (bossEndTimer == 0) {
        state = BOSS_FIGHT_WIN;
      }
    }
  }

  //switches to death screen if player loses all their health
  if (player.health == 0) {
    lose.play(0);
    state = BOSS_FIGHT_LOSE;
  }
}

//stage for winnung the fight
//changes the score and displays info
void bossFightWin() {
  bossWinSound.play();
  image(bossFightWinImg, 0, 0);
  bossMusic.pause();
  bossFightScore = 300 - numHits*25;

  fill(255);
  textSize(50);
  text(bossFightScore, width-475, height-380);
}

//stage for loss
void bossFightLose() {
  image(bossFightLoseImg, 0, 0);
  player.pos.x = 100;
  player.pos.y = height/2;
  player.health = 5;
  for (int i = 0; i < bosses.size(); i++) {
    bosses.remove(bosses.get(i));
  }
  for (int i = 0; i < player.playerProjectiles.size(); i++) {
    player.playerProjectiles.remove(player.playerProjectiles.get(i));
  }
}
