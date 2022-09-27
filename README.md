# week01 互動技術筆記

Week01 2022-09-05
1. GitHub + Git for Windows
2. Processing 介面
3. 第一個程式: 點、線、面、色彩
4. 兩種模式: 直接跑 vs. 互動 (static vs. active)
5. 第一個互動程式: 小畫家
6. 將程式匯出到網頁

## 主題: 第一個程式: 點、線、面、色彩

1.預設視窗迷你小小的

2.如果想要調整字型大小: 檔案 > 偏好設定

3.調整視窗大小: size(500,500);

4.調整視窗顏色: background(#2286C6);
*工具>顏色選擇器，找到喜歡的顏色複製起來!!

5.畫一個矩形: rect(100,100, 100,150);
  在 100,100 的地方畫寬100，長150的矩形
  
6.幫小矩形填顏色: fill(#FFADE1);
  記得寫在rect之前


## 主題: 兩種模式: 直接跑 vs.互動 (static vs. active)

1.ctrl+N 開一個新的檔案
  第一個檔案做的是直接跑static，現在換作互動active
  加上 void setup(){} 和 void draw(){}


## 主題: 將程式匯出到網頁

1.裝好下載好這個p5.js，點他

2.會跳一個新的檔案出來，按執行會開啟一個空白的網頁

3.用電腦來翻譯java轉換成javascript: https://pde2js.herokuapp.com/
  將寫好的//active程式碼貼上左邊按藍色按鈕翻譯，右邊會出現翻譯好的

4.再將右邊的複製下來貼到新跳出來的p5.js，再按執行，
  跳出的網頁就有剛剛程式碼寫的內容了

## 主題: 第一個互動程式: 小畫家

1.這個低配小畫家太爛了，滑鼠到哪線就畫到哪

2.改良: 加上 if( mousePressed ){} 當按下滑鼠左鍵時才畫出來

3.可以對看不懂意思的保留字案右鍵>在參考文件裡找選取的字

4.開啟新的檔案，並複製剛剛的程式碼做修改
  加上背景色，筆觸顏色，用數字鍵來做互動
```java
//code:
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
```
# week02 互動技術筆記

Week02 2022-09-12
1. 主題:卡片


## 主題:畫圓弧狀的卡片

1.畫一張卡片
rect(100,100, 150,250, 20); //最後一個參數是卡片弧度
```java
//code:
//畫卡片
size(500,500);
int w=25;
rect(100-w/2,100-w/2, 150+w,250+w, 20);
fill(#FF00F2);
rect(100,100, 150,250, 20); //弧度
```

2.畫很多張卡片
使用函式、設定參數，呼叫並且修改參數就可以畫很多張卡片 
void drawCard(int x, int y){}
```java
//code:
void setup(){
   size(500,500);
}
int w=25;
void draw(){
  drawCard(100,100); //使用函式
  drawCard(130,130); //使用函式
  drawCard(160,160); //使用函式
}
void drawCard(int x, int y){
  fill(255);
  rect(x-w/2,y-w/2, 150+w,250+w, 20);
  fill(#FF00F2);
  rect(x,y, 150,250,20);
}
```

3.要加上牌面(像撲克牌左上角有黑桃、紅心、梅花、菱形那樣)
將函式名稱改成 drawPokerCard 並且加上 String face 變數，用來畫牌面
函式內設好牌面的顏色、大小
```java
//code:
void setup(){
   size(500,500);
}
int w=25;
void draw(){
  drawPokerCard(100,100, "S4"); //使用函式
  drawPokerCard(130,150, "H3"); //使用函式
  drawPokerCard(160,200, "D5"); //使用函式
  drawPokerCard(190,250, "CJ"); //使用函式
}//牌面
void drawPokerCard(int x, int y, String face){ 
  fill(255);
  rect(x-w/2,y-w/2, 150+w,250+w, 20);
  fill(#FF00F2);
  rect(x,y, 150,250,20);
  fill(0);
  textSize(40);
  text( face, x, y+40 );
}
```


4.讓牌面可以顯示中文字型，使用 PFont 宣告要顯示的字形和大小
```java
//code:
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
  fill(#FF00F2);
  rect(x,y, 150,250,20);
  fill(0);
  textSize(40);
  text( face, x, y+40 );
}
```


5.讓紅心和方塊顯示紅色的字
if ( face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1 ) fill(#FF0000);
  else fill(0);
// == -1 表示沒有
// 如果黑桃沒有或是梅花沒有，就是顯示紅色，其餘顯示黑色
```java
//code:
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
```


6.隨機產生牌面
String []flower = {"黑桃","紅心","方塊","梅花"}; //陣列{0,1,2,3}
使用字串陣列儲存牌面四個文字，所以使用random(4)
總共有13種牌面，所以0....12所以int(random(13)+1)
```java
//code:
void setup(){
   size(500,500);
   PFont font = createFont("標楷體",40);
   textFont(font);
   String []flower = {"黑桃","紅心","方塊","梅花"}; //陣列{0,1,2,3}
   face1 = flower[int(random(4))] + int(random(13)+1);
   face2 = flower[int(random(4))] + int(random(13)+1);
   face3 = flower[int(random(4))] + int(random(13)+1);
   face4 = flower[int(random(4))] + int(random(13)+1);
}
void mousePressed(){
  String []flower = {"黑桃","紅心","方塊","梅花"}; //陣列{0,1,2,3}
  face1 = flower[int(random(4))] + int(random(13)+1);
  face2 = flower[int(random(4))] + int(random(13)+1);
  face3 = flower[int(random(4))] + int(random(13)+1);
  face4 = flower[int(random(4))] + int(random(13)+1);
}
String face1,face2,face3,face4;
void draw(){
  drawPokerCard(100,100, face1); //使用函式
  drawPokerCard(130,150, face2); //使用函式
  drawPokerCard(160,200, face3); //使用函式
  drawPokerCard(190,250, face4); //使用函式
}//牌面
void drawPokerCard(int x, int y, String face){ 
  int w=25;
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
```

# week03 互動技術筆記
Week02 2022-09-19
主題:撲克牌、圍棋、象棋
1.(複習)放牌、秀牌、洗牌
2.如何選到牌
3. class物件

## 主題:複習
1.將上週最後一個程式從 github 複製出來

2.將隨機洗牌的部分創 myShuffle()獨立出來

3.再創一個 mousePressed()裡面裝 myShuffle();
  就可以滑鼠點一下就進行一次洗牌
  
```java
void setup(){
   size(500,500);
   PFont font = createFont("標楷體",40);
   textFont(font);
   myShuffle();
}
void myShuffle(){
   String []flower = {"黑桃","紅心","方塊","梅花"}; //陣列{0,1,2,3}
   face1 = flower[int(random(4))] + int(random(13)+1);
   face2 = flower[int(random(4))] + int(random(13)+1);
   face3 = flower[int(random(4))] + int(random(13)+1);
   face4 = flower[int(random(4))] + int(random(13)+1);
}
void mousePressed(){
  myShuffle();
}
String face1,face2,face3,face4;
void draw(){
  drawPokerCard(100,100, face1); //使用函式
  drawPokerCard(130,150, face2); //使用函式
  drawPokerCard(160,200, face3); //使用函式
  drawPokerCard(190,250, face4); //使用函式
}//牌面
void drawPokerCard(int x, int y, String face){ 
  int w=25;
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
```

## 主題:(複習)放牌、秀牌、洗牌
1.畫出52張牌
  使用 rect 畫矩形，用迴圈畫52次
  
```java
void setup(){
 size(700,700); 
}
void draw(){
 background(#FFFFF2);
 for(int i=0; i<52; i++){ //迴圈
    int x = (i%10)*60; //除法10餘數
    int y = int(i/10)*120; //十位數
    rect( x, y, 60, 120 );
 }
}
```

2.讓52張牌加上牌面
  要顯示中文字要用 PFont font
  用一個陣列 String[] face 將所有的牌面都寫進去(先都寫黑桃測試)
  用 text 印出來
  
 ```java
 void setup(){
 size(700,700); 
 PFont font = createFont("標楷體", 10);
 textFont(font);
}
String [] faces = {
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
};
void draw(){
 background(#FFFFF2);
 for(int i=0; i<52; i++){ //迴圈
    int x = (i%10)*60; //除法10餘數
    int y = int(i/10)*120; //十位數
    fill(255); rect( x, y, 60, 120);
    fill(0);  text( faces[i], x+25, y+80);
 }
}
 ```
 3.牌面要把原本全是黑桃換成有紅心、方塊、梅花:
  用 notepad++ 的取代功能可以很有效率的代換中文字
  牌面讓黑桃、梅花顯示黑色；紅心、方塊顯示紅色
  然後用 if條件式寫 不是紅心或是不是方塊 就填黑色,否則填紅色
  if( faces[i].indexOf("紅心")==-1 && faces[i].indexOf("方塊")==-1) fill(0);
  else fill(255,0,0)
  ```java
  void setup(){
 size(800,600); 
 PFont font = createFont("標楷體", 16);
 textFont(font);
}
String [] faces = {
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K"
};
void draw(){
 background(#FFFFF2);
 for(int i=0; i<52; i++){ //迴圈
    int x = (i%13)*60; //除法10餘數
    int y = int(i/13)*120; //十位數
    fill(255); rect( x, y, 60, 120);
    if( faces[i].indexOf("紅心")==-1 && faces[i].indexOf("方塊")==-1) fill(0);
    else fill(255,0,0);
    text( faces[i], x+10, y+60);
 }
}
  ```
4.點擊滑鼠一次就交換兩張牌:
mousePressed()裡設變數 a,b 隨機52取一個數字，然後用 String 給一個空的字串值 temp,然後隨機取數的 a,b 帶入 faces[]裡，和 temp 配合做隨機的兩個牌面交換
```java
void setup(){
 size(800,600); 
 PFont font = createFont("標楷體", 16);
 textFont(font);
}
String [] faces = {
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K"
};
void draw(){
 background(#FFFFF2);
 for(int i=0; i<52; i++){ //迴圈
    int x = (i%13)*60; //除法10餘數
    int y = int(i/13)*120; //十位數
    fill(255); rect( x, y, 60, 120);
    if( faces[i].indexOf("紅心")==-1 && faces[i].indexOf("方塊")==-1) fill(0);
    else fill(255,0,0);
    text( faces[i], x+10, y+60);
 }
}
void mousePressed(){
   int a = int(random(52));
   int b = int(random(52));
   //目標: faces[a] v.s faces[b] 交換
   String temp = faces[a];
   faces[a] = faces[b];
   faces[b] = temp;
}
```
5.上周的最後一個程式，滑鼠點一下就洗牌。但是會洗出重複的牌，所以用這周的程式碼結合上周最後的程式碼改良，點一下洗牌就絕對不會洗到重覆的牌面了。
```java
//以 week03-1 當基底,加上 week03-5 的三小段
void setup(){
   size(500,500);
   PFont font = createFont("標楷體",40);
   textFont(font);
   myShuffle();
}
String [] faces = {
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K"};
void myShuffle(){
  for(int k=0; k<10000; k++){
   int a = int(random(52));
   int b = int(random(52));
   //目標: faces[a] v.s faces[b] 交換
   String temp = faces[a];
   faces[a] = faces[b];
   faces[b] = temp;
  }
   face1 = faces[0];
   face2 = faces[1];
   face3 = faces[2];
   face4 = faces[3];
}
void mousePressed(){
  myShuffle();
}
String face1,face2,face3,face4;
void draw(){
  drawPokerCard(100,100, face1); //使用函式
  drawPokerCard(130,150, face2); //使用函式
  drawPokerCard(160,200, face3); //使用函式
  drawPokerCard(190,250, face4); //使用函式
}//牌面
void drawPokerCard(int x, int y, String face){ 
  int w=25;
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
```

# week04 互動技術筆記
主題:
1.動態島的打彈珠/磚塊
2.上週:圍棋、象棋

## 主題:動態島的打彈珠/磚塊
1.產生一個橢圓讓他無限往右上方跑
```java
void setup(){
 size(500,500);
}
int x=250, y=250; //變數(位置)
void draw(){
 ellipse(x,y,10,10); //橢圓
 x = x + 1;
 y = y - 1;
}
```
2.把 int　換成 float 讓數值更精確 
  讓小圓能夠碰到邊界反彈(碰到右邊和上方反彈)
```java
void setup(){
 size(500,500);
}
float x=250, y=250; //變數(位置)改float更精細
float vx=1.0 , vy = -0.5;
void draw(){
 ellipse(x,y,10,10); //橢圓
 x = x + vx;
 y = y + vy;
 if( x > 500) vx = -vx;
 if( y < 0) vy = -vy;
}
```
3.加上左邊界也可以反彈，畫出一個板子能夠攔截反彈小球
```java
void setup(){
 size(500,500);
}
float x=250, y=250; //變數(位置)改float更精細
float vx=1.0 , vy = -0.5;
void draw(){
 background(#FFFFF2); //背景
 int boardX = mouseX;
 rect(boardX, 470, 100, 20); //控制的板子
 ellipse(x,y,10,10); //橢圓
 x = x + vx;
 y = y + vy;
 if( x > 500) vx = -vx;
 if( y < 0) vy = -vy;
 if( x < 0) vx = -vx;
 if( y>470 && x>boardX && x<boardX+100) vy = -vy;
}
```
4.把板子反彈的條件式修改更完善,將板子座標和長寬獨立出來宣告
  速度再加上滑鼠的速度,加上滑鼠左右鍵控制板子寬度
  *pmouseX是指滑鼠前一秒的X位置，mouseX - pmouseX的改變量當作摩擦力
  
```java
void setup(){
 size(500,500);
}
float x=250, y=250; //變數(位置)改float更精細
float vx=3.0 , vy = -0.5; //可以調整小球移動速度
float boardX, boardY=470, boardW=100, boardH=20;
void draw(){
 boardX = mouseX - boardW/2;
 background(#FFFFF2); //背景
 int boardX = mouseX;
 rect(boardX, boardY, boardW, boardH); //控制的板子
 ellipse(x,y,10,10); //橢圓
 x = x + vx;
 y = y + vy;
 if( x > 500) vx = -vx;
 if( y < 0) vy = -vy;
 if( x < 0) vx = -vx;
 if( (y>boardY && y<boardY+boardH) && (x>boardX && x<boardX+boardW) ){
     vy = -vy;
     vx += (mouseX - pmouseX)/2; //mouse的移動速度
   }
   if(mousePressed && mouseButton==LEFT) boardW *= 1.01; //滑鼠右鍵按下增加板子寬度
   if(mousePressed && mouseButton==RIGHT) boardW *= 0.99; //滑鼠右鍵按下縮短板子寬度
}
```

## 主題:圍棋
1.用迴圈來畫很多棋
```java
void setup(){
 size(500,500); 
}
void draw(){
 //用迴圈畫出很多棋
 for(int x=50; x<=450; x+=50){
  for(int y=50; y<=450; y+=50){
     ellipse(x, y, 50, 50); 
  }
 }
}
```
2.用 9 * 9 陣列array來控制要變成黑子的棋
```java
void setup(){
 size(500,500); 
}
int [][] go={
 {0,0,1,0,0,0,0,0,0},
 {0,0,0,0,0,0,1,0,0},
 {0,0,0,0,0,0,0,0,0},
 {0,0,0,0,1,0,0,0,0},
 {0,1,0,0,0,1,0,0,0},
 {0,0,0,0,0,1,0,0,0},
 {0,0,1,1,0,0,1,0,0},
 {0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0},
}; //陣列 array 9*9
void draw(){ 
 //用迴圈畫出很多棋
 for(int i=0; i<9; i++){ //左手i 對應y座標
  for(int j=0; j<9; j++){ //右手j 對應x座標
   if( go[i][j]==1) fill(0);
   else fill(255);
     ellipse(50+j*50, 50+i*50, 50, 50); 
  }
 }
}
```
3.創造棋盤:
  背景改木頭色
  用for迴圈畫出棋盤的線
  0:沒有棋子 1:黑棋  2:白棋
```java
void setup(){
 size(500,500); 
}
int [][] go={
 {0,0,1,0,0,0,0,0,0},
 {0,0,0,0,0,0,1,0,0},
 {2,0,0,2,0,0,2,0,0},
 {0,0,0,0,1,0,0,0,0},
 {0,1,0,2,0,1,0,0,0},
 {0,0,0,0,0,1,0,0,0},
 {0,0,1,1,0,0,1,0,0},
 {0,0,0,0,0,0,0,0,0},
 {0,0,0,2,0,2,0,0,0},
}; //陣列 array 9*9
void draw(){ 
 //用迴圈畫出很多棋
 background(246,194,108); //木頭色棋盤
 for(int i=1; i<=9; i++){ //畫棋盤上的線
  line(50, 50*i, 450, 50*i); //湊出來的
  line(50*i, 50, 50*i, 450); //湊出來的
 }
 for(int i=0; i<9; i++){ //左手i 對應y座標
  for(int j=0; j<9; j++){ //右手j 對應x座標
  //0:沒有棋子 1:黑棋  2:白棋
   if( go[i][j]==1){
       fill(0); //1:黑棋
       ellipse(50+j*50, 50+i*50, 40, 40); 
     }
    else if( go[i][j]==2){
      fill(255); //2:白棋
      ellipse(50+j*50, 50+i*50, 40, 40); 
    } 
  }
 }
}
```
4.用滑鼠按一下棋盤就下棋
```java
void setup(){
 size(500,500); 
}
int [][] go={ //一開始的棋盤要清為0
 {0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0},
 {0,0,0,0,0,0,0,0,0},
}; //陣列 array 9*9
int N=0; //目前有幾個棋子(一開始為0)
void mousePressed(){
 int j = (mouseX-25)/50; //右手j, 對應x座標
 int i = (mouseY-25)/50; //左手i, 對應y座標
 go[i][j] = (N%2==0) ? 1 : 2 ; //if(N%2==0)成立就用1(下黑棋)，否則用2(下白棋)
 N++; //下完就多一顆棋子
}
void draw(){ //用迴圈畫出很多棋
 background(246,194,108); //木頭色棋盤
 for(int i=1; i<=9; i++){ //畫棋盤上的線
  line(50, 50*i, 450, 50*i); //湊出來的
  line(50*i, 50, 50*i, 450); //湊出來的
 }
 for(int i=0; i<9; i++){ //左手i 對應y座標
  for(int j=0; j<9; j++){ //右手j 對應x座標
  //0:沒有棋子 1:黑棋  2:白棋
   if( go[i][j]==1){
       fill(0); //1:黑棋
       ellipse(50+j*50, 50+i*50, 40, 40); 
     }
    else if( go[i][j]==2){
      fill(255); //2:白棋
      ellipse(50+j*50, 50+i*50, 40, 40); 
    } 
  }
 }
}
```
