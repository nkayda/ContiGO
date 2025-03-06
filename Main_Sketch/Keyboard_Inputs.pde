//based off of my a3 and also lab bases

boolean up, down, left, right;
PVector upAccelerate = new PVector(0, -3);
PVector downAccelerate = new PVector(0, 3);
PVector rightAccelerate = new PVector(3, 0);
PVector leftAccelerate = new PVector(-3, 0);

//built-in function that takes in keyboard inputs and:
//a) moves the character
//b) switches between static explanation frames
//c) causes the action depending on the level
void keyPressed() {
  if (keyCode == LEFT) {
    left = true;
  }
  if (keyCode == RIGHT) {
    right = true;
  }
  if (keyCode == UP) {
    up = true;
  }
  if (keyCode == DOWN) {
    down = true;
  }
  if (key == ' ') {
    //determines whether the player gets the timing correct and acts accordingly
    if (state == LEVEL_TWO) {
      if (key == ' ' && selection == 2) {
        show = true;
        busGood.play(0);
      } else if (key == ' ' && selection != 2 && show != true) {
        messedUp = true;
        busPass.play(0);
      }
    }
    //switches between the pieces
    if (state == LEVEL_THREE) {
      if (chosenPiece < pieces.size()) {
        click.play(0);
        chosenPiece += 1;
        if (chosenPiece == pieces.size()) {
          chosenPiece = 0;
        }
      }
    }
    //shoots in boss fight
    if (state == BOSS_FIGHT) {
      player.shoot();
    }
  }
  //for showing instructions on start page
  if (keyCode == SHIFT && state == TITLE_SCREEN) {
    showInst = true;
  }
  //switches between parts in cutscene, plays appropriate sounds, changes states
  if (keyCode == ENTER) {
    if (state == CUTSCENE_ONE) {
      cutsceneOneSlide += 1;
      currentImgInd = 0;
    }
    if (state == CUTSCENE_ONE && ready == true) {
      eerie.pause();
      state = TITLE_SCREEN;
    } else if (state == TITLE_SCREEN) {
      sparkle.play(0);
      state = LEVEL_ONE_INTRO;
    } else if (state == LEVEL_ONE_INTRO) {
      state = LEVEL_ONE;
    } else if (state == LEVEL_ONE && levelOneTimer < 0) {
      grass.pause();
      sparkle.play(0);
      state = LEVEL_TWO_INTRO;
    } else if (state == LEVEL_ONE_LOSE) {
      player.health = 3;
      levelOneTimer = ONE_SECOND*30;
      levelOneBgMovement = 0;
      levelOneScore = 75;
      pointReduction+=1;
      state = LEVEL_ONE;
    } else if (state == LEVEL_TWO_INTRO) {
      state = LEVEL_TWO;
    } else if (state == LEVEL_TWO && winTimer <= 0) {
      currentImgInd = 0;
      state = CUTSCENE_TWO;
    } else if (state == CUTSCENE_TWO) {
      cutsceneTwoSlide += 1;
      currentImgInd = 0;
    }
    if (state == CUTSCENE_TWO && readyTwo == true) {
      sparkle.play(0);
      state = LEVEL_THREE_INTRO;
    } else if (state == LEVEL_THREE_INTRO) {
      state = LEVEL_THREE;
    } else if (state == LEVEL_THREE_WIN) {
      state = CUTSCENE_THREE;
    }
    if (state == CUTSCENE_THREE) {
      cutsceneThreeSlide += 1;
      currentImgInd = 0;
      bossWhoosh.rewind();
    }
    if (state == CUTSCENE_THREE && readyThree == true) {
      state = BOSS_INTRO;
    } else if (state == BOSS_INTRO) {
      player.health = 5;
      state = BOSS_FIGHT;
    }
    if (state == BOSS_FIGHT_LOSE) {
      player.health = 5;
      bossFightTimer = 0;
      numHits = 0;
      state = BOSS_FIGHT;
      pointReduction+=1;
      numBosses = 0;
      bosses.add(new Julia(new PVector(width-200, height/2)));
    }
    if (state == BOSS_FIGHT_WIN) {
      state = CUTSCENE_FOUR;
    }
    if (state == CUTSCENE_FOUR) {
      cutsceneFourSlide += 1;
      currentImgInd = 0;
    }
    if (state == CUTSCENE_FOUR && readyFour == true) {
      for (int i = 0; i < bonusTracking.length; i++) {
        bonusTotal += bonusTracking[i];
      }
      state = END_SCREEN;
    }
  }
}

//method that notes when a key is no longer pressed
//used for player movement
void keyReleased() {
  //if (key == CODED) {
  if (keyCode == LEFT) {
    left = false;
  }
  if (keyCode == RIGHT) {
    right = false;
  }
  if (keyCode == UP) {
    up = false;
  }
  if (keyCode == DOWN) {
    down = false;
  }
  if (keyCode == SHIFT && state == TITLE_SCREEN) {
    showInst = false;
  }
}
