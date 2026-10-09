// Emily Yang | 15 Sep 2026 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
float l, r, result;
char op;
boolean left, newEntry;
String displayVal;

void setup() {
  size(260, 480);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  displayVal = "0.0";
  left = true;
  // buttons
  numButtons[0] = new Button(40, 440, 40, 40, '0');
  numButtons[1] = new Button(40, 380, 40, 40, '1');
  numButtons[2] = new Button(100, 380, 40, 40, '2');
  numButtons[3] = new Button(160, 380, 40, 40, '3');
  numButtons[4] = new Button(40, 320, 40, 40, '4');
  numButtons[5] = new Button(100, 320, 40, 40, '5');
  numButtons[6] = new Button(160, 320, 40, 40, '6');
  numButtons[7] = new Button(40, 260, 40, 40, '7');
  numButtons[8] = new Button(100, 260, 40, 40, '8');
  numButtons[9] = new Button(160, 260, 40, 40, '9');
  opButtons[0] = new Button(220, 140, 40, 40, '+'); // add
  opButtons[1] = new Button(220, 200, 40, 40, '−'); // subtract
  opButtons[2] = new Button(220, 260, 40, 40, '×'); // multiply
  opButtons[3] = new Button(220, 320, 40, 40, '÷'); // divide
  opButtons[4] = new Button(100, 440, 40, 40, '.'); // decimal point
  opButtons[5] = new Button(160, 440, 40, 40, '±'); // neg/pos
  opButtons[6] = new Button(220, 410, 40, 100, '='); // equals
  opButtons[7] = new Button(70, 140, 100, 40, 'C'); // clear
  opButtons[8] = new Button(160, 140, 40, 40, '√'); // square root
  opButtons[9] = new Button(40, 200, 40, 40, 's'); // sin
  opButtons[10] = new Button(100, 200, 40, 40, 'c'); // cos
  opButtons[11] = new Button(160, 200, 40, 40, 't'); // tan
}

void draw() {
  background(#FFFDCE);
  drawDisplay();
  stroke(#EA74A2);

  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void drawDisplay() {
  rectMode(CENTER);
  fill(#D8FFFF);
  stroke(#52C1BE);
  rect(width/2, 70, 220, 60, 15);
  fill(#52C1BE);
  textSize(33);
  textAlign(RIGHT);
  text(displayVal, width-30, 90);
}

void mouseReleased() {

  //number buttons
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
    }
  }

  // Loop through opButtons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover == true) {
      handleEvent(opButtons[i].val, false);
    }
  }



  // display variables
  println("L:" + l);
  println("R:" + r);
  println("Result:" + result);
  println("Left:" + left);
  println("Op:" + op);
}


void performCalc() {
  if (op =='+') {
    result = l + r;
  } else if (op =='−') {
    result = l - r;
  } else if (op =='×') {
    result = l * r;
  } else if (op =='÷') {
    result = l / r;
  }
  displayVal = str(result);
  left = !left;
  l = result;
}

void keyPressed() {
  println("keyCode: " + keyCode);
  //number keys
  if (key == 49 || keyCode == 97) {
    handleEvent('1', true);
  } else if (key == 50 || keyCode == 98) {
    handleEvent('2', true);
  }  else if (key == 51 || keyCode == 99) {
    handleEvent('3', true);
  }  else if (key == 52 || keyCode == 100) {
    handleEvent('4', true);
  }  else if (key == 53 || keyCode == 101) {
    handleEvent('5', true);
  }  else if (key == 54 || keyCode == 102) {
    handleEvent('6', true);
  }  else if (key == 55 || keyCode == 103) {
    handleEvent('7', true);
  }  else if (key == 56 || keyCode == 104) {
    handleEvent('8', true);
  }  else if (key == 57 || keyCode == 105) {
    handleEvent('9', true);
  } else if (key == 48 || keyCode == 96) {
    handleEvent('0', true);
    
    //operator keys
  } else if (key == 45 || keyCode == 109) {
    handleEvent('−', false);
  } else if (keyCode == 107) {
    handleEvent('+', false);
  } else if (key == 47 || key == 111) {
    handleEvent('÷', false);
  } else if (keyCode == 106) {
    handleEvent('×', false);
  } else if (key == 10) {
    handleEvent('=', false);
  } else if (key == 46) {
    handleEvent('.', false);
  } else if (key == 8) {
    handleEvent('C', false);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    // do number stuff
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    // do operator stuff
    char clicked = val;

    if (clicked== '=') {
      performCalc();
    } else if (clicked == '+' || clicked == '−' || clicked == '×' || clicked == '÷') {
      op = clicked;
      left = false;
      newEntry = true;
      displayVal = str(op);
    } else if (clicked == '±') {
      if (left == true) {
        l *= -1;
        displayVal = str(l);
      } else {
        r *= -1;
        displayVal = str(r);
      }
    } else if (clicked == 'C') {
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      displayVal = "0.0";
      left = true;
      newEntry = true;
    } else if (clicked == '√') {
      if (left == true) {
        l = sqrt(l);
        displayVal = str(l);
      } else {
        r = sqrt(r);
        displayVal = str(r);
      }
    } else if (clicked == 's') {
      if (left == true) {
        l = sin(radians(l));
        displayVal = str(l);
      } else {
        r = sin(radians(r));
        displayVal = str(r);
      }
    } else if (clicked == 'c') {
      if (left == true) {
        l = cos(radians(l));
        displayVal = str(l);
      } else {
        r = cos(radians(r));
        displayVal = str(r);
      }
    } else if (clicked == 't') {
      if (left == true) {
        l = tan(radians(l));
        displayVal = str(l);
      } else {
        r = tan(radians(r));
        displayVal = str(r);
      }
    } else if (clicked == '.') {
      if (!displayVal.contains(".")) {
        displayVal += ".";
      }
    }
  }
}
