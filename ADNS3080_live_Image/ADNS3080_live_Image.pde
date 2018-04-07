import processing.serial.*;

int lf = 10;    // ASCII Linefeed
String myString = null;
Serial myPort;

int[] dists = new int[31];

void setup() {
  size(320, 320);
  background(0);
  smooth();
  noFill();
  stroke(20, 255, 20);

  myPort = new Serial(this, Serial.list()[1], 250000); //baud rate
  myPort.clear();
  myString = myPort.readStringUntil(lf);
  myString = null;
}

void draw() {

  while (myPort.available() > 0) {
    myString = myPort.readStringUntil(lf);
    if (myString != null) {
      //String SSAccX = myString.substring(0,5);
      if (myString.length() >= 900) {
        drawStuff();
      }
    }
  }
}

void drawStuff() {
  background(255, 40, 40);
  drawImage();
}

void drawImage() {
  for (int i = 1; i <= 30; i++) {
    dists[i] = 35;
  }

  for (int i = 1; i <= 30; i++) {
    for (int j = 0; j < 30; j++) {
      int StringPosition = ((i-1)*30)+j;
      int colorScale = myString.charAt(StringPosition);
      //println(colorScale);
      int realColor = 0;

      // sorry for this ... ;)
      switch(colorScale) {
      case 48:
        realColor = 8; //black
        break;
      case 49:
        realColor = 16; //less black
        break;
      case 50:
        realColor = 32; // some kind of grey
        break;
      case 51:
        realColor = 48;
        break;
      case 52:
        realColor = 64;
        break;
      case 53:
        realColor = 80;
        break;
      case 54:
        realColor = 96;
        break;
      case 55:
        realColor = 112;
        break;
      case 56:
        realColor = 128;
        break;
      case 57:
        realColor = 144;
        break;
      case 97:
        realColor = 160;
        break;
      case 98:
        realColor = 176;
        break;
      case 99:
        realColor = 192;
        break;
      case 100:
        realColor = 208;
        break;
      case 101:
        realColor = 224;
        break;
      case 102:
        realColor = 240;
        break;
      }

      stroke(realColor);
      fill(realColor);
      rect(i*10, j*10+10, 10, 10);
    }
  }
}

void drawDists() {
  for (int v = 1; v <= 29; v++) {
    stroke(50);
    fill(40, 255, 50);
    rect(v*10, dists[v]*10, 10, 10);
  }
}