class Goldfish extends Fish {//Goldfish
  Goldfish() {
    super(); //Extends fish
    this.fType =0; //Initializes important variables
    this.randomGender = int(random(0, 1.99));
    if (randomGender == 0) this.gender = false; 
    else this.gender = true;
    if (gender) name=girlsNames[int(random(0, ((girlsNames.length))))];
    else name=boysNames[int(random(0, ((boysNames.length))))];
    this.maxSpeed=3;
    this.r=255;
    this.g=int(random(0, 255));
    this.b=10;
    this.skin=color(r, g, b, opacity);
    this.outline=color(0);
    this.weight = 18;
    maxWeight=30;
    this.minWeight=weight/10;
    maxAge=20000;
    speed =2;
    orgSpeed=2;
  }
}