//info about pausing found here: https://code.compartmental.net/minim/audioplayer_method_pause.html
//info also from lab

//library loading
import ddf.minim.*;

//creates variable holding the name of the file
Minim minim;
AudioPlayer crash, eerie, bgMusic, sparkle, busPass, hit, grass, busGood, click, lose, win, bossMusic, throwSound;
AudioPlayer puzzleCorrect, bonus, shootUnlock, register, blender, bottleDoor, bossWhoosh, bossWinSound, end, personDoor;
final String CRASH = "crash.mp3"; //from: https://www.youtube.com/watch?v=hcS-DAvsgyk&ab_channel=TedThat%27sme
final String EERIE = "eerie.mp3"; //from: https://www.youtube.com/watch?v=GjsE4AOb4dQ&t=39s&ab_channel=Vapid
final String BG_MUSIC = "BgMusic.mp3"; //from: https://www.youtube.com/watch?v=P-BqmegCUpA&t=192s&ab_channel=SuperRedGames
final String SPARKLE = "sparkle.mp3"; //from: https://www.youtube.com/watch?v=qcOBheXF43w&ab_channel=DigitalStockSounds
final String BUS_GOOD = "bus.mp3"; //from: https://www.youtube.com/watch?v=p21MAv7Nvq8&ab_channel=SoundLibrary
final String BUS_PASS = "BusPass.mp3"; //from: https://www.youtube.com/watch?v=p21MAv7Nvq8&ab_channel=SoundLibrary
final String HIT = "hit.mp3"; //from: https://www.youtube.com/watch?v=g-lcamn3VRE&ab_channel=GamingSFX
final String GRASS = "grass.mp3"; //from: https://www.youtube.com/watch?v=4eVmKIfZFpY&ab_channel=DJSoundFX
final String CLICKS = "click.mp3"; //from: https://www.youtube.com/watch?v=TrvddmNtyj4&ab_channel=SoundFX
final String LOSE = "lose.mp3"; //from: https://www.youtube.com/watch?v=jAIlKqL3nHo&ab_channel=TanvirulAmbia
final String WIN = "win.mp3"; //from: https://www.youtube.com/watch?v=rzxLd9M5yp8&ab_channel=Moe
final String BOSS_MUSIC = "BossMusic.mp3"; //from: https://www.youtube.com/watch?v=UXw0ldVmqKA&t=19s&ab_channel=Tempulse
final String THROW = "throw.mp3"; //from: https://www.youtube.com/watch?v=EQ_2hcF_yqM&ab_channel=SoundLibrary
final String PUZZLE_CORRECT = "PuzzleCorrect.mp3"; //from: https://www.youtube.com/watch?v=qcOBheXF43w&ab_channel=DigitalStockSounds
final String BONUS = "bonus.mp3"; //from: https://www.youtube.com/watch?v=1YCxd2xx9jg&ab_channel=SoundEffectsMaker
final String SHOOT_UNLOCK = "ShootUnlock.mp3"; //from: https://www.youtube.com/watch?v=7Oqt7z9ezP4&ab_channel=PVSOUNDFX
final String REGISTER = "register.mp3"; //from: https://www.youtube.com/watch?v=kXV7OLDOpao&ab_channel=SoundFX
final String BLENDER = "blender.mp3"; //from: https://www.youtube.com/watch?v=QY-WEHoRfsk&ab_channel=SoundEffectDatabase
final String BOTTLE_DOOR = "BottleDoor.mp3"; //from: https://www.youtube.com/watch?v=Nfg1LS5b5x8&ab_channel=GamingSoundEffects
final String BOSS_WHOOSH = "BossWhoosh.mp3"; //from: https://www.youtube.com/watch?v=D9AxvFHq9yU&ab_channel=CoolSoundFX
final String BOSS_WIN_SOUND = "BossWinSound.mp3"; //from: https://www.youtube.com/watch?v=IWHA8I3Nklw&ab_channel=NeedSounds
final String END = "end.mp3"; //from: https://www.youtube.com/watch?v=pfKIfBa067Q&ab_channel=SoundLibrary
final String PERSON_DOOR = "PersonDoor.mp3"; //from: https://www.youtube.com/watch?v=Nfg1LS5b5x8&ab_channel=GamingSoundEffects

//loads all sounds and attaches them to an audioplayer that can be called
void loadAssets() {
  minim = new Minim(this);
  crash = minim.loadFile(CRASH);
  eerie = minim.loadFile(EERIE);
  bgMusic = minim.loadFile(BG_MUSIC);
  sparkle = minim.loadFile(SPARKLE);
  busGood = minim.loadFile(BUS_GOOD);
  busPass = minim.loadFile(BUS_PASS);
  hit = minim.loadFile(HIT);
  grass = minim.loadFile(GRASS);
  click = minim.loadFile(CLICKS);
  lose = minim.loadFile(LOSE);
  win = minim.loadFile(WIN);
  bossMusic = minim.loadFile(BOSS_MUSIC);
  throwSound = minim.loadFile(THROW);
  puzzleCorrect = minim.loadFile(PUZZLE_CORRECT);
  bonus = minim.loadFile(BONUS);
  shootUnlock = minim.loadFile(SHOOT_UNLOCK);
  register = minim.loadFile(REGISTER);
  blender = minim.loadFile(BLENDER);
  bottleDoor = minim.loadFile(BOTTLE_DOOR);
  bossWhoosh = minim.loadFile(BOSS_WHOOSH);
  bossWinSound = minim.loadFile(BOSS_WIN_SOUND);
  end = minim.loadFile(END);
  personDoor = minim.loadFile(PERSON_DOOR);
}
