int n=3, h=600/(n+1);
boolean kr=false;
color fillColor = color(50, 102, 100);

int lentele[][]=new int[n][n];
boolean pasp=false;
int laimejes;
int curPlayer = 0;

void setup() {
  strokeCap(ROUND);
  size(700, 700);
  restart();
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
  if(laimejes!=0){
    background(255, 100, 255);
    textSize(50);
  }else{
    background(255);
  }
  if (laimejes==1) {
    text("sveikinu xsą", 50, 50);
  }
  else if(laimejes==2){
    text("sveikinu nulį", 50, 50);
  }
  else if (laimejes==3){
    text("NEsveikinu", 50, 50);
  }
  else {
    grid();
    spalvinauzvesta();
    spalvina();
  }
}