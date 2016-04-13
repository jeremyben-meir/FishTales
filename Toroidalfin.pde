class Toroidalfin extends Goldfish {//Toroidalfin
  Toroidalfin() {
    super();//Extends fish
    this.fType =2;//Initializes important variables
    this.randomGender = int(random(0, 1.99));
    if (randomGender == 0) this.gender = false; 
    else this.gender = true;
    if (gender) name=girlsNames[int(random(0, ((girlsNames.length))))];
    else name=boysNames[int(random(0, ((boysNames.length))))];
    this.maxSpeed=5;
    this.r=201;
    this.g=0;
    this.b=0;
    opacity=50;
    this.skin=color(r, g, b, opacity);
    this.outline=color(255,0,0);
  }
}