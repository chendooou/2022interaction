//目標:有個水果飛起來!!
//按下按鍵可以消掉水果
void setup(){
  size(400,300);
}
float fruitX=200, fruitY=150;  //水果的位置 X、Y 
float fruitVX=1, fruitVY=-1;   //水果的速度 VX VY
boolean flying=true; //布林變數: true 飛 / false 沒在飛
void draw(){
  background(255,255,0);//黃色背景
  
  ellipse(fruitX, fruitY, 50, 50);  //表示水果的圓
  if(flying){  //如果在飛,水果的位置會改變
    fruitX += fruitVX;
    fruitY += fruitVY;
  }
}
void keyPressed(){
  flying=false;  //不要飛 水果(圓)停在原地
}
