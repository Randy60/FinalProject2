public class Levels{
  public int howManyLevels = 3;
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
    return temp;
  }  
}
//temp.add(new Brick());
