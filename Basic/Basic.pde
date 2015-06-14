import java.util.*;
ArrayList<Ball> balls;
ArrayList<Brick> bricks;
Levels levs = new Levels();
boolean paused, levelUp, spacePressed, JPressed;
int levelAt = 1;
boolean moveLeft, moveRight;
int barLoc = 400;
int wideTimer = 0;
int timer = 239;
int lives = 5;
int catchLine;
int invertTime = 0;
int lineReverse = 1; 
int tripTimer = 0;
boolean catchCheck = false;
ArrayList<Powerup> powerups = new ArrayList<Powerup>();
Random r = new Random();
int barWidth;
Fireables shooter = new Fireables();

void setup(){
  size(800, 800);
  background(120);
  levelUp = true;
  balls = new ArrayList<Ball>();
  balls.add(new Ball(barLoc+width/16, height-25, 15, -5, -7));
  bricks = levs.getLevel(levelAt++);
  barWidth = width/8;
}
boolean noBricks(){
  for(int i = 0; i < bricks.size(); i++){
   if(!bricks.get(i).isSteel){
    return false;
  }
  }
  return true;
}
void draw(){
  if(noBricks() && levs.howManyLevels >= levelAt){
   bricks = levs.getLevel(levelAt++);
  levelUp = true;
  }
  if(levelUp){
    wideTimer = 0;
    shooter.shotsOut = new ArrayList<Float>();
    shooter.laserOn = false;
    shooter.gunOn = false;
    tripTimer = 0;
    invertTime = 0;
     barLoc = width/2-width/16;
        if(balls.size() > 1){
         for(int i = 1; i < balls.size(); i++){
          balls.remove(balls.size()-1);
         } 
        }
        balls.set(0, new Ball(barLoc+width/16, height-25, 15, -5, -7));
        balls.get(0).xdir+=.01;
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
    if(tripTimer <= 0){
     background(190, 230, 255, 5);
    }else{
      tripTimer--;
     background((1090-tripTimer)%255,(1130-3*tripTimer)%255,(tripTimer*tripTimer)%255, 5);
    }
 if(wideTimer == 0){
   barWidth = width/8;
 }else{
   wideTimer--;
 }
  for(int i = 0; i < balls.size(); i++){
    Ball thisun = balls.get(i);
    if(thisun.killMe){
      balls.remove(i);
      i--;
    }
    thisun.move(barLoc, barWidth, bricks);
    fill(100);
    ellipse(thisun.getX()-3*(thisun.getX()/(width+0.0))+1.5, thisun.getY()-3*(thisun.getY()/(width+0.0))+1.5, thisun.size(), thisun.size());
    fill(120);
    ellipse(thisun.getX(), thisun.getY(), thisun.size(), thisun.size());
  }
  if(invertTime > 0){
    invertTime--;
  }
  for(int i = 0; i < bricks.size(); i++){
   Brick it = bricks.get(i);
   if(it.level <= 0.50){
     bricks.remove(i);
     i--;
     //making powerups
     if(Math.random() >= 0.20){
         powerups.add(new Powerup(it.xcor, it.ycor, r.nextInt(9)));
     }
   }
  }
  for(int m = 20; m > 0; m--){
  for(int i = 0; i < bricks.size(); i++){
    Brick it = bricks.get(i);
   if(it.isSteel){
     fill(120);
   }else{
   fill(105+(int)(it.level)*20-10, 40, 25);
   }
   rect(it.xcor-m*(it.xcor/(width-40.0))+1+(m/2.0), it.ycor-m/5.0, it.xsize-m/6.0, it.ysize, 10 - (int)(it.level)); 
  }
  }
  for(int i = 0; i < bricks.size(); i++){
    Brick it = bricks.get(i);
   if(it.isSteel){
     fill(120);
   }else{
   fill(125+(int)(it.level)*20, 50, 25);
   }
   rect(it.xcor, it.ycor, it.xsize, it.ysize, 10 - (int)(it.level));
  }
  if(tripTimer > 0){
    fill(100+(tripTimer%156), 100+((4*tripTimer)%156), 100+((5*tripTimer)%156), 100+tripTimer%100);
    ellipse(width/4, height/4, 3*Math.abs(tripTimer%200-100), 3*Math.abs(tripTimer%200-100));
    ellipse(3*width/4, height/4, 3*Math.abs(tripTimer%200-100), 3*Math.abs(tripTimer%200-100));
    ellipse(width/4, 3*height/4, 3*Math.abs(tripTimer%200-100), 3*Math.abs(tripTimer%200-100));
    ellipse(3*width/4, 3*height/4, 3*Math.abs(tripTimer%200-100), 3*Math.abs(tripTimer%200-100));
    ellipse(width/2, height/2, 3*Math.abs((tripTimer-100)%200-100), 3*Math.abs((tripTimer-100)%200-100));
  }
  //powerup methods
  for(int i = 0; i < powerups.size(); i ++){
      powerups.get(i).fall();
       if(powerups.get(i).checkGot(barLoc, height - 20, barWidth)){
          if(powerups.get(i).type == 0){
            balls.add(new Ball((int)balls.get(0).getX()-10, (int)balls.get(0).getY()-15, 15, r.nextInt(10) - 5, -7));
            balls.add(new Ball((int)balls.get(0).getX()-5, (int)balls.get(0).getY()-15, 15, r.nextInt(30) - 15, 7));
            balls.add(new Ball((int)balls.get(0).getX(), (int)balls.get(0).getY()-15, 15, r.nextInt(20) - 10, -7));
            balls.add(new Ball((int)balls.get(0).getX()+5, (int)balls.get(0).getY()-15, 15, r.nextInt(15) - 7, -7));
            balls.add(new Ball((int)balls.get(0).getX()+10, (int)balls.get(0).getY()-15, 15, r.nextInt(25) - 12, -7));
            for(int j = 1; j < balls.size(); j++){
             balls.get(j).ydir+=1; 
            }
          }else if(powerups.get(i).type == 1){
            for(int j = 0; j < balls.size(); j ++){
              balls.get(j).gravity = true;
            }
          }else if(powerups.get(i).type == 2){
              //lasers
              shooter.laser();
              barWidth = width/8;
          }else if(powerups.get(i).type == 3){
              //cannons
              barWidth = width/8;
              shooter.gun();
          }else if(powerups.get(i).type == 4){
              barWidth = width/4;
              barLoc-=width/16;
              wideTimer = 900;
              shooter.gunOn = false;
              shooter.laserOn = false;    
          }else if(powerups.get(i).type == 5){
            lives++;  
          }else if(powerups.get(i).type == 6){
            invertTime = 600;
          }else if(powerups.get(i).type == 7){
            tripTimer = 900;
          }else{
              catchLine = 0;
              for(int k = 0; k < balls.size(); k++){
                balls.get(k).catchable = true;
              }
          }
        powerups.remove(i);
       }else if(powerups.get(i).yposTOP > height){
         powerups.remove(i); 
  }
  }
  //catch method
  if(spacePressed){
    for(int i = 0; i < balls.size(); i++){
      if(balls.get(i).catchable && balls.get(i).caught){
       balls.get(i).isInPlay = true;
       balls.get(i).xdir = catchLine; 
      }
    }
  }
  fill(0, 160, 60);
  rect(barLoc-4*(barLoc/(width-40.0))+1, height-22, barWidth, 19, 5);
  fill(0, 200, 80);
  rect(barLoc-1, height-20, barWidth, 19, 5);
  shooter.keepUp();
  catchCheck = false;
  for(Ball ball: balls){
    if(ball.catchable && !ball.isInPlay){
     catchCheck = true;
     break; 
    }
  }
  }
 if(invertTime == 0){ 
  if(moveRight && barLoc+barWidth <= width && !levelUp && !catchCheck){
      barLoc+=12;
     }
  if(moveLeft && barLoc >= 0 && !levelUp && !catchCheck){
    barLoc-=12;
  }
  }else{
    if(moveLeft && barLoc+barWidth <= width && !levelUp && !catchCheck){
      barLoc+=12;
     }
  if(moveRight && barLoc >= 0 && !levelUp && !catchCheck){
    barLoc-=12;
  }
  }
  for(Ball ball : balls){
  if(ball.catchable && !ball.isInPlay){
    if(moveLeft && catchLine > -45){
      catchLine -= 5;
    }else if(moveRight && catchLine < 50){
      catchLine += 5;
    }
    line(ball.x, ball.y, ball.x + catchLine, ball.y - 20);
  }
  }
  if(levelUp){
   powerups = new ArrayList<Powerup>();
   for(int i = 0; i < balls.size(); i++){
      balls.get(i).catchable = false;
   }
   barWidth = width/8;
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
    text("press space to continue", width/4-25, height/4); 
   }
  }
  if(balls.size() == 0){
    shooter.shotsOut = new ArrayList<Float>();
    shooter.laserOn = false;
    shooter.gunOn = false;
    tripTimer = 0;
    invertTime = 0;
   fill(20, 220);
   rect(width/8, height/8, 3*width/4, height/4, height/32);
   textSize(width/15);
   fill(255);
        powerups = new ArrayList<Powerup>();
   if(lives > 1){
   text("YOU LOST", width/3+12, height/4-20);
   }else{
    text("GAME OVER", width/3+4, height/4-20);
   }
   textSize(width/30);
   text("press space to try again", width/4+55, height/4+10);
   if(spacePressed){
     balls.add(new Ball(1, 1, 1, 1, 1));
     if(lives > 1){
     levelAt--;
     lives--;
     }else{
       levelAt = 1;
       lives = 5;
     }
     levelUp = true;
     for(int i = 0; i < bricks.size(); i++){
      bricks.remove(bricks.size()-1); 
     }
     bricks = levs.getLevel(levelAt++);
   }
  }
 fill(0);
 textSize(10);
 text("lives: "+lives+"\n"+"Press P to pause"+"\n"+"move with LEFT and RIGHT arrow"+"\n"+"shoot with SPACE", 0, 15);
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
    if(!paused){
     shooter.shoot(); 
    }
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
 if(keyCode == 32){
   if(!levelUp){
  spacePressed = false;
   } 
 }
}
