class GuideScreen {
  boolean MenuGuide = true, Play;
  float B1 = 100, B2 = 100;
  
  void GuideText() {
    textSize(36);
     text("Guide:", (width /2) - (textWidth("Guide:") / 2), 58);  
    
    textSize(28);
    text("Control the Frog with 4 Arrows Keys", (width /2) - 
    (textWidth("Control the Frog with 4 Arrows Keys") / 1.9), 110);  
    
    textSize(20);
    text("Your goal is to guide the frog to safety lane from \nthe bottom of the screen to the safety lane on the top", (width /2) - 
    (textWidth("Your goal is to guide the frog to safety lane from \nthe bottom of the screen to the safety lane on the top")
    / 2), 150);  
    
    textSize(28);
    text("Good Luck!", (width /2) - (textWidth("Good Luck!") / 2), 220);  
    
    
    //SCORE
    //TIMER
  }
  
  void GuideMenu() {  
    //Button 1: 
    fill(255, 77, 80, B1); //Button margin colour
    rect(width/2, height/2 - 50, 200, 50, 20); //Drawing the button
    fill(255); //Font colour for inside of the button
    //Button text
    text("Play", (width /2) - (textWidth("Play") / 2), (height/2) + ((textAscent() - textDescent()) / 2) - 50);
    
    //Button 2:
    fill(255, 77, 80, B2); //Button margin colour
    rect(width/2, height/2 + 75, 200, 50, 20); //Drawing the button
    fill(255); //Font colour for inside of the button
    //Button text
    text("Quit", (width /2) - (textWidth("Quit") / 2), (height/2) + ((textAscent() - textDescent()) / 2) + 75);
    
    
    if (MenuGuide) {
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 
      && mouseY > height/2 - 50 - 25 && mouseY < height/2 - 50 + 25) { //pointer collision with Button1
        if (mousePressed) {  
          secondScreen();
          TimerDisplay();
          resetGame();
        }
        if (B1 < 150) { //Highlighting effect by darkening the colour for button 1
          B1 += 100;
        }
      } else if (B1 > 100) {
        B1 -= 100;
      }

      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 
      && mouseY > height/2 + 75 - 25 && mouseY < height/2 + 75 + 25) { //pointer collision with Button3
        if (mousePressed) {
          exit();  //Quits the window
          
        }
        if (B2 < 150) { //Highlighting effect by darkening the colour for button 3
          B2 += 100;
        }
      } else if (B2 > 100) {
        B2 -= 100;
      }
    }
  }
}
