class Lane extends Rectangle {
  Obstacle[] obstacles;
  Coin[] coin;
  int col;
  int type;
  
  //Defining lane variables
  Lane(int index, int t, int n, float len, float spacing, float speed, color c)
  {
    //Setting variables values
    super(0,index*grid,width*2,grid);
    type = t;
    obstacles = new Obstacle[n];
    float offset = random(0,200);
    for(int i = 0; i < n; i++)
    {
      //Defining the obstacle variables in the lane
      obstacles[i] = new Obstacle(offset + spacing*i, index*grid-25, grid*len, grid, speed);
    }
    col = c;
  }
  
  //Defining the safety lanes
  Lane(int index, color c, int t, int n, float spacing)
  {
    super(0,index*grid,width*2,grid);
    //type = SAFETY;
    type= t;
    obstacles = new Obstacle[0];
    coin = new Coin[n];
    float offset = random(0,200);
    for(int i = 0; i < n; i++)
    {
      //Defining the coin variables in the lane
      coin[i] = new Coin(offset + spacing*i, index*grid-20, grid);
    }
    col = c;
    score=0;
  }
  
  //Collision detection
  void check(Frog frog)
  {
    //if the obstacle is type car, reset the game on collision
    if(type == CAR)
    {
      for(Obstacle o : obstacles)
      {
        if(frog.intersects(o))
        {
          resetGame();
        }
      }
    }
    
    //if the obstacle is type log, attach the frog object to the obstacle
    else if(type == LOG) {
      boolean ok = false;
      for(Obstacle o : obstacles)
      {
        if(frog.intersects(o))
        {
          ok = true;
          frog.attach(o);
        }
      }
      
      //if the frog is in the log lane, but does not intersect with log object, reset the game
      if(!ok)
      {
        resetGame();
      }
    }
    
    //if the frog intersects coins
    else if(type == COIN)
    {
      score();
    }
  }
  
  //Function for displaying lanes and obstacle objects
  void run()
  {
    //drawing each lane
    fill(col);
    rect(x,y,w,h);
 
   //display cars
    if(type == CAR)
    {
      for(Obstacle o : obstacles)
      {
        o.update();
        o.showCar();
      }
    } 
    
    //display logs
    else if(type == LOG)
    {
      for(Obstacle o : obstacles)
      {
        o.update();
        o.showLog();
      }
    }
    
    ////display coins
    else if(type==COIN)
    {
      for(Coin coin : coin)
      {
        coin.showCoin();
      }
    } 
  }
  //function for counting score with coins
  int score()
  {
    for(Coin coin : coin)
    {
      if(frog.intersects(coin))
      {
        //player's score +1
        score++;
        println(score);
        coin.x=-100;
        coin.y=-100;
      }
    }
    return score;
  }
}
