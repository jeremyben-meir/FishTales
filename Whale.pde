class Whale extends Fish {//Whale
  Whale() {
    super();//Extends fish
    this.fType =3;//Initializes important variables
    grey=int(random(50,200));
    this.randomGender = int(random(0, 1.99));
    if (randomGender == 0) this.gender = false; 
    else this.gender = true;
    if (gender) name=girlsNames[int(random(0, ((girlsNames.length))))];
    else name=boysNames[int(random(0, ((boysNames.length))))];
    this.maxSpeed=5;
    this.r=grey;
    this.g=grey;
    this.b=grey;
    this.skin=color(r, g, b, opacity);
    this.outline=color(0);
    this.weight = 30;
    this.maxWeight = 100;
    this.minWeight=weight/10;
    maxAge=5000;
    orgSpeed=1;
    speed=1;
  }
}