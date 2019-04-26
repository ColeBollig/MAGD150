import processing.video.*;
import processing.sound.*;

Boolean start = true;
Boolean trolled = false;
PFont font;
PImage background;
PImage before;
PImage birth;
PImage now;
Movie rickRoll;
SoundFile startUp;


void setup(){
  size(1280,800);
  font = createFont("CHECKBK0.TTF",50);
  textFont(font);
  textSize(50);
  textAlign(CENTER,CENTER);
  background = loadImage("internet.jpg");
  before = loadImage("before.jpg");
  birth = loadImage("birth.jpg");
  now = loadImage("social-media.jpg");
  rickRoll = new Movie(this,"Rick Astley - Never Gonna Give You Up (Official Music Video).mp4");
  startUp = new SoundFile(this,"Microsoft Windows XP Startup Sound.mp3");
  startUp.rate(.5);//slow down of windows xp startup... sounds nice actually
}

void draw(){
  //this checks to see if it is the first run of the draw so the sound plays once and then again after rick rolled
  if(start){
    startUp.play();
    start = false;
  }
  image(background,0,0,1280,800);
  text("The Internet",width/2,30);
  //if user clicks mouse then user gets rick rolled
  if(trolled){
    rickRoll.play();
    text("RICK",width/6,height/2);
    text("ROLLED",5*(width/6),height/2);
    image(rickRoll,1280/4,200,1280/2,400);
    //once video is done it resets program for another troll
    if(rickRoll.time() == rickRoll.duration()){
      rickRoll.pause();
      rickRoll.jump(0);
      trolled = false;
      start = true;
    }
  }
  else{
    //until mouse click images and prompts will apear for a documentary of the internet
    text("Click Images To Learn More",width/2,height-200);
    image(before,width/4-80,height/3,200,150);
    text("Before",width/4+25,height/3-50);
    image(birth,width/2-80,height/3,200,150);
    text("Begining",width/2+25,height/3-50);
    image(now,3*(width/4)-80,height/3,200,150);
    text("Now",3*(width/4)+25,height/3-50);
    //this is a blue overlay tint on the photos to help fit in with background image
    tint(0,0,255,50);
    image(before,width/4-80,height/3,200,150);
    image(birth,width/2-80,height/3,200,150);
    image(now,3*(width/4)-80,height/3,200,150);
    noTint();
  }
}

//when mouse is clicked by user in general rather than more information it trolls via rick roll
void mousePressed(){
  trolled = true;
}

//used to update movie
void movieEvent(Movie m){
  m.read();
}
