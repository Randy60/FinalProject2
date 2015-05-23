import java.util.*;
ArrayList<Ball> balls;
ArrayList<Brick> bricks;
Levels levs = new Levels();
int levelAt = 1;
boolean moveLeft, moveRight;
int barLoc = 400;
void setup(){
  size(800, 800);
  background(225);
  balls = new ArrayList<Ball>();
  balls.add(new Ball(barLoc+width/16-5, height-15, 15, -5, -7));
  bricks = levs.getLevel(1);
  bricks.add(new Brick(9*width/20, 19*height/40, 2));
}

void draw(){
 fill(100);
 background(190, 230, 255);
  for(int i = 0; i < balls.size(); i++){
    Ball thisun = balls.get(i);
    if(thisun.killMe){
      balls.remove(i);
      i--;
    }
    ellipse(thisun.getX(), thisun.getY(), thisun.size(), thisun.size());
    thisun.move(barLoc, bricks);
  }
  for(int i = 0; i < bricks.size(); i++){
   Brick it = bricks.get(i);
   if(it.level == 0){
     bricks.remove(i);
     i--;
   }else{
   if(it.isSteel){
     fill(120);
   }else{
   fill(125+it.level*20, 50, 25);
   }
   rect(it.xcor, it.ycor, it.xsize, it.ysize, 10 - it.level); 
  }
  }
  fill(100);
  rect(barLoc, height-20, width/8, height/5, 5);
  if(moveRight && barLoc+width/8 <= width){
     barLoc+=10;
  }
  if(moveLeft && barLoc >= 0){
    barLoc-=10;
  }
}
void keyPressed(){
  if(key == CODED){
     if(keyCode == RIGHT){
       moveRight = true;
     }
      if(keyCode == LEFT){
       moveLeft = true;
      }  
  }
}
void keyReleased(){
 if(key == CODED){
    if(keyCode == RIGHT){
       moveRight = false; 
    }
    if(keyCode == LEFT){
       moveLeft = false;
    }
 }
}
