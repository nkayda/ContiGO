//variables to represent stages
final int CUTSCENE_FOUR = 16;
final int END_SCREEN = 17;

//cutscene navigation variables taht switch scenes
int cutsceneFourSlide = 0;
boolean readyFour = false;

//image loading
PImage endScreen;

//arraylists where each frame is stored in each section
PImage[] cutsceneFourOne = new PImage[2];
PImage[] cutsceneFourTwo = new PImage[2];
PImage[] cutsceneFourThree = new PImage[2];
PImage[] cutsceneFourFour = new PImage[2];
PImage[] cutsceneFourFive = new PImage[2];

//variables for end screen stats
int finalScore;
int bonusTotal;
int total;

//plays each part/page of the intro cutscene
//uses arraylists above to draw the frames and the playAnimation() function to do so
void cutsceneFour() {
  bgMusic.play();
  switch(cutsceneFourSlide) {
  case 1 :
    playAnimation(cutsceneFourOne, 12, width, height, cutsceneOnePosition);
    //print('1');
    break;
  case 2 :
    personDoor.play();
    playAnimation(cutsceneFourTwo, 12, width, height, cutsceneOnePosition);
    //print('2');
    break;
  case 3 :
    playAnimation(cutsceneFourThree, 12, width, height, cutsceneOnePosition);
    //print('3');
    break;
  case 4 :
    playAnimation(cutsceneFourFour, 12, width, height, cutsceneOnePosition);
    //print('4');
    break;
  case 5 :
    playAnimation(cutsceneFourFive, 12, width, height, cutsceneOnePosition);
    //print('5');
    readyFour = true;
    break;
  }
}

//shows end screen and all stats
//calculates and displays score based on previous level's score variables and player death history
void endScreen() {
  bgMusic.pause();
  image(endScreen, 0, 0);
  end.play();

  println(levelOneScore, levelTwoScore, levelThreeScore, bossFightScore, bonusTotal);
  finalScore = levelOneScore + levelTwoScore + levelThreeScore + bossFightScore + (bonusTotal*50) - (pointReduction*50);

  fill(255);
  textSize(40);
  text(levelOneScore + levelTwoScore + levelThreeScore + bossFightScore, width-475, height-365);
  text(bonusTotal + "   (+" + bonusTotal*50 + " points)", width-475, height-310);
  text(pointReduction + "   (-" + pointReduction*50 + " points)", width-475, height-262);
  text(finalScore, width-475, height-215);
}
