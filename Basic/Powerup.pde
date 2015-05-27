import java.util.*;

public class Powerup{
  public final int FALLING_SPEED = 10;
  public int xpos, ypos;
  public int type;
  public boolean caught;
  public Random r = new Random();
  
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
      type = -1;
      caught = true;
  }
  public Powerup(int t){
      type = t;
      caught = false;
  }
  public Powerup(int startX, int startY){
     type = r.nextInt(7);
     caught = false;
     xpos = startX;
     ypos = startY;
  }
  
  public void switchCaught(){
   caught = !caught;
  }
  
  public boolean checkGot(int platformXPos, int platformYPos){
    if (xpos <= platformXPos + width/16 && xpos >= platformXPos - width/16
        && ypos >= platformYPos - height/10 && ypos <= platformYPos + height/10){
          switchCaught();
          return true;
        }
    return false;
  }
  
  public void fall(){
    if (!caught){
      System.out.println("lml");
    if(type == 0){
      fill(160, 160, 160);
    }else if(type == 1){
      fill(0, 0, 0);
    }else if(type == 2){
      fill(255, 0, 0);
    }else if(type == 3){
      fill(0, 0, 255);
    }else if(type == 4){
      fill(255, 128, 0);
    }else if(type == 5){
      fill(0, 255, 0);
    }else{
      fill(255, 0, 255);
    }
    ypos += FALLING_SPEED;
    rect(xpos, ypos, width / 16, height / 10, 5);
  }
  }
}
