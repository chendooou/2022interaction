//目標: class物件: 每個水果都可以用物件來產生(值、函式)
class Fruit{
  float x, y, vx, vy;
  boolean flying;
  PApplet sketch; //為了讓random可以用，修改一下
  Fruit(PApplet _sketch){ //建構子: 要產生一個水果一開始要做的事
    sketch = _sketch; //為了讓random可以用，修改一下
    reset();
  }
  void reset(){
    x = sketch.random(100.0, 300.0); //為了讓random可以用，修改一下
    y = 300;
    vx = sketch.random(-2, +2); //為了讓random可以用，修改一下
    vy = -13;
    flying = true;
  }
  void update(){
    x += vx;
    y += vy;
    vy += 0.98/3; //重力加速度
  }
}
Fruit fruit;
void setup(){
  size(400,300);
  fruit = new Fruit(this); //為了讓random可以用，修改一下
}
void draw(){
  background(255,255,0);//黃色背景
  ellipse(fruit.x, fruit.y, 50, 50); //表示水果的圓
  fruit.update();
}
void keyPressed(){
  fruit.reset();  //每按一次鍵盤按鍵就準備一顆新水果
}
