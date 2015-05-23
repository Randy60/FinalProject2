public class Ball{
  public int x, y, size, xdir, ydir;
  public boolean killMe = false;
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
  void pause(){
   isInPlay=!isInPlay; 
  }
  boolean isInPlay = true;
  public void move(int barAt, ArrayList<Brick> bricks){
    if(isInPlay){
        if(x <= 0 || x >= width){
          xdir*=-1;
        }
        if(y <= 0){
           ydir*=-1;
        }
        if(y+size >= height){
          if(x > barAt && x < barAt+width/8){
            xdir = (x-(barAt+width/16))/5+(int)(4*(Math.random()-0.50));
            ydir = 0-Math.abs(ydir);
           }else{
             if(y >= height){
            xdir = 0;
            y+=ydir;
            ydir = 0;
            isInPlay = false;
            killMe = true;
             }
           }
          }
          for(int i = 0; i < bricks.size(); i++){
            Brick it = bricks.get(i);
            if(y > it.ycor && y < it.ycor+it.ysize){
             if((x < it.xcor-size+width/16 && x > it.xcor-size)||
             (x > it.xcor+it.xsize+size-width/16 && x < it.xcor+it.xsize+size)){
               xdir*=-1;
               it.dropLevel();
             }
            }
            if(x > it.xcor && x < it.xcor+it.xsize){
             if((y < it.ycor && y > it.ycor-size)||
             (y > it.ycor+it.ysize && y < it.ycor+it.ysize+size)){
               ydir*=-1;
               it.dropLevel();
             }
            }
          }
          x+=xdir;
          y+=ydir;
        }
    }
}
