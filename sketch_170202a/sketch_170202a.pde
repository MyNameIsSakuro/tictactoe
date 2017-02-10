int n=3, h=600/(n+1);
boolean kr=false;

int lentele[][]=new int[n][n];
boolean pasp=false, laimejo;

color fillColor = color(50, 102, 100);

PVector getMousePos() {
  int i, j;
  i=mouseX/h-1;
  j=mouseY/h-1;
  if (i>=0&&i<n&&j>=0&&j<n) {
    return new PVector(i, j);
  }
  return null;
}

void restart(){
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      lentele[i][j]=0;
    }
  }
  laimejo=false;
  curPlayer = 0;
}

void setup() {
  strokeCap(ROUND);
  size(700, 700);
  restart();
}

void grid() {
  stroke(0);
  strokeWeight(12);
  
  int a=1;
  if (kr)a=0;
  for (int i=0+a; i<=n-a; i++) {
    line((i+1)*h, h, h*(i+1), (n+1)*h);
    line(h, h*(i+1), (n+1)*h, h*(i+1));
  }
}

void spalvina() {
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      if (lentele[i][j] !=0) {
        noStroke();
        fill(fillColor);
        if (i==0&&j==0) {
          rect((i+1)*h+6, (j+1)*h+6, h-11, h-11, 55, 0, 0, 0);
        } else if (i==0&&j==n-1) {
          rect((i+1)*h+6, (j+1)*h+6, h-11, h-12, 0, 0, 0, 55);
        } else if (i==n-1&&j==0) {
          rect((i+1)*h+6, (j+1)*h+6, h-12, h-11, 0, 55, 0, 0);
        } else if (i==n-1&&j==n-1) {
          rect((i+1)*h+6, (j+1)*h+6, h+-12, h+-12, 0, 0, 55, 0);
        } else {
          rect((i+1)*h+6, (j+1)*h+6, h-11, h-11);
        }
        if(lentele[i][j]==1)
          kryziukas(i,j);
        else if(lentele[i][j]==2)
          nuliukas(i,j);
      }
    }
  }
}

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
  PVector pele = getMousePos();
  if (pele!=null) {
    fill(fillColor);
    noStroke();
    int i = (int)pele.x;
    int j = (int)pele.y;
    if (i==0&&j==0) {
      rect((i+1)*h+6, (j+1)*h+6, h-11, h-11, 55, 0, 0, 0);
    } else if (i==0&&j==n-1) {
      rect((i+1)*h+6, (j+1)*h+6, h-11, h-12, 0, 0, 0, 55);
    } else if (i==n-1&&j==0) {
      rect((i+1)*h+6, (j+1)*h+6, h-12, h-11, 0, 55, 0, 0);
    } else if (i==n-1&&j==n-1) {
      rect((i+1)*h+6, (j+1)*h+6, h+-12, h+-12, 0, 0, 55, 0);
    } else {
      rect((i+1)*h+6, (j+1)*h+6, h-11, h-11);
    }
  }
}

int curPlayer = 0;

void deda(PVector kur) {
  if(kur==null)
    return;
  noStroke();
  int i = (int)kur.x;
  int j = (int)kur.y;
  if(lentele[i][j] == 0){
    curPlayer++;
    lentele[i][j]=curPlayer;
    curPlayer%=2;
  }
}

boolean arlaimejo(int v) {
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      if (lentele[j][i]!=v)break;
      if (j==n-1) return true;
    }
  }
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      if (lentele[i][j]!=v)break;
      if (j==n-1) return true;
    }
  }
  for (int i=0; i<n; i++) {
    if (lentele[i][i]!=v)break;
    if (i==n-1) return true;
  }
  for (int i=n-1; i>=0; i--) {
    if (lentele[i][i]!=v)break;
    if (i==0) return true;
  }
  return false;
}

void mouseClicked() {
  deda(getMousePos());
  pasp=true;
}
void draw() {
  if (arlaimejo(1)||arlaimejo(2)) {
    background(255, 100, 255);
    text("sveikinu", 50, 50);
    if (pasp && laimejo)
      restart();
    else
      laimejo=true;
  } else {
    background(255, 255, 255);
    grid();
    spalvinauzvesta();
    spalvina();
  }

  pasp=false;
}