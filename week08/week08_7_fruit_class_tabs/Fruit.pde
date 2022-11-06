//目標: class物件: 每個水果都可以用物件來產生(值、函式)
String line="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; //準備26個英文字母
class Fruit {
  float x, y, vx, vy;
  boolean flying;
  char c; //水果對應的字母
  PApplet sketch; //為了讓random可以用，修改一下
  Fruit(PApplet _sketch) { //建構子: 要產生一個水果一開始要做的事
    sketch = _sketch; //為了讓random可以用，修改一下
    reset();
  }
  void reset() {
    x = sketch.random(100.0, 300.0); //為了讓random可以用，修改一下
    y = 300;
    vx = sketch.random(-2, +2); //為了讓random可以用，修改一下
    vy = -13;
    flying = true;
    int i = int(random(26)); //從26個英文字母隨機隨選一個出來為i
    c = line.charAt(i); //隨機選出來這個字母i給c(水果對應的字母)
  }
  void update() {
    x += vx;
    y += vy;
    vy += 0.98/3; //重力加速度
  }
}
