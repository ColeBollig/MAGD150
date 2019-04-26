int channelNum = 2;
int counter = 0;
float buttonX;
float buttonY;
float circRadius;
boolean inCirc = false, inRect = false;

int directionX = 1, directionY = -1;
int circCenterX = (90*(width/16)),circCenterY = (60*(height/16));

int m = month(), d = day(),y = year(),h = hour(), n = minute();
int textY = (2*(height/16));
int textOther = 0;
String[] emergency = {"This is an","emergency broadcast.","As of today",m+"/"+d+"/"+y,
                      "At "+h+":"+n,"The world has","been blanketed","in snow."};




void setup(){
  surface.setResizable(true);
  size(1280,800);
  background(0);
  rectMode(CORNER);
  ellipseMode(CENTER);
  textAlign(CENTER);
  textSize(32);
  
}

void draw(){
  clear();
  background(0);
  TV();
  buttons();
  if(channelNum%2 == 0){
    staticTV();
    channel(channelNum,false);
  }
  else{
    channel(channelNum,true);
  }
  TVDetail();
}

void TV(){
  fill(#712c1c);
  rect(0,0,width,height);
  fill(0);
  rect(0+(width/16),0+(height/16),width-(2*(width/16)),height-(2*(height/16)));
  fill(255);
  rect(0+(2*(width/16)),0+(2*(height/16)),width-(6*(width/16)),height-(4*(height/16)));
}

void TVDetail(){
  noFill();
  strokeWeight(30);
  stroke(#c0c0c0);
  rect(0+(2*(width/16)),0+(2*(height/16)),width-(6*(width/16)),height-(4*(height/16)));
  stroke(0);
  strokeWeight(1);
}

void staticTV(){
  
  for(int i = 1; i < 15; i++){
    strokeWeight(10);
    line((2*(width/16)),(i*((height*10)/176)+(height/16)+(counter*((height*10)/176)/40))-(height/32),
    (12*(width/16)),(i*((height*10)/176)+(height/16)+(counter*((height*10)/176)/40))-(height/32));
  }
  counter++;
  if(counter > 80){
    counter = 0;
  }
}

void channel(int channelNumber,boolean watchTV){
  if(watchTV == true){
    if(channelNumber == 1){
      fill(140,0,230);
      noStroke();
      ellipse(circCenterX,circCenterY,(height/16),(height/16));
    }
    if(channelNumber == 3){
      for(int i = 0; i < emergency.length;i++){
        fill(255,0,0,255);
        textOther = (textY - (i*(height/16)));
        if(i == 0){
          if(textY > (3*(height/16)) && textY < (14*(height/16))){
            text(emergency[i],(7*(width/16)),textY);
          }
        }
        else{
          if(textOther > (3*(height/16)) && textOther < (14*(height/16))){
           text(emergency[i],(7*(width/16)),textOther);
          }
        }
      }
    }
  }
  textY = (textY + ((height/16)/30));
  if(textOther >= (14*(height/16))){
    textY = (2*(height/16));
  }
  if((circCenterX - (height/16)) < (2*(width/16)) || (circCenterX + (height/16)) > (12*(width/16))){
    directionX *= -1;
  }
  if((circCenterY - (height/16)) < (2*(height/16)) ||(circCenterY + (height/16)) > (14*(height/16))){
    directionY *= -1;
  }
  circCenterX += (directionX * ((height/16)/20));
  circCenterY += (directionY * ((height/16)/20));
}

void buttons(){
  fill(#c0c0c0);
  rect((12*(width/16))+(width/32),(2*(height/16)),(2*(width/16)),(12*(height/16)));
  
  fill(0);
  rectMode(CENTER);
  rect((12*(width/16))+(width/32)+((2*(width/16))/2),(10*(height/16)),(2*(width/32)),(3*(height/16)));
  rectMode(CORNER);
  ellipse((12*(width/16))+(width/32)+((2*(width/16))/2),(5*(height/16)),(2*(width/32)),(2*(width/32)));
  fill(255);
  text("Up",(12*(width/16))+(width/32)+((2*(width/16))/2),(4*(height/16)));
  text("Down",(12*(width/16))+(width/32)+((2*(width/16))/2),(8*(height/16)));
  buttonX = (12*(width/16))+(width/32)+((2*(width/16))/2);
  buttonY = (5*(height/16));
  circRadius = (2*(width/32));
  inCirc = circleCheck(buttonX,buttonY,circRadius);
  inRect = checkRectangle();
}

boolean circleCheck(float x, float y,float diameter){
  float checkX = (mouseX - x);
  float checkY = (mouseY - y);
  if((sqrt(sq(checkX)+sq(checkY)) < (diameter/2))){
    noFill();
    stroke(255,255,255);
    strokeWeight(5);
    ellipse((12*(width/16))+(width/32)+((2*(width/16))/2),(5*(height/16)),(2*(width/32)),(2*(width/32)));
    noStroke();
    stroke(0);
    return true;
  }
  else{
    return false;
  }
}

boolean checkRectangle(){
  if((mouseX >= ((12*(width/16))+(width/32)+((2*(width/16))/2)-(width/32)) && mouseX <= ((12*(width/16))+(width/32)+((2*(width/16))/2)+(width/32)) 
  && (mouseY >= ((10*(height/16))-((3*(height/16))/2)) && mouseY <= ((10*(height/16))+((3*(height/16))/2))))){
    noFill();
    stroke(255,255,255);
    strokeWeight(5);
    rectMode(CENTER);
    rect((12*(width/16))+(width/32)+((2*(width/16))/2),(10*(height/16)),(2*(width/32)),(3*(height/16)));
    rectMode(CORNER);
    noStroke();
    stroke(0);
    return true;
  }
  else{
    return false;
  }
}

void mousePressed(){
  if(inCirc == true){
    channelNum++;
    if(channelNum > 4){
      channelNum = 1;
    }
  }
  if(inRect == true){
    channelNum--;
    if(channelNum < 1){
      channelNum = 4;
    }
  }
}
