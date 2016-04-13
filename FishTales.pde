//Fish tales
//By Jeremy Ben-Meir
//Made in Processing 3.0.1
//"fullscreen();" can be commented out and replaced with desired size
//MAKE FULLSCREEN FOR BEST EXPERIENCE
//Click on a fish to see statistics

ArrayList<Fish> fishList = new ArrayList<Fish>(); //Makes ArrayLists to hold fish, bubbles, and pellets
ArrayList<Pellet> pelletList = new ArrayList<Pellet>();
ArrayList<Whale> whaleList = new ArrayList<Whale>();
ArrayList<Goldfish> goldfishList = new ArrayList<Goldfish>();
ArrayList<Piranha> piranhaList = new ArrayList<Piranha>();
ArrayList<Toroidalfin> toroidalfinList = new ArrayList<Toroidalfin>();
ArrayList<Bubble> bubbleList = new ArrayList<Bubble>();

//Declares important variables
int buttons =0; //Speifies specific button
boolean pause=true;
int SpecialFish=-1;
int frames;
float ammonia;
int deadFish;
int babyCount=0;
void setup() {
  //size(700, 600); //SET TO DESIRED SIZE, IF DONE: COMMENT OUT "fullscreen();" BELOW
  fullScreen(); //Makes window fullscreen
  noStroke();
  frameRate(3500);//raises framerate
}

void draw() {
  frames++;
  if (ammonia <150 && pause) {//Sets ammonia levels
    for (Fish fish : fishList) { 
      if (!fish.live) {
        deadFish++;
      }
    }
    ammonia+= (float((fishList.size()-deadFish))/1000);//Adds to ammonia
    deadFish=0;
  }
  background(0, 200, 230);//Sets up interface
  noStroke();
  fill(#3498db);
  rect(width-300, 0, width, height);
  fill(69, 233, 41);
  textAlign(CENTER, CENTER);


  if (pause) {//Updates every class (move and show)
    for (Bubble bubble : bubbleList) {
      if (bubble.deSize==1) {
        bubble.update();
      }
    }
    for (Pellet pellet : pelletList) {
      pellet.update();
    }
    for (Fish fish : fishList) {
      fish.update();
      if (!fish.live && fish.opacity>100) {
        fish.opacity-=1.5;
      }
    }
    for (Bubble bubble : bubbleList) {
      if (bubble.deSize==0) {
        bubble.update();
      }
    }
  } else {//Just shows every class while paused, doesn't move
    for (Bubble bubble : bubbleList) {
      if (bubble.deSize==1) {
        bubble.show();
      }
    }
    for (Fish fish : fishList) {
      fish.show();
    }
    for (Pellet pellet : pelletList) {
      pellet.show();
    }
    for (Bubble bubble : bubbleList) {
      if (bubble.deSize==0) {
        bubble.show();
      }
    }
  }


  for (Fish fish1 : fishList) { //Tests for collision between two fish
    for (Fish fish2 : fishList) {
      if ((!(fish1.fType==0&&fish2.fType==1)&&!(fish1.fType==1&&fish2.fType==0))) {
        if (dist(fish1.fPosition.x, fish1.fPosition.y, fish2.fPosition.x, fish2.fPosition.y)<=(fish1.weight+fish2.weight) && dist(fish1.fPosition.x, fish1.fPosition.y, fish2.fPosition.x, fish2.fPosition.y)!=0 && fish1.live&&fish2.live) {

          fish1.fVelocity.set(fish1.fPosition.x-fish2.fPosition.x, fish1.fPosition.y-fish2.fPosition.y).setMag(2); //Changes direction of fish
          fish2.fVelocity.set(fish2.fPosition.x-fish1.fPosition.x, fish2.fPosition.y-fish1.fPosition.y).setMag(2);
          if (fish1.fType==fish2.fType && ((fish1.gender&&!fish2.gender)||(!fish1.gender&&fish2.gender)) && fish1.age>1000 && fish2.age>5000) { //baby creation
            babyCount++;
          }
        }
      }
    }
  }

  
  for (int baby=0; baby<babyCount; baby++) { //How many babies to add
    fishList.add(new Goldfish());
  }
  babyCount=0; //Reset

  if (frames%40==0 && pause) { //Affd a knew small bubble at the bottom of the screem
    bubbleList.add(new Bubble(0, (random(0, width-300)), random(height+3, height+10)));
  }


  //BUTTONS, TESTS WHICH BUTTON IS CLICKED
  if (buttons==1) {
    for (int p=0; p<1; p++) {//Adds new goldfish
      fishList.add(new Goldfish());
      goldfishList.add(new Goldfish());
    }
  }
  if (buttons==2) {
    for (int i=0; i <1; i++) {
      fishList.add(new Whale());//Adds new whale
      whaleList.add(new Whale());
    }
  }
  if (buttons==3) {
    for (int i=0; i <8; i++) {
      pelletList.add(new Food());//Adds new food pellets
    }
  }
  if (buttons==4) {
    for (int i=0; i <8; i++) {
      pelletList.add(new Speed());//Adds new speed pellets
    }
  }
  if (buttons==5) { //Clean take
    for (int p=0; p<fishList.size(); p++) {
      if (!fishList.get(p).live) {
        fishList.remove(p); //Removes dead fish
        p--;
      }
    }
    for (int p=0; p<goldfishList.size(); p++) {
      if (!goldfishList.get(p).live) {
        goldfishList.remove(p); //Removes dead goldfish
        p--;
      }
    }
    for (int p=0; p<piranhaList.size(); p++) {
      if (!piranhaList.get(p).live) {
        piranhaList.remove(p); //Removes dead piranhas
        p--;
      }
    }
    for (int p=0; p<whaleList.size(); p++) {
      if (!whaleList.get(p).live) {
        whaleList.remove(p); //Removes dead whales
        p--;
      }
    }
    for (int p=0; p<toroidalfinList.size(); p++) {
      if (!toroidalfinList.get(p).live) {
        toroidalfinList.remove(p); //Removes dead toroidalfins
        p--;
      }
    }
    for (int p=0; p<pelletList.size(); p++) {
      pelletList.remove(p); //Removes all pellets
      p--;
    }
    SpecialFish=-1; //Resets selected fish
    ammonia=0;//Resets ammonia
  }
  if (buttons==6) { 
    for (int i=0; i <1; i++) {
      fishList.add(new Toroidalfin()); //Adds new toroidalfin
      toroidalfinList.add(new Toroidalfin());
    }
  }
  if (buttons==7) {
    for (int i=0; i <1; i++) {
      fishList.add(new Piranha());  //Adds new piranha
      piranhaList.add(new Piranha());
    }
  }
  if (buttons==8) {
    for (int i=0; i <8; i++) {
      pelletList.add(new Poison()); //Adds new poison pellets
    }
  }
  if (buttons==9) { //Tap the tank
    int randomDeath;
    for (int i=0; i <1; i++) {
      for (Fish fish : fishList) {
        if (fish.live) { //If fish is alive
          if (fish.age>120) {
            randomDeath=int(random(0, 50000/fish.age));//Sees random death
            if (randomDeath == 2)
            {
              fish.live=!fish.live; //Randomly kills fish based on age
              fish.deathType =2;
            }
          } 
          fish.fVelocity.set(PVector.random2D()).setMag(2); //Randoms changes veocuty of fish
        }
      }
    }
  }
  if (buttons==10) {
    pause=!pause; //Pauses fish tank
  }
  buttons = 0; //Resets button click

  noStroke();
  fill(#3498db);
  rect(width-300, 0, width, height); //Sets a recctangls on the right of the screen
  fill(69, 233, 41);
  textAlign(CENTER, CENTER);

  for (int i=0; i<2; i++) { //Draws out the buttons
    for (int j=0; j<5; j++) {
      if (sq(mouseX- (width-215) - (i*130))+sq(mouseY-75-(j*75))<=sq(30)) {
        fill(#A43023);
      } else {
        fill(#c0392b);
      }
      ellipse((width-215) + (i*130), 75+(j*75), 60, 60);
    }
  }

  fill(255);
  textAlign(CENTER, CENTER); //Draws words on all of the button
  text("Goldfish", (width-215), 75);  
  text("Toroidalfin", (width-85), 75);
  text("Whale", (width-215), 150);
  text("Piranha", (width-85), 150);
  text("Food", (width-215), 225);
  text("Tap tank", (width-85), 300);
  text("Speed", (width-213), 300);
  text("Poison", (width-85), 225);
  text("Clean", (width-215), 375);
  text("Pause", (width-215)+130, 375);

  if (frames%25==0&&pause) { //Adds the bigger bubbles
    bubbleList.add(new Bubble(1, (random(0, width-300)), random(height+3, height+10)));
  }
  fill(152, 179, 2, (int(ammonia*1.3))); //Sets green rectangle over fish to make it greed
  rect(0, 0, width-300, height);

  if (fishList.size()>0 && SpecialFish!=-1 && fishList.get(SpecialFish).opacity>50 && fishList.get(SpecialFish).fPosition.x<5000 ) { //Fish selected gives statistics
    textAlign(LEFT, CENTER);
    fill(200, 33, 122);
    if (fishList.get(SpecialFish).fPosition.y-(fishList.get(SpecialFish).weight)>15) { //Draws idicator on fish
      triangle(fishList.get(SpecialFish).fPosition.x, fishList.get(SpecialFish).fPosition.y-(fishList.get(SpecialFish).weight)-5, fishList.get(SpecialFish).fPosition.x-15, fishList.get(SpecialFish).fPosition.y-(fishList.get(SpecialFish).weight)-20, fishList.get(SpecialFish).fPosition.x+15, fishList.get(SpecialFish).fPosition.y-(fishList.get(SpecialFish).weight)-20);
    } else {
      triangle(fishList.get(SpecialFish).fPosition.x, fishList.get(SpecialFish).fPosition.y+(fishList.get(SpecialFish).weight)+5, fishList.get(SpecialFish).fPosition.x-15, fishList.get(SpecialFish).fPosition.y+(fishList.get(SpecialFish).weight)+20, fishList.get(SpecialFish).fPosition.x+15, fishList.get(SpecialFish).fPosition.y+(fishList.get(SpecialFish).weight)+20);
    }
    fishList.get(SpecialFish).showStill(); //Shows little fish image
    fill(255);//Shows fish statistics
    text("Name: " + fishList.get(SpecialFish).name, width-250, height-140);
    text("Age: " + fishList.get(SpecialFish).age, width-250, height-120);
    text("Weight: " + fishList.get(SpecialFish).weight, width-250, height-100);
    if (fishList.get(SpecialFish).fType==0) {
      text("Type: Goldfish", width-250, height-80);
    } else if (fishList.get(SpecialFish).fType==1) {
      text("Type: Piranha", width-250, height-80);
    } else if (fishList.get(SpecialFish).fType==2) {
      text("Type: Toroidalfin", width-250, height-80);
    } else {
      text("Type: Whale", width-250, height-80);
    }
    if (fishList.get(SpecialFish).live) 
      text("Status: Alive", width-250, height-60); 
    else
      text("Status: Dead", width-250, height-60);
    if (fishList.get(SpecialFish).getGen()) text("Gender: Female", width-250, height-40); 
    else text("Gender: Male", width-250, height-40);
    if (!fishList.get(SpecialFish).live) { //Shows causes of death  
      if (fishList.get(SpecialFish).age >= fishList.get(SpecialFish).maxAge) text("Cause of death: Over-age", width-250, height-20);
      else if (fishList.get(SpecialFish).weight <= fishList.get(SpecialFish).minWeight) text("Cause of death: Underweight", width-250, height-20);
      else if (fishList.get(SpecialFish).weight >= fishList.get(SpecialFish).maxWeight) text("Cause of death: Overweight", width-250, height-20);
      else if (fishList.get(SpecialFish).deathType == 0)text("Cause of death: Suffocation", width-250, height-20); 
      else if (fishList.get(SpecialFish).deathType == 2) text("Cause of death: Heart attack", width-250, height-20);
    }
  }
}
void mouseClicked() { //Detects if the mouse is clicked
  int clickCount =0;
  for (int i=0; i<2; i++) {//Detects which button is clicked
    for (int j=0; j<5; j++) {
      clickCount++;
      if (sq(mouseX- (width-215) - (i*130))+sq(mouseY-75-(j*75))<=sq(30)) {
        buttons=clickCount;
      }
    }
  }
  if (mouseX<width-300) { //Detects which fish is clicked on to determine indicator
    for (int i = 0; i < fishList.size(); i++) {
      if (dist(fishList.get(i).getX(), fishList.get(i).getY(), mouseX, mouseY) <=fishList.get(i).weight+10) {
        SpecialFish = i;
        break;
      }
    }
  }
}