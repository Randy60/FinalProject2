import java.util.*;
ArrayList<Ball> balls;
void setup(){
  size(800, 800);
  background(225);
  balls = new ArrayList<Ball>();
  balls.add(new Ball(width/2, height/2, 20, 5, 7));
}
void draw(){
 fill(20);
 background(225, 1);
  for(int i = 0; i < balls.size(); i++){
    Ball thisun = balls.get(i);
    ellipse(thisun.getX(), thisun.getY(), thisun.size(), thisun.size());
    thisun.move();
  }
}
