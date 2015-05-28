import java.util.*;

public class Powerup{
  public final int FALLING_SPEED = 5;
  public final int XPOS_LEFT, XPOS_RIGHT, XPOS_MID;
  public int yposTOP, yposMID, yposBOT;
  public int type;
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

//text for different types
  public Powerup(int startX, int startY){
     type = r.nextInt(7);
     XPOS_MID = startX;
     XPOS_LEFT = startX - 7;
     XPOS_RIGHT = startX + 7;
     yposMID = startY;
     yposTOP = startY - 7;
     yposBOT = startY + 7;
  }
  //fix catch distance
  public boolean checkGot(int platformXPos, int platformYPos){
    if(yposMID > 750){
    if (XPOS_LEFT <= platformXPos + width/16 + 14 && XPOS_RIGHT >= platformXPos - width/16 - 14
        && yposBOT >= platformYPos - height/10 - 14 && yposTOP <= platformYPos + height/10 + 14){
          return true;
        }
    }
    return false;
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
    yposTOP += FALLING_SPEED;
    yposMID += FALLING_SPEED;
    yposBOT += FALLING_SPEED;
    triangle(XPOS_LEFT, yposMID, XPOS_MID, yposTOP, XPOS_RIGHT, yposMID);
    triangle(XPOS_LEFT, yposMID, XPOS_MID, yposBOT, XPOS_RIGHT, yposMID);
  }
}
