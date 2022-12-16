//This function draws the PLAY screen
   
void play() {
  //test stuff xxxxxxxxxxxxxxxxxxxxxxxxxxxx
  //println(bullets.size()); 
  
  
  
  drawMap();
  drawPlayInterface();
  animateThings();
  handleButtonClicks();
  
}
   void drawMap() {
  if (mapSelector == 0) {
  
  background(grass);
  strokeWeight(10);
  stroke(path);
  strokeWeight(50); 
  //0, 150, 800, 650
  pushMatrix();
  translate(0, 150);
  line(0, 150, 150, 150); 
  line(150, 150, 150, 600); 
  line(150, 600, 650, 600); 
  line(650, 600, 650, 400); 
  line(650, 400, 400, 400); 
  line(400, 400, 400, 200); 
  line(400, 200, 800 - 20, 200); //- ~25 to offset strokeweight
  popMatrix(); 
  
  } else if (mapSelector == 1) {
      background(dryGrass);
      strokeWeight(10);
      stroke(path);
      strokeWeight(50); 
      pushMatrix();
      translate(0, 150);
      
      popMatrix(); 
  } else if (mapSelector == 2) {
      background(snow);
      strokeWeight(10);
      stroke(path);
      strokeWeight(50); 
      pushMatrix();
      translate(0, 150);
      line (150, 0, 150, 550); 
      line (100, 550, 650, 550); 
      line (650, 550, 650, 100); 
      line(650, 100, 250, 100); 
      line(250, 100, 250, 300); 
      popMatrix(); 
  }
  
   }
   
  void drawPlayInterface() {
    
  //Build Menu Rectangle
  fill(buildMenu); 
  strokeWeight(0); 
  rect(1000, height/2, 400, 800); 
  
  //Top Rectangle
  fill(purple); 
  rect(400, 75, 800, 150);
  
  //Dividing Lines
  stroke(gold); 
  strokeWeight(25); 
  line(width-400, 0, width-400, height); 
  line(0, 150, width-400, 150); 
  
  //Test Nodes
  //nodes[0].show(); 
  //nodes[1].show();  
  //nodes[2].show(); 
  //nodes[3].show(); 
  //nodes[4].show(); 
  //nodes[5].show(); 
  
//Money n health
fill(black);
text("Gold: " + money, 1100, 700); 

//Text and Buttons
  fill(black);
  textSize(50); 
  text("Wave: " + waveNumber, 400, 50);
  nextWave.show();
  toBuild.show();
  
  

  }
  
  void animateThings() {
    int i = 0; 
    while (i < mobs.size()){
    Mob myMob = mobs.get(i);
    myMob.act(); 
    myMob.show(); 
    if (myMob.hp <= 0){
      mobs.remove(i); 
      money = money + 10; 
    } else 
   i++; 
    }
    
    
    i = 0;
    while (i < towers.size()){ 
      Tower myTower = towers.get(i); 
      myTower.show(); 
      if (mobs.size() != 0) { //shoot if mobs on map
      myTower.act();
      }
      i++;
    }
    
     i = 0;
    while (i < bullets.size()){
      Bullet myBullet = bullets.get(i); 
      myBullet.act();
      myBullet.show(); 
      
      if (myBullet.hp <= 0){
      bullets.remove(i); 
      } else 
   i++; 
 
    }
  }
  
 int waveNumber = 0;
 int counter; //number of mobs in the wave
 
void handleButtonClicks() {

  if (nextWave.clicked && mobs.size() == 0){ //if button press and no more mobs on map
  waveNumber++;
 counter = 0;

  }
  

  
   if (toBuild.clicked && mobs.size() == 0){
 mode = BUILD; 
  } else if (toBuild.clicked) {
    //fill(red); 
    errorMessage = 100; 
   
  }



  if (counter < waveNumber && waveNumber%5 == 0) { //every fifth wave
  
  
  mobs.add(new Mob(0 - counter*50, 150, 1, 0, 1, 30, 3));
  mobs.add(new Mob(0 - counter*150, 150, 1, 0, 2,60, 10));
  mobs.add(new Mob(0 - counter*200, 150, 1, 0, 3, 10, 1));
  counter++;
  
  } else if (counter < waveNumber && waveNumber%3 == 0) { //every third wave
    
  mobs.add(new Mob(0 - counter*50, 150, 1, 0, 1, 30, 3));
  mobs.add(new Mob(0 - counter*150, 150, 1, 0, 2, 60, 10));
  counter++;
  
  } else if (counter < waveNumber) {
    
   mobs.add(new Mob(0 - counter*50, 150, 1, 0, 1, 30, 3));
   counter++;
   
  }
  
  
  
  //Errors
    if (errorMessage > 0) {
    text("Error: Wave in Progress", 400, 200); 
    errorMessage--;
  }
    
    if (broke > 0) {
      text("Error: No money", 400, 200); 
      broke --;
    }
  
}

  

            
            
  
