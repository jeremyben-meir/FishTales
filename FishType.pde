class Fish {
  //Declares a bunch of variables
  protected String[] boysNames=loadStrings("data/Boys.txt"); //text files with fish names
  protected String[] girlsNames=loadStrings("data/Girls.txt");
  public String name;
  protected int count0, count1, count2, count3, inDic, inDicC=0, deadMeat=1;
  protected float deltaX, deltaY, maxSpeed;
  protected float randomDeltaX, randomDeltaY, randomGender;
  public float weight, maxWeight=300, minWeight=weight/10;
  protected color skin, outline;
  public int age, maxAge, speedAge, stopSpeed=0, deathType;
  protected boolean gender;
  public boolean live=true;
  protected PVector fVelocity= new PVector().random2D().setMag(2);
  protected int pCount=0;
  protected boolean pCountBoo=false;
  public PVector fPosition = new PVector(random(50, width-350), random(50, height-50));
  public PVector fLastPosition = new PVector(random(50, width-350), random(50, height-50));
  protected PVector fPupil = new PVector().random2D().setMag(2);
  protected PVector fEye = new PVector().random2D().setMag(2);
  public int fType, foodFrames=0;
  public float opacity=255;
  protected int r, g, b, grey;
  protected float flap=1.25, deltaFlap=.08;
  public float speed=2, orgSpeed=2;
  private float randomDeath;
  public boolean eatFood=true;
  Fish() {
    //Initializes variables for default constructors
    this.randomGender = int(random(0, 1.99));
    if (randomGender == 0) this.gender = false; 
    else this.gender = true;
    if (gender) name=girlsNames[int(random(0, ((girlsNames.length))))];
    else name=boysNames[int(random(0, ((boysNames.length))))];
    this.maxSpeed=5;
    this.skin=color(random(255), 0, 0, opacity);
    this.outline=color(0);
    this.weight = 100;
    maxAge=5000;
  }
  Fish(String name, float h, float w) {
    //fish constructor
    this.name=name;
    this.maxSpeed=5;
    this.skin=color(0, random(255), 0);
    this.outline=color(0);
    this.weight=100;
  }

  public float getX() {//Returns x position
    return fPosition.x;
  }
  public float getY() {//Reutrns y position
    return fPosition.y;
  }

  public void update() {//Updtaes all fucntions of each fish
    if (live) { //If fish is alive
      move();
      eat();
      age++;
      death();
      show();
    } else {
      move();
      show();
      this.skin=color(r, g, b, opacity); //sets color
    }
  }//update

  public void show() {
    fill(skin);
    noStroke();
    strokeWeight(1);
    //stroke(outline);
    fEye.set(fVelocity.x, fVelocity.y).setMag(weight/4); //Set movement of eye (direction)
    if (fType==2) { //If toridalfin, outlines
      stroke(outline);
    }
    ellipse(fPosition.x, fPosition.y, weight*2, weight*2); //FISH BODY ITSELF

    if (live && pause) { //If alive and not paused
      flap+=deltaFlap; //Flap gets bigger and smaller
      if (flap >1.75 || flap<1.25) deltaFlap*=-1; 
      triangle(fPosition.x, fPosition.y, fPosition.x-((weight/flap)*(fVelocity.x))+((weight/flap)*(fVelocity.y)), fPosition.y-(fVelocity.y*(weight/flap))-((weight/flap)*fVelocity.x), fPosition.x-((weight/flap)*(fVelocity.x))-((weight/flap)*fVelocity.y), fPosition.y-((weight/flap)*(fVelocity.y))+((weight/flap)*fVelocity.x));
      //^Tail using vecotrs of movement
      stroke(0);
      //Make two lines that look like a fin
      line(fPosition.x-((weight*flap)/5*(fVelocity.x)), fPosition.y-((weight*flap)/5*(fVelocity.y)), fPosition.x-((weight/5)*(fVelocity.y)), fPosition.y + ((weight/5)*(fVelocity.x)));
      line(fPosition.x-((weight*flap)/5*(fVelocity.x)), fPosition.y-((weight*flap)/5*(fVelocity.y)), fPosition.x+((weight/5)*(fVelocity.y)), fPosition.y - ((weight/5)*(fVelocity.x)));
    } else {
      triangle(fPosition.x, fPosition.y, fPosition.x-((weight/1.5)*(fVelocity.x))+((weight/1.5)*(fVelocity.y)), fPosition.y-(fVelocity.y*(weight/1.5))-((weight/1.5)*fVelocity.x), fPosition.x-((weight/1.5)*(fVelocity.x))-((weight/1.5)*fVelocity.y), fPosition.y-((weight/1.5)*(fVelocity.y))+((weight/1.5)*fVelocity.x));
      //^Makes still fin
      stroke(0);
      //Makes static tail
      line(fPosition.x-((weight/3)*(fVelocity.x)), fPosition.y-((weight/3)*(fVelocity.y)), fPosition.x-((weight/5)*(fVelocity.y)), fPosition.y + ((weight/5)*(fVelocity.x)));
      line(fPosition.x-((weight/3)*(fVelocity.x)), fPosition.y-((weight/3)*(fVelocity.y)), fPosition.x+((weight/5)*(fVelocity.y)), fPosition.y - ((weight/5)*(fVelocity.x)));
    }
    noStroke();
    fill(255);
    //Eye (white) in directio of movement
    ellipse(fPosition.x+(fVelocity.x)+fEye.x, fPosition.y+(fVelocity.y)+fEye.y, weight/2, weight/2);
    fill(0);
    //Setting pupil movement
    fPupil.set(mouseX-fPosition.x, mouseY-fPosition.y).setMag(weight/8);
    if (mouseX<width-300&&live&&pause) { //Draw pupil
      ellipse(fPosition.x+(fVelocity.x)+fPupil.x+fEye.x, fPosition.y+fVelocity.y+fPupil.y+fEye.y, weight/4, weight/4);
    } else {
      ellipse(fPosition.x+(fVelocity.x)+fEye.x, fPosition.y+(fVelocity.y)+fEye.y, weight/4, weight/4);
    }
    stroke(50);

    //line(fPosition.x, fPosition.y, fPosition.x-(fVelocity.x*10), fPosition.y-(fVelocity.y*10));
    noStroke();
    //text(toString(), fPosition.x-5, fPosition.y-5);
  } //show() 

  //Mkae it so it stays on one fish


  public void move() { //Moves the fish

    if (live) {


      if (speed>orgSpeed) { //Set speed that only changes once (300 frame refresh)
        if (stopSpeed == 0) {
          speedAge=age;
          stopSpeed=1;
        }
        if (speedAge+300==age) {
          speed=orgSpeed;
          stopSpeed=0;
        }
      }

      if (fType==2) { //If Toroidalfin

        if (fPosition.x<=(weight)) { //Wraps bounaries 
          fPosition.x=width-300 - (weight)-1;
        }
        if (fPosition.x>=width-300-(weight)) {
          fPosition.x=weight+1;
        }
        if (fPosition.y<=(weight)) {
          fPosition.y=height-(weight)-1;
        } 
        if (fPosition.y>=height-(weight)) {

          fPosition.y=weight+1;
        }
      } else if (fType==1) { //if piranha
        inDic=0;
        for (Fish fish : fishList) { //Chooses goldfish to follow
          if (fish.fType==0&& fish.live) {
            inDic=inDicC;
          }
          inDicC++;
        }
        inDicC=0;
        if (goldfishList.size()>0 && piranhaList.size()>0&&fishList.get(inDic).live&& fishList.get(inDic).opacity!=0) { //Follows goldfish


          for (Fish fish1 : fishList) { //Tests for collision between two fish
            if (dist(fish1.fPosition.x, fish1.fPosition.y, this.fPosition.x, this.fPosition.y)==0 && fish1.age!=this.age&& fish1.live&&this.live) {
              fish1.fVelocity.set(fish1.fPosition.x-this.fPosition.x, fish1.fPosition.y-this.fPosition.y).setMag(10); //Changes direction of fish
              this.fVelocity.set(this.fPosition.x-fish1.fPosition.x, this.fPosition.y-fish1.fPosition.y).setMag(10);
            } else {
              fVelocity.set(fishList.get(inDic).fPosition.x- this.fPosition.x, fishList.get(inDic).fPosition.y- this.fPosition.y).setMag(speed); //Sets velocity toward goldfish
            }
          }
        } else { //If piranha without any goldfish in the tank, bounce off of walls
          if (fPosition.x<=(weight)) {
            fPosition.x=weight;
            fVelocity.x*=-1;
          }
          if (fPosition.x>=width-300-(weight)) {
            fPosition.x=width-300 - (weight);
            fVelocity.x*=-1;
          }
          if (fPosition.y<=(weight)) {
            fPosition.y=weight;
            fVelocity.y*=-1;
          }
          if (fPosition.y>=height-(weight)) {
            fPosition.y=height-(weight);

            fVelocity.y*=-1;
          }
        }
      } else if (fType==3) { //If whale
        if (fPosition.x<=(weight)) {
          fPosition.x=weight;
          fVelocity.x*=-1;
        }
        if (fPosition.x>=width-300-(weight)) {
          fPosition.x=width-300 - (weight);
          fVelocity.x*=-1;
        }
        if (fPosition.y<=(weight)) {
          fPosition.y=weight;
          fVelocity.y*=-1;
        }
        if (fPosition.y>=height-(weight)) {
          fPosition.y=height-(weight);

          fVelocity.y*=-1;
        }
      } else { //If goldfish, just bounce off of walls
        if (fPosition.x<=(weight)) {
          fPosition.x=weight;
          fVelocity.x*=-1;
        }
        if (fPosition.x>=width-300-(weight)) {
          fPosition.x=width-300 - (weight);
          fVelocity.x*=-1;
        }
        if (fPosition.y<=(weight)) {
          fPosition.y=weight;
          fVelocity.y*=-1;
        }
        if (fPosition.y>=height-(weight)) {
          fPosition.y=height-(weight);

          fVelocity.y*=-1;
        }
      }
      fVelocity.set(fVelocity).setMag(speed); //So at certain speed
      fPosition.add(fVelocity);
      fVelocity.set(fVelocity).setMag(2); //Set speed to 2 to regulate tail size
    } else { //If dead
      if (fPosition.y>(weight)) {
        fPosition.y-=1;
      } else {
        fPosition.y=weight;
      }
    }
  }//move()

  public void showStill() {//To show image of fish in bottom right of screen
    fLastPosition.set(fPosition); //buffer position
    fPosition.set(width-100, height-100); //Changes original position
    fill(skin);
    noStroke();
    strokeWeight(1);
    //stroke(outline);
    fEye.set(fVelocity.x, fVelocity.y).setMag(weight/4); //set the eye to be proportianal to actual fish
    ellipse(fPosition.x, fPosition.y, weight*2, weight*2); //Print body of fish
    triangle(fPosition.x, fPosition.y, fPosition.x-((weight/1.5)*(fVelocity.x))+((weight/1.5)*(fVelocity.y)), fPosition.y-(fVelocity.y*(weight/1.5))-((weight/1.5)*fVelocity.x), fPosition.x-((weight/1.5)*(fVelocity.x))-((weight/1.5)*fVelocity.y), fPosition.y-((weight/1.5)*(fVelocity.y))+((weight/1.5)*fVelocity.x));
    //^Tail
    stroke(0);
    //Fin in proper direction
    line(fPosition.x-((weight/3)*(fVelocity.x)), fPosition.y-((weight/3)*(fVelocity.y)), fPosition.x-((weight/5)*(fVelocity.y)), fPosition.y + ((weight/5)*(fVelocity.x)));
    line(fPosition.x-((weight/3)*(fVelocity.x)), fPosition.y-((weight/3)*(fVelocity.y)), fPosition.x+((weight/5)*(fVelocity.y)), fPosition.y - ((weight/5)*(fVelocity.x)));
    noStroke();
    fill(255);
    //Draw the eye
    ellipse(fPosition.x+(fVelocity.x)+fEye.x, fPosition.y+(fVelocity.y)+fEye.y, weight/2, weight/2);
    fill(0);
    if (mouseX<width-300&&live&&pause) { //If alive and unpaused
      ellipse(fPosition.x+(fVelocity.x)+fPupil.x+fEye.x, fPosition.y+fVelocity.y+fPupil.y+fEye.y, weight/4, weight/4);
    } else {
      ellipse(fPosition.x+(fVelocity.x)+fEye.x, fPosition.y+(fVelocity.y)+fEye.y, weight/4, weight/4);
    }
    stroke(50);
    noStroke();
    fPosition.set(fLastPosition); //Reset position tho where it was before
  }
  public void eat() { 
    for (Pellet pellet : pelletList) { //For all pellets
      if (dist(pellet.myX, pellet.myY, fPosition.x, fPosition.y)<=(weight)+(2.5)&&live&& eatFood) { //Fish touch pellets
        pellet.myX=20000; //Put pellets away
        if (pellet.type==0)weight+=5; //Do pellet effect
        else if (pellet.type==1) weight-=10; 
        else {
          if (speed==orgSpeed) { //Change speed
            speed=speed+1;
          }
        }
        eatFood=false;
        this.foodFrames=0;
      }
    }
    if (!eatFood&&foodFrames<=100) { //Cannot eat food so quickly, adds buffer
      this.foodFrames++;
    }
    if (foodFrames>=100) {
      eatFood = true;
      this.foodFrames=0;
    }


    for (Fish fish1 : fishList) { //If piranha/whale and goldfish collide, piranha/whale eats golfish
      if ((fish1.fType==0 &&this.fType==1)||(fish1.fType==0 &&this.fType==3)) {
        if (dist(fPosition.x, fPosition.y, fish1.fPosition.x, fish1.fPosition.y)<=fish1.weight+weight && fish1.live) {
          fish1.live=!fish1.live;
          fish1.fPosition.x=20000;
          weight+=fish1.weight/4;
        }
      }
    }
  }
  public void death() {
    if (ammonia >110) { //If a lot of ammonia
      randomDeath=int(random(0, 7000/ammonia));
      if (randomDeath == 2) //Big chance of death
      {
        deathType=0;
        live=!live;
      }
    }
    if (weight<=minWeight || weight>=maxWeight|| age>=maxAge) { //if weight too much, too littl, or age too much, die
      live=!live;
    }
  }
  public boolean getGen() {
    return gender;
  }
}//abstract class Fish