import java.util.*;

public class Powerup{
  public int final FALLING_SPEED = 10;
  public int xpos, ypos;
  public int type;
  /**
  0 = multiball
  1 = gravity
  2 = lasers
  3 = cannons
  4 = wide
  5 = extra life
  6 = catch
  **/
  
  public Powerup(){
      type = Math.random(7);
  }
  public Powerup(int t){
      type = t;
  }
  
  public boolean checkGot(int platformXPos, int platformYPos){
    
  }
  
  public void fall(){
    ypos += FALLING_SPEED;
  }
}
