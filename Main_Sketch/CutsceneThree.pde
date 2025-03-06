//variables for stage and scenes
final int CUTSCENE_THREE = 11;
int cutsceneThreeSlide = 1;

//arraylists where each frame is stored in each section
PImage[] cutsceneThreeOne = new PImage[2];
PImage[] cutsceneThreeTwo = new PImage[2];
PImage[] cutsceneThreeThree = new PImage[2];
PImage[] cutsceneThreeFour = new PImage[4];
PImage[] cutsceneThreeFive = new PImage[2];
PImage[] cutsceneThreeSix = new PImage[2];
PImage[] cutsceneThreeSeven = new PImage[2];
PImage[] cutsceneThreeEight = new PImage[2];
PImage[] cutsceneThreeNine = new PImage[2];
PImage[] cutsceneThreeTen = new PImage[2];
PImage[] cutsceneThreeEleven = new PImage[2];
PImage[] cutsceneThreeTwelve = new PImage[2];
PImage[] cutsceneThreeThirteen = new PImage[2];
PImage[] cutsceneThreeFourteen = new PImage[2];
PImage[] cutsceneThreeFifteen = new PImage[2];
PImage[] cutsceneThreeSixteen = new PImage[2];
PImage[] cutsceneThreeSeventeen = new PImage[2];
PImage[] cutsceneThreeEighteen = new PImage[2];

boolean readyThree = false;

//plays each part/page of the intro cutscene
//uses arraylists above to draw the frames and the playAnimation() function to do so
void cutsceneThree() {
  switch(cutsceneThreeSlide) {
  case 1 :
    playAnimation(cutsceneThreeOne, 12, width, height, cutsceneOnePosition);
    //print('1');
    break;
  case 2 :
    playAnimation(cutsceneThreeTwo, 12, width, height, cutsceneOnePosition);
    //print('2');
    break;
  case 3 :
    playAnimation(cutsceneThreeThree, 12, width, height, cutsceneOnePosition);
    //print('3');
    break;
  case 4 :
    playAnimation(cutsceneThreeFour, 12, width, height, cutsceneOnePosition);
    //print('4');
    break;
  case 5 :
    register.play();
    playAnimation(cutsceneThreeFive, 12, width, height, cutsceneOnePosition);
    //print('5');
    break;
  case 6 :
    blender.play();
    playAnimation(cutsceneThreeSix, 12, width, height, cutsceneOnePosition);
    //print('6');
    break;
  case 7 :
    shootUnlock.play();
    playAnimation(cutsceneThreeSeven, 12, width, height, cutsceneOnePosition);
    //print('7');
    break;
  case 8 :
    playAnimation(cutsceneThreeEight, 12, width, height, cutsceneOnePosition);
    //print('8');
    break;
  case 9 :
    playAnimation(cutsceneThreeNine, 12, width, height, cutsceneOnePosition);
    //print('9');
    break;
  case 10 :
    playAnimation(cutsceneThreeTen, 12, width, height, cutsceneOnePosition);
    //print("10");
    break;
  case 11 :
    bottleDoor.play();
    playAnimation(cutsceneThreeEleven, 12, width, height, cutsceneOnePosition);
    //print("11");
    break;
  case 12 :
    playAnimation(cutsceneThreeTwelve, 12, width, height, cutsceneOnePosition);
    bgMusic.pause();
    bgMusic.rewind();
    //print("12");
    break;
  case 13 :
    playAnimation(cutsceneThreeThirteen, 12, width, height, cutsceneOnePosition);
    bossMusic.play();
    //print("13");
    break;
  case 14 :
    playAnimation(cutsceneThreeFourteen, 12, width, height, cutsceneOnePosition);
    //print("14");
    break;
  case 15 :
    bossWhoosh.play();
    playAnimation(cutsceneThreeFifteen, 12, width, height, cutsceneOnePosition);
    //print("15");
    break;
  case 16 :
    bossWhoosh.play();
    playAnimation(cutsceneThreeSixteen, 12, width, height, cutsceneOnePosition);
    //print("16");
    break;
  case 17 :
    bossWhoosh.play();
    playAnimation(cutsceneThreeSeventeen, 12, width, height, cutsceneOnePosition);
    //print("17");
    break;
  case 18 :
    playAnimation(cutsceneThreeEighteen, 12, width, height, cutsceneOnePosition);
    //print("18");
    readyThree = true;
    break;
  }
}
