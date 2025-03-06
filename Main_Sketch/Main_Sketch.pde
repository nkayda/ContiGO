// basic code based off my a3 and labs!
// concept of rapid fire minigames similar to warioware games and cuphead
// concept of using friends as bosses brought up by my friend
// some foundation level ideas based on brainstorming session and fun convos!

int state; //represents the level/stage
int pointReduction = 0; //tracks the number of deaths and therefore the reduction of points at the end
Bottle player;
final int ONE_SECOND = 60; // variable to represent frames per second
final int TITLE_SCREEN = 1;
PImage[] titleScreen = new PImage[2];
PImage instructions;
boolean showInst = false;

int[] bonusTracking = new int[3];

void setup() {
  windowTitle("ContiGO!");
  size(1100, 800);
  background(0);
  player = new Bottle(new PVector(width/2, height/2));

  bottle.add(new Bottle(new PVector(width/2-50, height/2-30)));

  // same font and text setup as my a3 :)
  PFont timerFont = loadFont("AdelleSansDevanagari-Thin-48.vlw");
  textFont(timerFont);

  //LOAD ALL IMAGES HERE
  
  makeArray("Title", titleScreen);
  
  //load animation arrays for level one
  makeArray("CS1_1_", cutsceneOneOne);
  makeArray("CS1_2_", cutsceneOneTwo);
  makeArray("CS1_3_", cutsceneOneThree);
  makeArray("CS1_4_", cutsceneOneFour);
  makeArray("CS1_5_", cutsceneOneFive);
  makeArray("CS1_6_", cutsceneOneSix);
  makeArray("CS1_7_", cutsceneOneSeven);
  makeArray("CS1_8_", cutsceneOneEight);
  makeArray("CS1_9_", cutsceneOneNine);
  makeArray("CS1_10_", cutsceneOneTen);
  makeArray("CS1_11_", cutsceneOneEleven);
  makeArray("CS1_12_", cutsceneOneTwelve);
  makeArray("CS1_13_", cutsceneOneThirteen);
  makeArray("CS1_14_", cutsceneOneFourteen);
  makeArray("CS1_15_", cutsceneOneFifteen);
  makeArray("CS1_16_", cutsceneOneSixteen);
  makeArray("CS1_17_", cutsceneOneSeventeen);
  makeArray("CS1_18_", cutsceneOneEighteen);

  //load animation arrays for level two
  makeArray("LVL2B_", thoughtBubble);

  makeArray("LVL2_1_", thoughtGlass);
  makeArray("LVL2_2_", thoughtSink);
  makeArray("LVL2_3_", thoughtBus);

  makeArray("LevelTwoBg", levelTwoBackground);
  makeArray("LVL2_Bus_", busAni);

  instructions = loadImage("inst.png");

  busImg = loadImage("bus.png");

  playerImg = loadImage("Bottle.png");
  playerImg.resize(player.charWidth, player.charHeight);

  antImg1 = loadImage("Ant1.png");
  antImg1.resize(170, 120);
  antImg2 = loadImage("Ant2.png");
  antImg2.resize(170, 120);

  healthPointFull = loadImage("HealthPointFull.png");
  healthPointFull.resize(35, 35);
  healthPointGone = loadImage("HealthPointGone.png");
  healthPointGone.resize(35, 35);

  levelOneTimerImg = loadImage("LevelOneTimer.png");
  levelOneTimerImg.resize(300, 250);
  levelOneIntroImg = loadImage("LevelOneIntro.png");
  levelOneWinImg = loadImage("LevelOneWin.png");
  levelOneLoseImg = loadImage("LevelOneLose.png");
  levelOneBgImg = loadImage("LevelOneBg.png");

  levelTwoIntroImg = loadImage("LevelTwoIntro.png");
  levelTwoWinImg = loadImage("LevelTwoWin.png");

  levelTwoMissImg = loadImage("LevelTwoMiss.png");
  levelTwoMissImg.resize(50, 50);
  levelTwoCheckImg = loadImage("LevelTwoCheck.png");
  levelTwoCheckImg.resize(50, 50);
  
  makeArray("CS2_1_", cutsceneTwoOne);
  makeArray("CS2_2_", cutsceneTwoTwo);
  makeArray("CS2_3_", cutsceneTwoThree);
  makeArray("CS2_4_", cutsceneTwoFour);
  makeArray("CS2_5_", cutsceneTwoFive);
  makeArray("CS2_6_", cutsceneTwoSix);
  
  makeArray("L3BG_", levelThreeBG);
  
  levelThreeIntroImg = loadImage("LevelThreeIntro.png");
  levelThreeWinImg = loadImage("LevelThreeWin.png");
  
  makeArray("PZ_", puzzleTiles);
  
  makeArray("CS3_1_", cutsceneThreeOne);
  makeArray("CS3_2_", cutsceneThreeTwo);
  makeArray("CS3_3_", cutsceneThreeThree);
  makeArray("CS3_4_", cutsceneThreeFour);
  makeArray("CS3_5_", cutsceneThreeFive);
  makeArray("CS3_6_", cutsceneThreeSix);
  makeArray("CS3_7_", cutsceneThreeSeven);
  makeArray("CS3_8_", cutsceneThreeEight);
  makeArray("CS3_9_", cutsceneThreeNine);
  makeArray("CS3_10_", cutsceneThreeTen);
  makeArray("CS3_11_", cutsceneThreeEleven);
  makeArray("CS3_12_", cutsceneThreeTwelve);
  makeArray("CS3_13_", cutsceneThreeThirteen);
  makeArray("CS3_14_", cutsceneThreeFourteen);
  makeArray("CS3_15_", cutsceneThreeFifteen);
  makeArray("CS3_16_", cutsceneThreeSixteen);
  makeArray("CS3_17_", cutsceneThreeSeventeen);
  makeArray("CS3_18_", cutsceneThreeEighteen);
  
  bossFightIntroImg = loadImage("BossFightIntro.png");
  bossFightLoseImg = loadImage("BossFightLose.png");
  bossFightWinImg = loadImage("BossFightWin.png");
  bossFightBgImg = loadImage("BossFightBg.png");
  
  makeArray("j", juliaAnimation);
  makeArray("JL", juliaLossAnimation);
  novel = loadImage("novel.png");
  novel.resize(50, 70);
  
  splat = loadImage("splat.png");
  splat.resize(20, 20);
  
  makeArray("r", roanAnimation);
  makeArray("RL", roanLossAnimation);
  cookie = loadImage("cookie.png");
  cookie.resize(50, 50);
  
  makeArray("d", desmondAnimation);
  makeArray("DL", desmondLossAnimation);
  timtams = loadImage("timtams.png");
  timtams.resize(100, 50);
  
  endScreen = loadImage("EndScreen.png");
  
  makeArray("CS4_1_", cutsceneFourOne);
  makeArray("CS4_2_", cutsceneFourTwo);
  makeArray("CS4_3_", cutsceneFourThree);
  makeArray("CS4_4_", cutsceneFourFour);
  makeArray("CS4_5_", cutsceneFourFive);
  
  //adds puzzle pieces to level three
  for (int i = 0; i < 4; i++){
    pieces.add(new PuzzlePiece(new PVector(random(90, width - 60/2-240), random(120, height - (120/2)-25)), new PVector(250+(120*i), 300), levelTwoCheckImg));
    pieces.add(new PuzzlePiece(new PVector(random(90, width - 60/2-240), random(120, height - (120/2)-25)), new PVector(250+(120*i), 300+120), levelTwoCheckImg));
    pieces.add(new PuzzlePiece(new PVector(random(90, width - 60/2-240), random(120, height - (120/2)-25)), new PVector(250+(120*i), 300+240), levelTwoCheckImg));
  }
  for (int i = 0; i < pieces.size(); i++){
    puzzleTiles[i].resize(120, 120);
    pieces.get(i).img = puzzleTiles[i];
  }
  
  //adds the first boss to the boss list for the boss fight
  bosses.add(new Julia(new PVector(width-200, height/2)));

  //loads sound (based on lab)
  loadAssets();
  
  //sets first state
  state = CUTSCENE_ONE;
}

void draw() {
  textSize(30);
  fill(50);
  text("(PRESS ENTER TO GO THROUGH DIALOGUE)", width/2-320, height/2);

  //adjusts the stage
  switch(state) {
  case CUTSCENE_ONE : // intro to story
    cutsceneOne();
    break;
  case TITLE_SCREEN : // title screen
    bgMusic.play();
    sparkle.play();
    bonus.play();
    bonus.pause();
    titleScreen();
    if (showInst == true){
      image(instructions, 0, 0);
    }
    break;
  case LEVEL_ONE_INTRO :
    sparkle.play();
    levelOneIntro();
    break;
  case LEVEL_ONE :  // ants game
    levelOne();
    break;
  case LEVEL_ONE_LOSE :
    levelOneLose();
    break;
  case LEVEL_TWO_INTRO :
    sparkle.play();
    levelTwoIntro();
    break;
  case LEVEL_TWO :
    levelTwo();
    break;
  case CUTSCENE_TWO:
    cutsceneTwo();
    break;
  case LEVEL_THREE_INTRO :
    sparkle.play();
    levelThreeIntro();
    break;
  case LEVEL_THREE :
    levelThree();
    break;
  case LEVEL_THREE_WIN :
    levelThreeWin();
    break;
  case CUTSCENE_THREE :
    cutsceneThree();
    break;
  case BOSS_INTRO : 
    bossFightIntro();
    break;
  case BOSS_FIGHT :
    bossFight();
    break;
  case BOSS_FIGHT_LOSE :
    bossFightLose();
    break;
  case BOSS_FIGHT_WIN :
    bossFightWin();
    break;
  case CUTSCENE_FOUR :
    cutsceneFour();
    break;
  case END_SCREEN :
    endScreen();
    break;
  }
  if (up) player.accelerate(upAccelerate);
  if (down) player.accelerate(downAccelerate);
  if (left) player.accelerate(leftAccelerate);
  if (right) player.accelerate(rightAccelerate);
}


//load images to an arraylist
//takes in the desired prefix for the files and the array the images are going into and places them in
void makeArray(String prefix, PImage[] array) {
  for (int i = 0; i < array.length; i++) {
    array[i] = loadImage(prefix + i + ".png");
  }
}

//goes through the arraylist and displays each frame
//takes in the source arraylist, rate of playing, width and height, and position of the animation to play it
void playAnimation(PImage[] array, int rate, int w, int h, PVector pos) {
  for (int i = 0; i < array.length; i++) {
    array[i].resize(w, h);
  }
  if (frameCount % rate == 0) {
    currentImgInd++;
  }
  if (currentImgInd == array.length) {
    currentImgInd = 0;
  }
  image(array[currentImgInd], pos.x, pos.y);
}

//displays a countdown timer
//takes in starting value to convert frames to seconds and count down from, and x/y coords to position it
void timerCountdown(int num, int xCor, int yCor) {
  textSize(30);
  fill(255);
  text("TIME LEFT: " + (int)num/60, xCor, yCor);
}

//displays the timer that tracks how much time has passed
//take in strating value to count up from and position to draw the content
void timerCountUp(int num, int xCor, int yCor) {
  textSize(25);
  fill(255);
  text("TIME TAKEN: " + (int)num/60, xCor, yCor);
}


//will display the title screen of ContiGO!
void titleScreen() {
  playAnimation(titleScreen, 12, width, height, cutsceneOnePosition);
}
