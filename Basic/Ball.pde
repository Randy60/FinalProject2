public class Ball{
  public int x, y, size, xdir, ydir;
  public Ball(int a, int b, int s, int xd, int yd){
   x = a;
   y = b;
   size = s;
   xdir = xd;
   ydir = yd;
  }
  public int size(){
    return size;
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  int g = 0;
  public void move(){
    x+=xdir;
    y+=ydir;
    if(g == 3){
      g = 0;
      ydir+=2;
    }else{
      g++;
    }
    if(x <= 0 || x >= width){
      xdir*=-1;
    }
    if(y <= 0 || y >= height){
       ydir*=-1;
    }
  }
}
