import java.util.*;

public class Powerup{
  public int final FALLING_SPEED = 10;
  public int final SIZE  =
  public int xpos, ypos;
  public int type;
  public boolean caught;
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
      caught = false;
  }
  public Powerup(int t){
      type = t;
      caught = false;
  }
  public Powerup(int startX, int startY){
     type = Math.random(7);
     caught = false;
     xpos = startX;
     ypos = startY; 
  }
  
  public boolean checkGot(int platformXPos, int platformYPos){
    if (xpos <= platformXPos + width/16 && xpos >= platformXPos - width/16
        && ypos >= platformYPos - height/10 && ypos <= platformYPos + height/10){
           caught = true;
        }
    return caught;
  }
  
  public void fall(){
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
    rect(xpos, ypos, width \ 16, height \ 10, 5);
  }
}
