int tideHeight = 1;
int waveSpeed = 50; //The higher the number the slower the waves
int counter = 0, counterMax = 50; //used to reset waves
int cloudCenter = 0;
int blueVar = 255; // used to change color of waves over each frame
boolean blueDown = true;

void setup(){
  //initial background
  surface.setResizable(true);
  size(1280,800);
  background(#160a47);
  ellipseMode(CENTER);
}


void draw(){
  //sunset background
  clear();
  background(#160a47);
  noStroke();
  rectMode(CORNER);
  fill(#60047a);
  rect(0,height-(4*(height/5)),width,height-(height/5));
  fill(#9c0f5f);
  rect(0,height-(3*(height/5)),width,height-(2*(height/5)));
  fill(#c91b26);
  rect(0,height-(2*(height/5)),width,height-(3*(height/5)));
  fill(#f2671f);
  rect(0,height-(height/5),width,height-(4*(height/5)));
  
  //cloud and instructions
  fill(255,255,255);
  ellipse(cloudCenter,height/5,width/6,(height/4));
  ellipse(cloudCenter+width/12,height/5,width/12,(height/7));
  ellipse(cloudCenter-width/12,height/5,width/12,(height/6));
  
  textSize(18);
  fill(0);
  text("A- Slower waves",cloudCenter-(width/12),height/7);
  text("D- Faster waves",cloudCenter-(width/12),(height/7)+(height/40));
  text("W- Taller waves",cloudCenter-(width/12),(height/7)+(2*(height/40)));
  text("S- Smaller waves",cloudCenter-(width/12),(height/7)+(3*(height/40)));
  text("Click mouse to activate.",cloudCenter-(width/12),(height/7)+(4*(height/40)));
  
  if(cloudCenter < width+(2*(width/6))){
    cloudCenter += 2;
  }
  else{
    cloudCenter = 0 -(2*(width/6));
  }
  
  
  //Drawing the waves
  fill(0,255,blueVar);
  rect(0,height-(height/6),width,height/6);
  if(mousePressed == true){
    counterMax = waveSpeed;
    fill(0,255,blueVar);
    int waveHeightModifier = 1;
    for(int i = 0; i < 9; i++){
      int xBase = (i * (width/8));
      //back waves 
      
      fill(0,0,blueVar);
      triangle(-(width/8)+xBase+(counter*((width/8)/counterMax))+(width/16),height-(height/6),-(width/8)+xBase+((width/8)/2)+(counter*((width/8)/counterMax))+(width/16),
      height-(2*(height/6))-((waveHeightModifier*(height/30))*tideHeight),-(width/8)+(xBase+(width/8))+(counter*((width/8)/counterMax))+(width/16),height-(height/6));
      //front waves
      fill(0,255,blueVar);
      triangle(-(width/8)+xBase+(counter*((width/8)/counterMax)),height-(height/6),-(width/8)+xBase+((width/8)/2)+(counter*((width/8)/counterMax)),
      height-(2*(height/6))-((waveHeightModifier*(height/30))*tideHeight),-(width/8)+(xBase+(width/8))+(counter*((width/8)/counterMax)),height-(height/6));
      waveHeightModifier = (-1 * waveHeightModifier);
    }
  }
  else{
    counterMax = 50;
    fill(0,255,blueVar);
    int waveHeightModifier = 1;
    for(int i = 0; i < 9; i++){
      int xBase = (i * (width/8));
      //back waves 
      
      fill(0,0,blueVar);
      triangle(-(width/8)+xBase+(counter*((width/8)/counterMax))+(width/16),height-(height/6),-(width/8)+xBase+((width/8)/2)+(counter*((width/8)/counterMax))+(width/16),
      height-(2*(height/6))-(waveHeightModifier*(height/30)),-(width/8)+(xBase+(width/8))+(counter*((width/8)/counterMax))+(width/16),height-(height/6));
      //front waves
      fill(0,255,blueVar);
      triangle(-(width/8)+xBase+(counter*((width/8)/counterMax)),height-(height/6),-(width/8)+xBase+((width/8)/2)+(counter*((width/8)/counterMax)),
      height-(2*(height/6))-(waveHeightModifier*(height/30)),-(width/8)+(xBase+(width/8))+(counter*((width/8)/counterMax)),height-(height/6));
      waveHeightModifier = (-1 * waveHeightModifier);
    }
  }
  
  
  //info update for next frame
  
  //change front wave color every frame
  if(blueVar >= 185 && blueDown == true){
     blueVar--;
  }
  else{ 
     blueDown = false;
     if(blueVar <= 254 && blueDown == false){
       blueVar++;
     }
     else{
       blueDown = true;
     }
  }
  
  //wave motion
  if(counter < counterMax){
     counter++;
  }
  else{
    counter = 0;
  }
}


void keyPressed(){
  if(keyCode == 65){//Control wave speed (slower)
      waveSpeed++;
      if(waveSpeed > 100){
        waveSpeed = 100;
      }
  }
  if(keyCode == 68){//Control wave speed (faster)
      waveSpeed--;
      if(waveSpeed < 10){
        waveSpeed = 10;
      }
  }
  
  
  
  if(keyCode == 87){//Control tide height (up)
      tideHeight++;
      if(tideHeight > 4){
        tideHeight = 4;
      }
  }
  if(keyCode == 83){//Control tide height (down)
      tideHeight--;
      if(tideHeight < 1){
        tideHeight = 1;
      }
  }
}
