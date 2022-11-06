//目標:有個水果飛起來!!
//按下按鍵可以消掉水果
void setup(){
  size(400,300);
}
float fruitX=200, fruitY=300;  //水果的位置 X、Y 
float fruitVX=2, fruitVY=-13;  //水果的速度 VX VY
boolean flying=true; //布林變數: true 飛 / false 沒在飛
void draw(){
  background(255,255,0);//黃色背景
  ellipse(fruitX, fruitY, 50, 50);  //表示水果的圓
  if(flying){  //如果在飛,水果的位置會改變
    fruitX += fruitVX;
    fruitY += fruitVY;
    fruitVY += 0.98/3;  //重力加速度
  }
}
void keyPressed(){
  flying=false;  //不要飛 水果(圓)停在原地
  fruitReset();  //重新準備另一發水果
}
void fruitReset(){
  fruitX=random(100,300);   //隨機數值，介於100~300之間
  fruitY=300;     //固定飛的高度
  fruitVX=random(-2,+2);     //隨機數值，介於-2~+2之間
  fruitVY=-13;    //回復成原本的速度
  flying=true;    //按下按鍵(這個函式寫在keyPressed函式裡)就繼續重飛
}
