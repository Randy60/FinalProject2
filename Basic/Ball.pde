public class Ball{
  public float x, y, xdir, ydir, ydirpermanent;
  public int size;
  public boolean killMe = false;
  public boolean gravity = false; // checks for gravity powerup
  boolean catchable = false; // checks for catch powerup
  boolean caught = false; // checks if ball has been released
  public Ball(int a, int b, int s, int xd, int yd){
   x = a;
   y = b;
   size = s;
   xdir = xd;
   ydir = yd;
   ydirpermanent = yd;
  }
  public int size(){
    return size;
  }
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  void unpause(){
   isInPlay = true; 
  }
  void pause(){
   isInPlay=false; 
  }
  int gcount = 600;
  
  int howManySub0 = 0;
  boolean isInPlay = true;
  public void move(int barAt, int barWidth, ArrayList<Brick> bricks){
    if(isInPlay){
        if(gravity){
          if(gcount%3== 0){
         ydir+=.5;
          }
          gcount--;
         if(gcount == 0){
          gravity = false;
          gcount = 600;
          ydir = -1*ydirpermanent*(int)(ydir/Math.abs(ydir));
         } 
        }
        if(x < size || x > width-size){
          howManySub0++;
        }else{
          howManySub0 = 0;
        }
        if(howManySub0 > 5){
         xdir = Math.abs(xdir);
        if(x > width-size){
         xdir*=-1;
        } 
        x+=2*xdir;
        }
        if(x <= 0 || x >= width){
          xdir*=-1;
        }
        if(y <= 0 && ydir < 0){
           ydir*=-1;
        }
        if(y > 750){
        if(y+size >= height){
           if(x > barAt && x < barAt+barWidth && !catchable){
            xdir = (float)((x-(barAt+barWidth/2))/5);
            ydir = 0-Math.abs(ydir);
           }else if(x > barAt && x < barAt+barWidth && catchable){
              isInPlay = false;
              caught = true;
              ydir = 0-Math.abs(ydir);
              y = 780;
              catchTimer--;
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
        }else{
          for(int i = 0; i < bricks.size(); i++){
            Brick it = bricks.get(i);
           
            if(y > it.ycor && y < it.ycor+it.ysize){
             if((x < it.xcor-size+width/16 && x > it.xcor-size && xdir > 0)||
             (x > it.xcor+it.xsize+size-width/16 && x < it.xcor+it.xsize+size && xdir < 0)){
               xdir*=-1;
               it.dropLevel();
             }
            }
            if(x > it.xcor && x < it.xcor+it.xsize){
             if((y < it.ycor && y > it.ycor-size && ydir > 0)||
             (y > it.ycor+it.ysize && y < it.ycor+it.ysize+size && ydir < 0)){
               ydir*=-1;
               it.dropLevel();
             }
            }
          }
        }
          x+=xdir;
          y+=ydir;
        }
    }
}
