Fruit[] fruits; //加上陣列就可以產生好多顆水果
void setup(){
  size(400,300);
  fruits = new Fruit[3];
  for(int i=0; i<3; i++){
    fruits[i] = new Fruit(this);  //為了讓random可以用，修改一下
  }
}
void draw(){
  background(255,255,0);//黃色背景
  for(int i=0; i<3; i++){ //創造3顆水果
    fill(255); 
    ellipse(fruits[i].x, fruits[i].y, 50, 50);  //表示水果的圓
    textSize(30);
    textAlign(CENTER,CENTER);
    fill(0); text(fruits[i].c, fruits[i].x, fruits[i].y); //表示水果的圓 印字上去
    fruits[i].update(); //可以更新水果的字
  }
}
void keyPressed(){
  for(int i=0; i<3; i++){
    if( keyCode == fruits[i].c){ //如果鍵盤按下的字母和水果上的字母一樣
      fruits[i].reset();  //就消掉原本的 更新另一顆新的水果
    }
  }
}
