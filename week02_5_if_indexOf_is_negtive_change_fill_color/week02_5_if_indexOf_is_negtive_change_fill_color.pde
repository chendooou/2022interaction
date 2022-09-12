void setup(){
   size(500,500);
   PFont font = createFont("標楷體",40);
   textFont(font);
}
int w=25;
void draw(){
  drawPokerCard(100,100, "黑桃4"); //使用函式
  drawPokerCard(130,150, "紅心3"); //使用函式
  drawPokerCard(160,200, "方塊5"); //使用函式
  drawPokerCard(190,250, "梅花J"); //使用函式
}//牌面
void drawPokerCard(int x, int y, String face){ 
  fill(255);
  rect(x-w/2,y-w/2, 150+w,250+w, 20);
  fill(#6FCBF5);
  rect(x,y, 150,250,20);
  fill(0);//黑色的字
  if ( face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1 ) fill(#FF0000);
  else fill(0);
  textSize(40);
  text( face, x, y+40 );
}
