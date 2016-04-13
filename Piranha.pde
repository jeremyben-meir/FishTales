class Piranha extends Fish { //Piranha
  Piranha() {
    super(); //Extends fish
    this.fType =1; //Initializes important variables
    this.randomGender = int(random(0, 1.99));
    if (randomGender == 0) this.gender = false; 
    else this.gender = true;
    if (gender) name=girlsNames[int(random(0, ((girlsNames.length))))];
    else name=boysNames[int(random(0, ((boysNames.length))))];
    this.maxSpeed=5;
    this.r=int(random(0, 247));
    this.g=0;
    this.b=247;
    this.skin=color(r, g, b, opacity);
    this.weight = 20;
    this.minWeight=weight/10;
    this.maxWeight=50;
    maxAge=10000;
    speed=2;
    orgSpeed=2;
  }
}