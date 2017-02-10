void restart(){
  for (int i=0; i<n; i++) {
    for (int j=0; j<n; j++) {
      lentele[i][j]=0;
    }
  }
  laimejes=0;
  curPlayer = 0;
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
    if (arlygiosios()) laimejes=3;
    curPlayer%=2;
  }
}