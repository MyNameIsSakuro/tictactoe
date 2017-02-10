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