class Clouds{
  float fillColor;
  int centerX;
  int centerY;
  Clouds next = null;
  boolean seasonWinter;
  float[] percipX = new float[10];
  float[] percipY = new float[10];
  float[] percipX2 = new float[10];
  int percipStart = 0;
  int listSize = 0;
  int snowAlpha = 0;
  int snowHeight = 0;
  
  Clouds(){//cloud creation in center incase of error
    fillColor = 100;
    centerX = (width/2);
    centerY = (height/3);
  }
  
  Clouds(float colorFill,int x,int y,boolean winter,int size){//cloud initialization
    listSize = size;
    fillColor = colorFill;
    centerX = x;
    seasonWinter = winter;
    if(y > (height/3)){//check to make sure cloud isnt on the ground
      centerY = (height/3);
    }
    else{
      centerY = y;
    }
    percipStart = centerY;
    for(int i = 0; i < 10; i++){//used for rain and snow
      percipX[i] = random((x-175),(x+175));
      percipY[i] = centerY;
      percipX2[i] = percipX[i];
    }
  }
  
  void display(){
    if(seasonWinter == true){
      for(int i = 0; i < 10; i++){//this will create display and update snow so it falls
        Percipitation rain = new Percipitation();
        rain.display(255,255,255,percipX[i],percipY[i]);
        percipY[i] = (percipY[i] + (((height-percipStart)/120)+(listSize/3)) + random(5));
        if(percipX[i] == percipX2[i]){
          percipX[i] = percipX[i] + 30;
        }
        else if(percipX[i] > percipX2[i]){
          percipX[i] = percipX[i] - 60;
        }
        else{
          percipX[i] = percipX[i] + 60;
        }
        if(percipY[i] >= (height-(height/16))){
          percipY[i] = percipStart;
          percipX[i] = percipX2[i];
        }
      }
    }
    else{
      for(int i = 0; i < 10; i++){//this will create update and display rain so it falls
        Percipitation rain = new Percipitation();
        rain.display(0,0,128,percipX[i],percipY[i]);
        percipY[i] = (percipY[i] + (((height-percipStart)/60)+listSize) + random(20));
        if(percipY[i] >= (height-(height/16))){
          percipY[i] = percipStart;
        }
      }
    }
    
    fill(fillColor);//this is the clous itself
    noStroke();
    ellipse(centerX,centerY,300,250);
    ellipse(centerX-125,centerY,150,175);
    ellipse(centerX+125,centerY,150,175);
    
    fill(255,snowAlpha);// this is used for the snow on the ground
    rect(width/2,(height-((height/16))),width,2*(height/16)+snowHeight);
    if(seasonWinter == true){// this is used for the growth of the snow effected by number of clouds
      snowAlpha += listSize;
      if(snowAlpha >= 255){
        snowHeight += ((listSize/30)*3);
      }
    }
    else{
      snowHeight -= ((listSize/30)*5) + 1;//this is used to get rid of snow effected by amount of clouds
      if(snowHeight <= 0){
        snowAlpha -= (listSize + 1);
      }
    }
    if(snowAlpha > 255){
      snowAlpha = 255;
    }
    if(snowAlpha < 0){
      snowAlpha = 0;
    }
    if(snowHeight > 350){
      snowHeight = 350;
    }
    if(snowHeight < 0){
      snowHeight = 0;
    }
  }
}
