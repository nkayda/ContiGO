final int CUTSCENE_ONE = 0;
boolean cutsceneOnePlaying = false;
int cutsceneOneSlide = 0;

//arraylists where each frame is stored in each section
PImage[] cutsceneOneOne = new PImage[3];
PImage[] cutsceneOneTwo = new PImage[2];
PImage[] cutsceneOneThree = new PImage[2];
PImage[] cutsceneOneFour = new PImage[2];
PImage[] cutsceneOneFive = new PImage[2];
PImage[] cutsceneOneSix = new PImage[2];
PImage[] cutsceneOneSeven = new PImage[2];
PImage[] cutsceneOneEight = new PImage[2];
PImage[] cutsceneOneNine = new PImage[2];
PImage[] cutsceneOneTen = new PImage[2];
PImage[] cutsceneOneEleven = new PImage[2];
PImage[] cutsceneOneTwelve = new PImage[4];
PImage[] cutsceneOneThirteen = new PImage[4];
PImage[] cutsceneOneFourteen = new PImage[4];
PImage[] cutsceneOneFifteen = new PImage[4];
PImage[] cutsceneOneSixteen = new PImage[2];
PImage[] cutsceneOneSeventeen = new PImage[2];
PImage[] cutsceneOneEighteen = new PImage[2];

int currentImgInd = 0;
PVector cutsceneOnePosition = new PVector(0, 0);

boolean ready = false;

//plays each part/page of the intro cutscene
//uses arraylists above to draw the frames and the playAnimation() function to do so
void cutsceneOne() {
  eerie.play();
  switch(cutsceneOneSlide) {
  case 1 :
    playAnimation(cutsceneOneOne, 10, width, height, cutsceneOnePosition);
    crash.play(0);
    //print('1');
    break;
  case 2 :
    playAnimation(cutsceneOneTwo, 6, width, height, cutsceneOnePosition);
    //print('2');
    break;
  case 3 :
    playAnimation(cutsceneOneThree, 12, width, height, cutsceneOnePosition);
    //print('3');
    break;
  case 4 :
    playAnimation(cutsceneOneFour, 12, width, height, cutsceneOnePosition);
    //print('4');
    break;
  case 5 :
    playAnimation(cutsceneOneFive, 12, width, height, cutsceneOnePosition);
    //print('5');
    break;
  case 6 :
    playAnimation(cutsceneOneSix, 12, width, height, cutsceneOnePosition);
    //print('6');
    break;
  case 7 :
    playAnimation(cutsceneOneSeven, 12, width, height, cutsceneOnePosition);
    //print('7');
    break;
  case 8 :
    playAnimation(cutsceneOneEight, 12, width, height, cutsceneOnePosition);
    //print('8');
    break;
  case 9 :
    playAnimation(cutsceneOneNine, 12, width, height, cutsceneOnePosition);
    //print('9');
    break;
  case 10 :
    playAnimation(cutsceneOneTen, 12, width, height, cutsceneOnePosition);
    //print("10 ");
    break;
  case 11 :
    playAnimation(cutsceneOneEleven, 12, width, height, cutsceneOnePosition);
    //print("11 ");
    break;
  case 12 :
    playAnimation(cutsceneOneTwelve, 12, width, height, cutsceneOnePosition);
    //print("12 ");
    break;
  case 13 :
    playAnimation(cutsceneOneThirteen, 12, width, height, cutsceneOnePosition);
    //print("13 ");
    break;
  case 14 :
    playAnimation(cutsceneOneFourteen, 12, width, height, cutsceneOnePosition);
    //print("14 ");
    break;
  case 15 :
    playAnimation(cutsceneOneFifteen, 12, width, height, cutsceneOnePosition);
    //print("15 ");
    break;
  case 16 :
    playAnimation(cutsceneOneSixteen, 12, width, height, cutsceneOnePosition);
    //print("16 ");
    break;
  case 17 :
    playAnimation(cutsceneOneSeventeen, 12, width, height, cutsceneOnePosition);
    //print("17 ");
    break;
  case 18 :
    playAnimation(cutsceneOneEighteen, 12, width, height, cutsceneOnePosition);
    //print("18 ");
    ready = true;
    break;
  }
}
