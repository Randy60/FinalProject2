public class Levels{
  public int howManyLevels = 1;
  public ArrayList<Brick> getLevel(int i){
    ArrayList<Brick> temp = new ArrayList<Brick>();
    if(i == 1){
    temp.add(new Brick(9*width/20, 19*height/40, 1));
    temp.add(new Brick(9*width/20, 17*height/40, 1));
    temp.add(new Brick(7*width/20, 18*height/40, 1));
    temp.add(new Brick(11*width/20, 18*height/40, 1));
    }
    if(i == 2){
     temp.add(new Brick(width/3, height/3, 1));
     temp.add(new Brick(2*width/3, height/3, 1));
     temp.add(new Brick(width/3, 2*height/3, 1));
     temp.add(new Brick(2*width/3, 2*height/3, 1));
    }
    return temp;
  }  
}
//temp.add(new Brick());
