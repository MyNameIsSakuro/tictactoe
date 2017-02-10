int n=3, h=600/(n+1);
boolean kr=false;
color fillColor = color(50, 102, 100);

int lentele[][]=new int[n][n];
boolean pasp=false;
int laimejes;
int curPlayer = 0;

class position{
  boolean in=false;
  int i,j;
  position(){ //iš pelės koord
    fromPix(mouseX,mouseY);
  }
  void fromPix(float x, float y){ //iš pikselių
    i=(int)x/h-1;
    j=(int)y/h-1;
    in = i>=0&&i<n&&j>=0&&j<n;
  }
  position(int x, int y){ //iš langelio koord
    i=x;
    j=y;
    in = i>=0&&i<n&&j>=0&&j<n;
  }
}

void restart(){
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      lentele[i][j]=0;
    }
  }
  laimejes=0;
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

void spalvina() {
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      if (lentele[i][j] !=0) {
        langelioFonas(i,j);
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
  position pele = new position();
  if (pele.in) {
    langelioFonas(pele.i, pele.j);
  }
}

void deda(position kur) {
  if(kur==null)
    return;
  noStroke();
  int i = kur.i;
  int j = kur.j;
  if(lentele[i][j] == 0){
    curPlayer++;
    lentele[i][j]=curPlayer;
    if(arlaimejo(curPlayer))
      laimejes=curPlayer;
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
  for (int i=0; i<n; i++) {
    if (lentele[n-i-1][i]!=v)break;
    if (i==n-1) return true;
  }
  return false;
}

void mouseClicked() {
  if(laimejes == 0){
    position pele = new position();
    if (pele.in) 
      deda(new position());
  }
  else
    restart();
}
void draw() {
  if (laimejes!=0) {
    background(255, 100, 255);
    textSize(50);
    text("sveikinu", 50, 50);
    String text = "laimėjo ";
    if(laimejes==1)
      text+="kryžiukai";
    else
      text+="nuliukai";
    text( text, 50, 100);
  } else {
    background(255);
    grid();
    spalvinauzvesta();
    spalvina();
  }
}