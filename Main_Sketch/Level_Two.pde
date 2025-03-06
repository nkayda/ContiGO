//stage variables
final int LEVEL_TWO_INTRO = 5;
final int LEVEL_TWO = 6;

//basic level variables
PImage levelTwoIntroImg, levelTwoTimerImg, levelTwoWinImg, levelTwoMissImg, levelTwoCheckImg;
int levelTwoTimer = 0;
int levelTwoScore = 100;

//image arrays
PImage[] levelTwoBackground = new PImage[2];
PImage[] thoughtBubble = new PImage[2];
PImage[] thoughtGlass = new PImage[4];
PImage[] thoughtSink = new PImage[3];
PImage[] thoughtBus = new PImage[2];
//bus based off:
//https://buzzer.translink.ca/2018/12/a-look-at-the-new-translink-buses-entering-service-in-vancouver/
PImage[][] thoughtOptions = {thoughtGlass, thoughtSink, thoughtBus};

ArrayList<Bus> bus = new ArrayList<Bus>();
ArrayList<Bottle> bottle = new ArrayList<Bottle>();
boolean removedBottle = false;

int busMove = width + 100;
PImage busImg;
boolean spawnBus = false;
boolean busPassed = false;

PImage[] busAni = new PImage[2];
int busInd = 0;

float time = 1;
int selection = 1;
int winTimer = 300;

boolean show = false;
boolean messedUp = false;

int messedUpNum;

int thoughtBubInd = 0;
int levelTwoBgInd = 0;

//displays the intro slide
void levelTwoIntro() {
  image(levelTwoIntroImg, 0, 0);
}

//gameplay for level 2
//the image displayed in the thought bubble changes frequently at a semi random rate
//there is a 10% chance for the bus to appear in the bubble and the player must hit it in time to progress
void levelTwo() {
  fill(0, 255, 0);
  rect(0, 0, width, height);

  //backgorund animation
  if (frameCount % 30 == 0) {
    levelTwoBgInd++;
  }
  if (levelTwoBgInd == levelTwoBackground.length) {
    levelTwoBgInd = 0;
  }
  image(levelTwoBackground[levelTwoBgInd], 0, 0);

  //bottle drawing
  //is in an arraylist so that it can be remvoed from the screen easier later on
  if (bottle.size() > 0) {
    bottle.get(0).drawCharacterLevelTwo();
  }

  //draws timer
  image(levelOneTimerImg, -10, -50);
  levelTwoTimer++;
  timerCountUp(levelTwoTimer, 45, 75);

  text("MISSED: " + messedUpNum, 75, 110);

  //draws thought bubble (cant use playAnimation method bc that relies on one specific index variable)
  if (bottle.size() > 0) {
    for (int i = 0; i < thoughtBubble.length; i++) {
      thoughtBubble[i].resize(300, 220);
    }
    if (frameCount % 10 == 0) {
      thoughtBubInd++;
    }
    if (thoughtBubInd == thoughtBubble.length) {
      thoughtBubInd = 0;
    }

    pushMatrix();
    rotate(radians(10));
    image(thoughtBubble[thoughtBubInd], 660, 0);
    popMatrix();


    //randomly chooses a thought to display, randomly chooses how long it is displayed for
    if (frameCount % 30*time == 0) {
      selection = (int)random(0, 2); //random excludes the last number
      time = (int)random(1, 2);
      if (random(1)<=0.1) { //10% chance for the bus to appear
        selection = 2;
      }
      currentImgInd = 0; //reseats index whenever a new thought is displayed
    }
    playAnimation(thoughtOptions[selection], 10, 100, 100, new PVector(765, height/2-200));
  }

  //bus mechanics
  if (show == true && messedUp != true) { //caught bus
    image(levelTwoCheckImg, 300, 50);
    winTimer--;
    bus.add(new Bus(new PVector(width+800, height/2)));
    bus.get(0).updateWin();
    if (winTimer == 0) {
      levelTwoScore = levelTwoScore - 25*messedUpNum;
      sparkle.rewind();
    } else if (winTimer < 0) {
      image(levelTwoWinImg, 0, 0);
      textSize(50);
      text(levelTwoScore, width-475, height-370);
      bonusTracking[1] = 0;
      if (messedUpNum == 0) { //bonus for if the player get it on the first try
        bonus.play(0);
        fill(232, 143, 143);
        textSize(30);
        text("CONGRATS! YOU EARNED A BONUS STICKER DUE TO SUPER PRECISION!", 55, height-50);
        bonusTracking[1] = 1;
      }
    }
  } else if (messedUp == true) { //misclicked
    show = false;
    image(levelTwoMissImg, 300, 50);

    if (spawnBus == false) {
      bus.add(new Bus(new PVector(width+800, height/2)));
      spawnBus = true;
    }

    if (bus.size() == 1) {
      bus.get(0).update();
      busPassed = true;
    } else if (busPassed == true && bus.size() == 0) {
      messedUpNum += 1;
      show = false;
      messedUp = false;
      busPassed = false;
      spawnBus = false;
    }
  }
}
