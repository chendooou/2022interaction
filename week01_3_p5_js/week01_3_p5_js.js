
function setup() {
    initializeFields();
    createCanvas(500, 500);
}

function draw() {
    background(color(0x22, 0x86, 0xC6));
    fill(color(0xFF, 0xAD, 0xE1));
    rect(100, 100, 100, 150);
    rect(mouseX, mouseY, 100, 150);
}

function initializeFields() {
}
