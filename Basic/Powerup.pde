import java.util.*;

public class Powerup{
  public final int FALLING_SPEED = 2;
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
  7 = invert
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
  //for testing
  public Powerup(int startX, int startY, int t){
     type = t;
     XPOS_MID = startX;
     XPOS_LEFT = startX - 7;
     XPOS_RIGHT = startX + 7;
     yposMID = startY;
     yposTOP = startY - 7;
     yposBOT = startY + 7;
  }
  //fix catch distance
  public boolean checkGot(int platformXPos, int platformYPos, int barWidth){
    if(yposBOT >= 19*height/20){
    if (XPOS_LEFT <= barLoc+barWidth && XPOS_RIGHT >= barLoc){
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
    }else if(type == 6){
      fill(0, 160, 160);
    }else if(type == 7){
      fill(190, 230, 255);
    }else{
      fill(255, 0, 255);
    }
    yposTOP += FALLING_SPEED;
    yposMID += FALLING_SPEED;
    yposBOT += FALLING_SPEED;
    triangle(XPOS_LEFT, yposMID, XPOS_MID, yposTOP, XPOS_RIGHT, yposMID);
    triangle(XPOS_LEFT, yposMID, XPOS_MID, yposBOT, XPOS_RIGHT, yposMID);
    textSize(10);
    fill(0);
    if(type == 0){
      text("multi", XPOS_MID-11, yposBOT+8);
    }else if(type == 1){
      text("gravity", XPOS_MID-14, yposBOT+8);
    }else if(type == 2){
      text("lasers", XPOS_MID-11, yposBOT+8);
    }else if(type == 3){
      text("gun", XPOS_MID-8, yposBOT+8);
    }else if(type == 4){
      text("wide", XPOS_MID-8, yposBOT+8);
    }else if(type == 5){
      text("life", XPOS_MID-8, yposBOT+8);
    }else if(type == 6){
      text("invert", XPOS_MID-11, yposBOT+8);
    }else if(type == 7){
      text("fun", XPOS_MID-8, yposBOT+8);
    }else{
      text("catch", XPOS_MID-11, yposBOT+8);
    }
  }
}
