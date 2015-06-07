 public class Fireables{
  public boolean isOn, laserOn, gunOn;
   public int shots = 0;
   public ArrayList<Float> shotsOut = new ArrayList<Float>();
   public void laser(){
     laserOn = true;
     gunOn = false;
     shots = 12;
   }
   public void gun(){
     laserOn = false;
     gunOn = true;
     shots = 3;
   }
   public void keepUp(){
     if(laserOn){
        fill(255, 100, 80);
        rect(barLoc+15, height-20, 6, height/5);
        rect(barLoc+barWidth-25, height-20, 6, height/5);
      }
      if(gunOn){
        fill(200, 200, 80);
        rect(barLoc+barWidth/2-10, height-23, 20, height/5, 2);
      }
    for(int i = 0; i < shotsOut.size(); i+=3){
     int k = i+2;
      shotsOut.set(k, shotsOut.get(k)-5);
      if(shotsOut.get(k) < 0){
        shotsOut.remove(i);
         shotsOut.remove(i);
         shotsOut.remove(i);
         i-=3;
      }else{
      fill(255, 127*shotsOut.get(i), 0);
     rect(shotsOut.get(i+1), shotsOut.get(i+2), shotsOut.get(i)*4, 12, 1);
     for(int j = 0; j < bricks.size(); j++){
      if(shotsOut.get(i+2) < bricks.get(j).ycor+width/20 && shotsOut.get(i+1) >= bricks.get(j).xcor-4 && shotsOut.get(i+1) <= bricks.get(j).xcor+width/10){
          if(shotsOut.get(i) <= 1){
          if(!bricks.get(j).isSteel){
          bricks.get(j).level-= 0.5;
           if(bricks.get(j).level == 0){
            bricks.remove(j);
            j--;
           }
          } 
         }else{
          bricks.remove(j);
          j--;
         }
         shotsOut.remove(i);
         shotsOut.remove(i);
         shotsOut.remove(i);
         i-=3;
         j = bricks.size();
      }
     }
      }
    }
   }
    public void shoot(){
        if(laserOn){
          shotsOut.add(0.8);
          shotsOut.add(barLoc+15.0);
          shotsOut.add((float)height);
          shotsOut.add(0.8);
          shotsOut.add(barLoc+barWidth-25.0);
          shotsOut.add((float)height);
          shots-=2;
        }
        if(gunOn){
          shotsOut.add(3.0);
          shotsOut.add((float)(barLoc+barWidth/2-10));
          shotsOut.add((float)height);
          shots-=1;
        }
      if(shots == 0){
        laserOn = false;
        gunOn = false;
      }    
    }
    
 }
