//campus image:
//https://www.sfu.ca/surrey/news-and-events/news-all/research/quantum-algorithms-institute-receives--2-2m-boost-from-canadian-.html

final int CUTSCENE_TWO = 7;
int cutsceneTwoSlide = 1;

//arraylists where each frame is stored in each section
PImage[] cutsceneTwoOne = new PImage[2];
PImage[] cutsceneTwoTwo = new PImage[2];
PImage[] cutsceneTwoThree = new PImage[2];
PImage[] cutsceneTwoFour = new PImage[2];
PImage[] cutsceneTwoFive = new PImage[2];
PImage[] cutsceneTwoSix = new PImage[2];

boolean readyTwo = false;

//plays each part/page of the intro cutscene
//uses arraylists above to draw the frames and the playAnimation() function to do so
void cutsceneTwo() {
  switch(cutsceneTwoSlide) {
  case 1 :
    playAnimation(cutsceneTwoOne, 12, width, height, cutsceneOnePosition);
    //print('1');
    break;
  case 2 :
    playAnimation(cutsceneTwoTwo, 12, width, height, cutsceneOnePosition);
    //print('2');
    break;
  case 3 :
    playAnimation(cutsceneTwoThree, 12, width, height, cutsceneOnePosition);
    //print('3');
    break;
  case 4 :
    playAnimation(cutsceneTwoFour, 12, width, height, cutsceneOnePosition);
    //print('4');
    break;
  case 5 :
    playAnimation(cutsceneTwoFive, 12, width, height, cutsceneOnePosition);
    //print('5');
    break;
  case 6 :
    playAnimation(cutsceneTwoSix, 12, width, height, cutsceneOnePosition);
    //print('6');
    readyTwo = true;
    break;
  }
}
