class Textbox{
  private int h,w,x,y,kiek;
  private boolean isActive=false;
  private String text="";
  private boolean isNumber;
  color active=color(115);
  Textbox(int x, int y, int h, int w,boolean isNumber, int kiek){
    this.h=h;
    this.x=x;
    this.y=y;
    this.w=w;
    this.isNumber=isNumber;
    this.kiek=kiek;
  }
  Textbox(int x, int y, int h, int w,int kiek){
    this(x,y,h,w,false,kiek);
  }
  String getText(){
   return text; 
  }
  int getNumber(){
    if (isNumber){
      if(text.length()==0) return 0;
      return Integer.parseInt(text); 
    }
    else throw new IllegalStateException("Negalima konvertuoti teksto į numerį.");
  }
  void frame(){
    if (isActive) fill(active);
    else noFill();
    rect(x,y,h,w); 
    fill(0);
    textSize(15);
    textAlign(CENTER,CENTER);
    text(text, x, y,h,w);
  }
  void click(int xm, int ym){
    isActive=xm>=x&&xm<=x+h&&ym>=y&&ym<=y+w;
  }   
  void toText(int keycode, char key){
      if (isActive){
            if (keycode==BACKSPACE){
               if(text.length()>0)text=text.substring(0,text.length()-1);
            }
          else if(text.length()<kiek){
            if (!isNumber&&(('A'<=key && key<='Z') ||('a'<=key && key<='z') )){
                text+=key;
            }
            else if(isNumber&&('0'<=key && key<='9')){
                if (text.length()>0||(key!='0'&&text.length()==0))
                text+=key;
              
            }
          }
  }
}
}