//art in puzzle is one of my iat 102 projects traced into the style of this game!

//stage variables
final int LEVEL_THREE_INTRO = 8;
final int LEVEL_THREE = 9;
final int LEVEL_THREE_WIN = 10;

//image loading
PImage levelThreeIntroImg, levelThreeWinImg;

//variables relating to the selection of the pieces
int chosenPiece = 0;
PuzzlePiece currentPiece;
float positionCheck;

//tier info
int endTimer = ONE_SECOND;
int levelThreeTimer = 0;
int levelThreeScore = 0;

//lists to store piece info
ArrayList<PuzzlePiece> pieces = new ArrayList<PuzzlePiece>();
ArrayList<PuzzlePiece> completePieces = new ArrayList<PuzzlePiece>();

//image arrays
PImage[] puzzleTiles = new PImage[12];
PImage[] levelThreeBG = new PImage[2];

//displays intro page
void levelThreeIntro() {
  image(levelThreeIntroImg, 0, 0);
  bottle.clear();
}

//lvl 3 gameplay
//player switches between pieces by pressing space and needs to psoition them properly
void levelThree() {
  playAnimation(levelThreeBG, 10, width, height, cutsceneOnePosition);

  levelThreeTimer++;

  //if (endTimer < ONE_SECOND*3) {
  //  levelThreeTimer--;
  //}

  timerCountUp(levelThreeTimer, 45, 55);

  fill(0, 0);
  stroke(30);
  rect(250-60, 300-60, 120*4, 120*3);

  fill(255, 0, 0);

  //updates all correctly placed pieces
  for (int i = 0; i < completePieces.size(); i++) {
    completePieces.get(i).update();
  }
  
  //updates all incorrect pieces
  for (int i = 0; i < pieces.size(); i++) {
    pieces.get(i).drawCharacter();
  }

  //deals with the currently selected pieces and moves it and checks the position against where it is supposed to be
  if (pieces.size() > 0) {
    currentPiece = pieces.get(chosenPiece);
  }
  currentPiece.update();
  positionCheck = dist(currentPiece.pos.x, currentPiece.pos.y, currentPiece.corrPos.x, currentPiece.corrPos.y);

  //key movement for piece, places it in its correct spot if it gets close enough
  if (positionCheck >= 30) {
    if (up) pieces.get(chosenPiece).accelerate(upAccelerate);
    if (down) pieces.get(chosenPiece).accelerate(downAccelerate);
    if (left) pieces.get(chosenPiece).accelerate(leftAccelerate);
    if (right) pieces.get(chosenPiece).accelerate(rightAccelerate);
  } else {
    currentPiece.pos = currentPiece.corrPos;
    puzzleCorrect.play(0);
  }

  //moves piece to the correctly placed piece list and changes appropriately
  if ((dist(currentPiece.pos.x, currentPiece.pos.y, currentPiece.corrPos.x, currentPiece.corrPos.y) < 30)) {
    currentPiece.pos = currentPiece.corrPos;
    completePieces.add(currentPiece);
    pieces.remove(currentPiece);
    if (chosenPiece != 0) {
      chosenPiece -= 1;
    }
  }

  //win conditions
  if (completePieces.size() > 12) {
    win.play();
    endTimer--;
    if (endTimer == 0) {
      if (levelThreeTimer <= ONE_SECOND*15) {
        levelThreeScore = 100;
      } else if (levelThreeTimer <= ONE_SECOND*20) {
        levelThreeScore = 75;
      } else if (levelThreeTimer <= ONE_SECOND*25) {
        levelThreeScore = 50;
      } else {
        levelThreeScore = 25;
      }
      if ((int)levelThreeTimer/60 < 15) { //bonus for if the player finishes in lessn that 15 seconds
        bonus.play();
      }
      state = LEVEL_THREE_WIN;
    }
  }
}

//display win stage, shows points
void levelThreeWin() {
  image(levelThreeWinImg, 0, 0);
  textSize(50);
  fill(255);
  text(levelThreeScore, width-475, height-370);
  bonusTracking[2] = 0;
  if ((int)levelThreeTimer/60 < 15) { //bonus for if the player finishes in lessn that 15 seconds
    fill(232, 143, 143);
    textSize(30);
    text("CONGRATS! YOU EARNED A BONUS STICKER DUE TO SUPER SPEED!", 85, height-50);
    bonusTracking[2] = 1;
  }
  player.pos.x = 100;
  player.pos.y = height/2;
}
