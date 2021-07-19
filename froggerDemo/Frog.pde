class Frog extends Rectangle{
  int picW = 512;
  int picH = 800;
  PImage up, left, right, down;
  PImage frog;
  int frogSize, frogX, frogY;
  PVector frogLoc;
  
  //Frog(int frogSize, int frogX, int frogY ){
  //  this.frogSize = frogSize;
  //  this.frogX = frogX;
  //  this.frogY = frogY;
    
  //  frog = loadImage("data/images/frog.png");
  //  frog.resize(frogSize,frogSize);
  //  speed = new PVector(frogX, frogY);
  //}
  
  Frog(int x, int y, int w){
    super(x,y,w,w);
    frog = loadImage("data/images/frog.png");
    frog.resize(w,w);
    frogLoc = new PVector(x, y);
  }
  
  void up(){
    image(frog, frogLoc.x, frogLoc.y);
    
    //flip -- not working
    //pushMatrix();
    //scale( -1, 1 );
    //image( frog, -30, 0 );
    //popMatrix();
  }
  
  void spawn(){
    
  }
  
  void move(float xdir, float ydir){
    //slow down the frog using framecount
    if (frameCount%5==0){
      frogLoc.x += xdir*w;
      frogLoc.y += ydir*w;
    }
    
  }
}
