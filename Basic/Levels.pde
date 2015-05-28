public class Levels{
  public int howManyLevels = 8;
  public ArrayList<Brick> getLevel(int i){
    ArrayList<Brick> temp = new ArrayList<Brick>();
    if(i == 1){
    temp.add(new Brick(9*width/20, 19*height/40, 1));
    temp.add(new Brick(9*width/20, 17*height/40, 1));
    temp.add(new Brick(7*width/20, 18*height/40, 1));
    temp.add(new Brick(11*width/20, 18*height/40, 1));
    }
    if(i == 2){
     temp.add(new Brick(width/3-width/20, height/3-height/40, 1));
     temp.add(new Brick(2*width/3-width/20, height/3-height/40, 1));
     temp.add(new Brick(width/3-width/20, height/2-height/40, 1));
     temp.add(new Brick(2*width/3-width/20, height/2-height/40, 1));
    }
    if(i == 3){
     temp.add(new Brick (0, height / 3, 1)); 
     temp.add(new Brick (width / 10, height / 3, 1)); 
     temp.add(new Brick (2* width / 10, height / 3, 1));
     temp.add(new Brick (3* width / 10, height / 3, 1));
     temp.add(new Brick (4* width / 10, height / 3, 1));
     temp.add(new Brick (5* width / 10, height / 3, 1));
     temp.add(new Brick (6* width / 10, height / 3, 1));
     temp.add(new Brick (7* width / 10, height / 3, 1)); 
     temp.add(new Brick (8* width / 10, height / 3, 1));
     temp.add(new Brick (9* width / 10, height / 3, 1));
    } 
    if(i == 4){
     for(int k = 0; k < 50; k++){
      temp.add(new Brick((k%10)*width/10, (k/10)*height/20, k%3-1));
     } 
    }
    if(i == 5){
      for(int n = 0; n < 2; n++){
      for(int k = 0; k < 3; k++){
       temp.add(new Brick(width/3-width/5, (k+4)*height/20, (k%3)+1));
       temp.add(new Brick(2*width/3, (k+4)*height/20, (k%3)+1));
        temp.add(new Brick(width/3-width/5, (k+10)*height/20, (k%3)+1));
        temp.add(new Brick(2*width/3, (k+10)*height/20, (k%3)+1));  
      }
      }
      for(int k = temp.size()/2; k < temp.size(); k++){
        temp.get(k).xcor = temp.get(k).xcor+width/10;
      }
    }
    if(i == 6){
        temp.add(new Brick(9*width/20, 19*height/40, 2));
        temp.add(new Brick(9*width/20, 17*height/40, 1));
        temp.add(new Brick(7*width/20, 18*height/40, 2));
        temp.add(new Brick(11*width/20, 18*height/40, 2));
        temp.add(new Brick(13*width/20, 17*height/40, 2));
        temp.add(new Brick(5*width/20, 17*height/40, 2));
        temp.add(new Brick(7*width/20, 16*height/40, 1));
        temp.add(new Brick(11*width/20, 16*height/40, 1));
        temp.add(new Brick(13*width/20, 15*height/40, 2));
        temp.add(new Brick(5*width/20, 15*height/40, 2));
        temp.add(new Brick(7*width/20, 14*height/40, 2));
        temp.add(new Brick(11*width/20, 14*height/40, 2));
        temp.add(new Brick(9*width/20, 13*height/40, 2));
        temp.add(new Brick(9*width/20, 15*height/40, 1));
    }
    if(i == 7){
      for(int k = 0; k < 10; k++){
      temp.add(new Brick(k*width/10, 0, (k%2)+1));
      temp.add(new Brick(k*width/10, 9*height/20, 2)); 
      }
      for(int k = 1; k < 5; k++){
       temp.add(new Brick(k*width/10, k*height/20, 1)); 
       temp.add(new Brick(width-(k+1)*width/10, k*height/20, 1));
       temp.add(new Brick(k*width/10, height/2-(k+1)*height/20, 1));
       temp.add(new Brick(width-(k+1)*width/10, width/2-(k+1)*height/20, 1));  
      }
    }
    if(i == 8){
     for(int k = 0; k < 6; k++){
       temp.add(new Brick((k+2)*width/10, 3*height/20, 3));
       temp.add(new Brick((k+2)*width/10, 8*height/20, true));
     }
     for(int k = 4; k < 8; k++){
      temp.add(new Brick(2*width/10, k*height/20, 3));
      temp.add(new Brick(7*width/10, k*height/20, 3));
      temp.add(new Brick(3*width/10, k*height/20, 1));
      temp.add(new Brick(4*width/10, k*height/20, 1));
      temp.add(new Brick(5*width/10, k*height/20, 1));
      temp.add(new Brick(6*width/10, k*height/20, 1));
     }
     
    }
    return temp;
  }  
}
//temp.add(new Brick());
