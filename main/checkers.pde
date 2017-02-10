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

boolean arlygiosios(){
  for (int i=0;i<n;i++){
    for (int j=0;j<n;j++){
      if(lentele[i][j]==0)return false;
    }
  }
  return true;
}