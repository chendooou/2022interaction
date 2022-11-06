void setup(){
 size(400,300); 
}
int stage=1;
void draw() {
  background(255,255,0);
  fill(255,0,0);
  textSize(50);
  if (stage==1) {  //舞台1
    text( "stage 1", 125, 150);  //在125,150的地方印出stage 1
  } else if (stage==2) {
    text( "stage 2", 125, 150);
  }
}
void mousePressed() {
  if (stage==1) stage=2; //點擊切換成stage2
  else if (stage==2) stage=1;
}
