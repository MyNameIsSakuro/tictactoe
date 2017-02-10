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
        langelioFonas(i,j);
        if(lentele[i][j]==1)
          kryziukas(i,j);
        else if(lentele[i][j]==2)
          nuliukas(i,j);
      }
    }
  }
}