class Button {
  // Member Variables
  float x, y, w, h;
  char val;
  boolean hover;
  color c1, c2;

  // constructor
  Button(float x, float y, float w, float h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    hover = false;
    c1 = color(#FFADCC);
    c2 = color(#FFE8F1);
    strokeWeight(3);
  }

  // Member Methods
  void display() {
    if (hover == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 15);
    fill(255);
    textAlign(CENTER);
    textSize(22);
    text(val, x, y+8);
  }


  void mouseOver(float tempX, float tempY) {
    if (tempX>x-w/2 && tempX<x+w/2 && tempY>y-h/2 && tempY<y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
