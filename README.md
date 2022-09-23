# 2022interaction 

## week01 互動技術筆記

```
Week01 2022-09-05
1. GitHub + Git for Windows
2. Processing 介面
3. 第一個程式: 點、線、面、色彩
4. 兩種模式: 直接跑 vs. 互動 (static vs. active)
5. 第一個互動程式: 小畫家
6. 將程式匯出到網頁
```
## 主題: 第一個程式: 點、線、面、色彩
```
1.預設視窗迷你小小的

2.如果想要調整字型大小: 檔案 > 偏好設定

3.調整視窗大小: size(500,500);

4.調整視窗顏色: background(#2286C6);
*工具>顏色選擇器，找到喜歡的顏色複製起來!!

5.畫一個矩形: rect(100,100, 100,150);
  在 100,100 的地方畫寬100，長150的矩形
  
6.幫小矩形填顏色: fill(#FFADE1);
  記得寫在rect之前
```

## 主題: 兩種模式: 直接跑 vs.互動 (static vs. active)
```
1.ctrl+N 開一個新的檔案
  第一個檔案做的是直接跑static，現在換作互動active
  加上 void setup(){} 和 void draw(){}
```

## 主題: 將程式匯出到網頁
```
1.裝好下載好這個p5.js，點他

2.會跳一個新的檔案出來，按執行會開啟一個空白的網頁

3.用電腦來翻譯java轉換成javascript: https://pde2js.herokuapp.com/
  將寫好的//active程式碼貼上左邊按藍色按鈕翻譯，右邊會出現翻譯好的

4.再將右邊的複製下來貼到新跳出來的p5.js，再按執行，
  跳出的網頁就有剛剛程式碼寫的內容了
```

## 主題: 第一個互動程式: 小畫家
```java
1.這個低配小畫家太爛了，滑鼠到哪線就畫到哪

2.改良: 加上 if( mousePressed ){} 當按下滑鼠左鍵時才畫出來

3.可以對看不懂意思的保留字案右鍵>在參考文件裡找選取的字

4.開啟新的檔案，並複製剛剛的程式碼做修改
  加上背景色，筆觸顏色，用數字鍵來做互動

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
## week02 互動技術筆記

```
Week02 2022-09-12
1. 主題:卡片
```

## 主題:畫圓弧狀的卡片
```java
1.畫一張卡片
rect(100,100, 150,250, 20); //最後一個參數是卡片弧度

//code:
//畫卡片
size(500,500);
int w=25;
rect(100-w/2,100-w/2, 150+w,250+w, 20);
fill(#FF00F2);
rect(100,100, 150,250, 20); //弧度
```

```java
2.畫很多張卡片
使用函式、設定參數，呼叫並且修改參數就可以畫很多張卡片 
void drawCard(int x, int y){}

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

```java
3.要加上牌面(像撲克牌左上角有黑桃、紅心、梅花、菱形那樣)
將函式名稱改成 drawPokerCard 並且加上 String face 變數，用來畫牌面
函式內設好牌面的顏色、大小

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

```java
4.讓牌面可以顯示中文字型，使用 PFont 宣告要顯示的字形和大小

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

```java
5.讓紅心和方塊顯示紅色的字
if ( face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1 ) fill(#FF0000);
  else fill(0);
// == -1 表示沒有
// 如果黑桃沒有或是梅花沒有，就是顯示紅色，其餘顯示黑色

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

```java
6.隨機產生牌面
String []flower = {"黑桃","紅心","方塊","梅花"}; //陣列{0,1,2,3}
使用字串陣列儲存牌面四個文字，所以使用random(4)
總共有13種牌面，所以0....12所以int(random(13)+1)

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
