class Bubble { //Bubble class
  private float bWeight, outline, deltaY, bX, bY, randomSize, age, size, deSize; //Declares necessarry variables for each bubble in the class
  private boolean fish;
  private float locX, locY;

  Bubble(float size, float bX, float bY) { //Bubble constructor
    if (size==0) { //Different size bubbles
      this.deltaY=1; 
      this.outline=2;
    } else {
      this.deltaY=.5;
      this.outline=1;
    }
    this.deSize=size; //Sets size
    this.locX=bX; //Sets location
    this.locY=bY;
  }
  Bubble() { //Default constructor
    this.deSize = 1;
    this.deltaY=1;
    this.outline=1;
  }
  public void update() {
    move();
    show();
    age++;
  }
  public void show() {
    stroke(255);
    strokeWeight(outline);
    fill(255, 80);
    if (deSize==0) {//Draws two types of bubbles
      ellipse(locX, locY, 16, 16);
    } else {
      ellipse(locX, locY, 7, 7);
    }
  }
  public void move() { //Moves bubbles
    locY-=deltaY;
  }
}