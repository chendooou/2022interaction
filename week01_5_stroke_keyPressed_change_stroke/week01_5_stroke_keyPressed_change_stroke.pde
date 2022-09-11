void setup(){//只執行一次
  size(500,500); //開500*500視窗
  background(#FFFFF2); //先清背景
  stroke(255,0,0); //筆觸紅色
}
void draw(){ //每秒執行60次
  if( mousePressed ){
    line(mouseX,mouseY, pmouseX,pmouseY);
  }
}
void keyPressed(){//如果有按下按鍵
  if( key == '1' ) stroke(#FCA02E); //橙色
  if( key == '2' ) stroke(#FCFC2E); //黃色
  if( key == '3' ) stroke(#67FF46); //綠色
  if( key == '4' ) stroke(#46B9FF); //藍色
}
