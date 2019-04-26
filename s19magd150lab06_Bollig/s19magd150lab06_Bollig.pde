int updateTime = 5000;
int savedTime;
LinkedList cloudList = new LinkedList();
Boolean winter = false;
int seasonCounter = 0;


void setup(){
  size(1280,800);
  savedTime = millis();
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw(){
  clear();
  background(0,0,255);
  fill(#7cfc00);
  rect(width/2,(height-((height/16))),width,2*(height/16));
  cloudList.display();
  timer();
  if(cloudList.listSize() > 30){
    cloudList.popList();
  }
}

void timer(){//this is used to time cloud life and for season change
  int timePassed = millis() - savedTime;
  if(timePassed > updateTime){
    savedTime = millis();
    cloudList.popList();
    if(seasonCounter == 4){
      if(winter == false){
        winter = true;
      }
      else{
        winter = false;
      }
      seasonCounter = 0;
    }
    else{
      seasonCounter++;
    }
  }
}

void mousePressed(){//this is used so that when mouse is clicked a cloud will appear and be added to linked list
  int size = cloudList.listSize();
  Clouds cloud = new Clouds(random(25,175),mouseX,mouseY,winter,size);
  cloud.display();
  cloudList.appendList(cloud);
}
