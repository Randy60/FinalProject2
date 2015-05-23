public class Brick{
  public int xcor, ycor, xsize, ysize, level;
  boolean isSteel;
  public Brick(int x, int y, boolean n){
    xcor = x;
    ycor = y;
    xsize =  width/10;
    ysize = height/20;
   isSteel = true; 
   level = 10;
  }
  public Brick(int x, int y, int l){
     xcor = x;
    ycor = y;
    xsize =  width/10;
    ysize = height/20;
    level = l;
  }
  public void dropLevel(){
   if(!isSteel){
     level-=1; 
   }
  }
}
