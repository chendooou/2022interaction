
function setup() {
    initializeFields();
    // 只執行一次
    // 開500*500視窗
    createCanvas(500, 500);
    // 先清背景
    background(color(0xFF, 0xFF, 0xF2));
    // 筆觸紅色
    stroke(255, 0, 0);
}

function draw() {
    // 每秒執行60次
    if (mouseIsPressed) {
        line(mouseX, mouseY, pmouseX, pmouseY);
    }
}

function keyPressed() {
    // 橙色
    if (key == '1')
        stroke(color(0xFC, 0xA0, 0x2E));
    // 黃色
    if (key == '2')
        stroke(color(0xFC, 0xFC, 0x2E));
    // 綠色
    if (key == '3')
        stroke(color(0x67, 0xFF, 0x46));
    // 藍色
    if (key == '4')
        stroke(color(0x46, 0xB9, 0xFF));
}

function initializeFields() {
}
