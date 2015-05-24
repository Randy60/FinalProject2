import java.util.*;
ArrayList<Ball> balls;
ArrayList<Brick> bricks;
Levels levs = new Levels();
boolean paused, levelUp;
int levelAt = 1;
boolean moveLeft, moveRight;
int barLoc = 400;
int timer = 599;
void setup(){
  size(800, 800);
  background(225);
  levelUp = true;
  balls = new ArrayList<Ball>();
  balls.add(new Ball(barLoc+width/16-5, height-15, 15, -5, -7));
  bricks = levs.getLevel(levelAt++);
}

void draw(){
  if(bricks.size() == 0 && levs.howManyLevels >= levelAt){
   bricks = levs.getLevel(levelAt++);
  levelUp = true; 
  }
  if(levelUp){
     barLoc = width/2-width/16;
        if(balls.size() > 1){
         for(int i = 1; i < balls.size(); i++){
          balls.remove(balls.size()-1);
         } 
        }
        balls.set(0, new Ball(width/2, height-25, 15, -5, -7));
   for(int i = 0; i < balls.size(); i++){
    balls.get(i).pause();
   }
   timer--;
   if(timer == 0){
     timer = 330;
     levelUp = false;
     for(int i = 0; i < balls.size(); i++){
       balls.get(i).x = balls.get(i).x+5;
    balls.get(i).unpause();
   }
   }
  }
  if(paused){
    fill(20, 100);
   rect(width/8, height/8, 3*width/4, height/4, height/32);
   textSize(width/14);
   fill(255);
   text("GAME PAUSED", width/4, height/4);
  }else{
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
  if(moveRight && barLoc+width/8 <= width && !levelUp){
     barLoc+=12;
  }
  if(moveLeft && barLoc >= 0 && !levelUp){
    barLoc-=12;
  }
  }
  if(levelUp){
   fill(20, 220);
   rect(width/8, height/8, 3*width/4, 3*height/4, height/32);
   textSize(width/20);
   fill(225);
   text("level " + (levelAt-1) + " begins in...", width/4, height/4);
   textSize(width/4);
   text(""+(timer/60), 13*width/32, 2*height/3);
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
  if(keyCode == 80){
     paused = !paused;
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
