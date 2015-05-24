public class Levels{
  public int howManyLevels = 4;
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
      for(int k = 0; k < 10; k++){
      temp.add(new Brick(k*width/10, 0, (k%2)+1));
      temp.add(new Brick(k*width/10, height/2-height/2- , 2)); 
      }
      for(int k = 1; k < 5; k++){
       temp.add(new Brick(k*width/10, k*height/20, 1)); 
       temp.add(new Brick(width-(k+1)*width/10, k*height/20, 1));
       temp.add(new Brick(k*width/10, height/2-(k+1)*height/20, 1));
       temp.add(new Brick(width-(k+1)*width/10, width/2-(k+1)*height/20, 1));  
      }
    }
    return temp;
  }  
}
//temp.add(new Brick());
