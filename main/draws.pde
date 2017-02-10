void kryziukas(int i, int j) {
  stroke(0);
  strokeWeight(8);
  line((i+1)*h+24, (j+1)*h+24, (i+2)*h-24, (j+2)*h-24);
  line((i+2)*h-24, (j+1)*h+24, (i+1)*h+24, (j+2)*h-24);
}

void nuliukas(int i, int j) {
  stroke(0);
  strokeWeight(8);
  noFill();
  ellipseMode(CENTER);
  ellipse(h*(i+1.5), h*(j+1.5), h-36, h-36);
}

void spalvinauzvesta() {
  position pele = new position();
  if (pele.in) {
    langelioFonas(pele.i, pele.j);
  }
}

void langelioFonas(int i, int j){
    fill(fillColor);
    noStroke();
    if (i==0&&j==0) {
      rect((i+1)*h+6, (j+1)*h+6, h-11, h-11, 55, 0, 0, 0);
    } else if (i==0&&j==n-1) {
      rect((i+1)*h+6, (j+1)*h+6, h-11, h-12, 0, 0, 0, 55);
    } else if (i==n-1&&j==0) {
      rect((i+1)*h+6, (j+1)*h+6, h-12, h-11, 0, 55, 0, 0);
    } else if (i==n-1&&j==n-1) {
      rect((i+1)*h+6, (j+1)*h+6, h-12, h-12, 0, 0, 55, 0);
    } else {
      rect((i+1)*h+6, (j+1)*h+6, h-11, h-11);
    }
}