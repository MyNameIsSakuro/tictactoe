int n=10, h=600/(n+1);
boolean kr=false, arp[][]=new boolean[n][n], arn[][]=new boolean[n][n];

boolean pasp=false, laimejo;
void grid(int n, int h, boolean kr) {
  n++;
  int a=1;
  if (kr)a=0;
  for (int i=0+a; i<n-a; i++) {
    line((i+1)*h, h, h*(i+1), n*h);
    line(h, h*(i+1), n*h, h*(i+1));
  }
}
void spalvina() {
  fill(50, 102, 100);
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      if (arp[i][j]||arn[i][j]) {
        if (i==0&&j==0) {
          noStroke();
          rect((i+1)*h+6, (j+1)*h+6, h-11, h-11, 55, 0, 0, 0);
          stroke(0);
        } else if (i==0&&j==n-1) {
          noStroke();
          rect((i+1)*h+6, (j+1)*h+6, h-11, h-12, 0, 0, 0, 55);
          stroke(0);
        } else if (i==n-1&&j==0) {
          noStroke();
          rect((i+1)*h+6, (j+1)*h+6, h-12, h-11, 0, 55, 0, 0);
          stroke(0);
        } else if (i==n-1&&j==n-1) {
          noStroke();
          rect((i+1)*h+6, (j+1)*h+6, h+-12, h+-12, 0, 0, 55, 0);
          stroke(0);
        } else {
          noStroke();
          rect((i+1)*h+6, (j+1)*h+6, h-11, h-11);
          stroke(0);
        }
      };
    }
  }
}
void kryziukas() {
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      if (arp[i][j]) {
        strokeCap(ROUND);
        strokeWeight(8);
        line((i+1)*h+24, (j+1)*h+24, (i+2)*h-24, (j+2)*h-24);
        line((i+2)*h-24, (j+1)*h+24, (i+1)*h+24, (j+2)*h-24);
        strokeWeight(12.0);
      }
    }
  }
}
void nuliukas() {
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      if (arn[i][j]) {
        strokeCap(ROUND);
        strokeWeight(8);
        noFill();
        ellipseMode(CENTER);
        ellipse(h*(i+1.5), h*(j+1.5), h-36, h-36);
        strokeWeight(12.0);
      }
    }
  }
}

/*
void kurpele(){
 for (int i=0;i<n;i++){
 if(mouseX>h*i&&mouseX<h*(i+1)){
 for (int j=0;j<n;j++){
 if(mouseY>h*j&&mouseY<h*(j+1)){
 arp[i][j]=!arp[i][j];
 break;
 }
 }
 }
 }
 }*/
void spalvinauzvesta()
{
  int i=mouseX/h-1;
  int j=mouseY/h-1;
  if (i>=0&&i<n&&j>=0&&j<n) {
    if (i==0&&j==0) {
          noStroke();
          rect((i+1)*h+6, (j+1)*h+6, h-11, h-11, 55, 0, 0, 0);
          stroke(0);
        } else if (i==0&&j==n-1) {
          noStroke();
          rect((i+1)*h+6, (j+1)*h+6, h-11, h-12, 0, 0, 0, 55);
          stroke(0);
        } else if (i==n-1&&j==0) {
          noStroke();
          rect((i+1)*h+6, (j+1)*h+6, h-12, h-11, 0, 55, 0, 0);
          stroke(0);
        } else if (i==n-1&&j==n-1) {
          noStroke();
          rect((i+1)*h+6, (j+1)*h+6, h+-12, h+-12, 0, 0, 55, 0);
          stroke(0);
        } else {
          noStroke();
          rect((i+1)*h+6, (j+1)*h+6, h-11, h-11);
          stroke(0);
        }
      };
}
boolean kurpele(boolean arp[][], boolean a[][]) {
  int i, j;
  i=mouseX/h-1;
  j=mouseY/h-1;
  if (i>=0&&i<n&&j>=0&&j<n) {
    //if(!a[i][j]) arp[i][j]=!arp[i][j];
    if (!a[i][j] && !arp[i][j]){
      arp[i][j]=true;
      return true;
    }else{
      return false;
    }
  }
  return false;
}
void setup() {
  stroke(0);
  strokeWeight(12.0);
  strokeCap(ROUND);
  size(700, 700);
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      arp[i][j]=false;
    }
  } 
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      arn[i][j]=false;
    }
  }
  laimejo=false;
}
boolean arlaimejo(boolean m[][]) {
  boolean ko=false; 
  /*for (int i=0;i<n;i++){
   if (ko) return ko;
   for (int j=1;j<n;j++){
   if (m[i][j]&&m[i][j-1])ko=true;
   }
   }
   */
  for (int i=0; i<n; i++) {
    if (ko) return ko;
    for (int j=0; j<n; j++) {
      if (!m[j][i])break;
      if (j==n-1) ko=true;
    }
  }
  for (int i=0; i<n; i++) {
    if (ko) return ko;
    for (int j=0; j<n; j++) {
      if (!m[i][j])break;
      if (j==n-1) ko=true;
    }
  }
  for (int i=0; i<n; i++) {
    if (ko) return ko;
    if (!m[i][i])break;
    if (i==n-1) ko=true;
  }
  for (int i=n-1; i>=0; i--) {
    if (ko) return ko;
    if (!m[i][i])break;
    if (i==0) ko=true;
  }
  /*if (!ko){
   for (int i=0;i<n;i++){
   if(!m[i][i]) ko=false;
   else ko=true;
   }
   if(!ko){
   for (int i=n-1;i>=0;i--){
   if(!m[i][i]) ko=false;
   else ko=true;
   }
   }*/
  //} 
  return ko;
}    

boolean kuris=false;

void mouseClicked() {
  boolean arKeista=false;
  if (kuris) arKeista=kurpele(arp, arn);
  else arKeista=kurpele(arn, arp);
  if(arKeista)
    kuris=!kuris;
  pasp=true;
}
void draw() {
  if (arlaimejo(arp)||arlaimejo(arn)) {
    background(255, 100, 255);
    text("sveikinu",50,50);
    if(pasp && laimejo)
      setup();
    else
      laimejo=true;
  } 
  else {
    background(255, 255, 255);
    grid(n, h, kr);
    spalvina();
    kryziukas();
    nuliukas();
    spalvinauzvesta();
  }
 
 pasp=false;
}