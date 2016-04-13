class Pellet { //Over arching pellet class
  public float myX, myY; //Declared important variables
  protected color myColor;
  private int age;
  private boolean show;
  protected int type;

  Pellet() { //Default constructor
    this.myX=random(5, width-300); //Initializes variables 
    this.myY=random(-13, -3);
    this.myColor=color(200, 0, 0);
  }
  Pellet(String name, color myColor) { //Overloaded constructor
    noStroke(); //Initializes variables 
    this.myX=random(5, width-300);
    this.myY=random(-100, -3);
    this.myColor=color(0, 200, 0);
  }//fish constructor

  public float getX() {
    return myX;
  }
  public float getY() {
    return myY;
  }

  public void update() { //Updates
    move();
    show();
    age++;
  }//update

  public void show() {
    noStroke();
    fill(myColor);
    ellipse(myX, myY, 5, 5); //Shows mall circle
    fill(255);
    //text(toString(), myX-5, myY-5);
  } //show() 

  public void move() { //Circle moves down
    if (myY>=height-2.5) {
      myY=height-2.5;
    } else {
      myY+=.5;
    }
    

  }
}//move()

//public String toString() { 
//}
//abstract class Fish