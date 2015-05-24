import java.util.*;
ArrayList<Ball> balls;
ArrayList<Brick> bricks;
Levels levs = new Levels();
boolean paused, levelUp, spacePressed;
int levelAt = 1;
boolean moveLeft, moveRight;
int barLoc = 400;
int timer = 239;
int lives = 9;
Random r = new Random();
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
        balls.set(0, new Ball(width/2, height-25, 15, r.nextInt(14)-7, -7));
   for(int i = 0; i < balls.size(); i++){
    balls.get(i).pause();
   }
   if(spacePressed){
   timer--;
   if(timer == 0){
     timer = 239;
     levelUp = false;
     spacePressed = false;
     for(int i = 0; i < balls.size(); i++){
       balls.get(i).x = balls.get(i).x+(r.nextInt(30)-15);
    balls.get(i).unpause();
   }
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
 background(190, 230, 255, 5);
 fill(0);
 textSize(10);
 text("lives: "+lives+"\n"+"Press 'P' to pause"+"\n"+"move with left and right arrow", 0, 15);
 fill(120);
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
  fill(0, 200, 80);
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
   if(spacePressed){
   rect(width/8, height/8, 3*width/4, 3*height/4, height/32);
   textSize(width/20);
   fill(255);
   text("level " + (levelAt-1) + " begins in...", width/4, height/4);
   textSize(width/4);
   text(""+(timer/60), 13*width/32, 2*height/3);
   }else{
   rect(width/8, height/8, 3*width/4, height/4, height/32);
   textSize(width/20);
   fill(255);
    text("press space to continue", width/4-20, height/4); 
   }
  }
  if(balls.size() == 0){
   fill(20, 220);
   rect(width/8, height/8, 3*width/4, height/4, height/32);
   textSize(width/15);
   fill(255);
   text("YOU LOST!", width/3+12, height/4-20);
   textSize(width/30);
   text("press space to try again", width/4+55, height/4+10);
   if(spacePressed){
     balls.add(new Ball(1, 1, 1, 1, 1));
     lives--;
     levelAt--;
     levelUp = true;
     for(int i = 0; i < bricks.size(); i++){
      bricks.remove(bricks.size()-1); 
     }
     bricks = levs.getLevel(levelAt++);
   }
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
  if(keyCode == 32){
       spacePressed = true; 
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
