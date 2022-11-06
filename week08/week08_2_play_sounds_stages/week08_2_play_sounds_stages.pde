import processing.sound.*;
SoundFile sound1, sound2, sound3;
void setup() {
  size(400, 300);
  textSize(50);  //設定字型size
  fill(255, 0, 0);  //字型顏色
  sound1 = new SoundFile(this, "In Game Music.mp3");
  sound2 = new SoundFile(this, "Intro Song_Final.mp3");
  sound1.play();
}
int stage =1;
void draw() {
  background(255);
  if (stage==1) {  //舞台1
    text( "stage 1", 125, 150);  //在125,150的地方印出stage 1
  } else if (stage==2) {
    text( "stage 2", 125, 150);
  }
}
void mousePressed() {
  if (stage==1) {  //stage1音樂正在播，點擊切換成stage2音樂
    stage=2; //點擊切換成stage2
    sound1.stop(); //stage1音樂停止
    sound2.play(); //stage2音樂播放
  } else if (stage==2) {
    stage=1;
    sound2.stop();
    sound1.play();
  }
}
