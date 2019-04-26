import processing.pdf.*;
PFont main;
PFont demotivation;
PFont signatureInstructions;
PFont signature;
String[] text;
String userName;
char[] name = new char[0];
boolean nameEntryCompleted = false;

void setup(){
  size(620,800);
  rectMode(CENTER);
  main = createFont("Campus A.ttf",50);
  demotivation = createFont("Marlboro.ttf",50);
  signatureInstructions = createFont("Minimal.ttf",30);
  signature = createFont("Otto.ttf",50);
  text  = loadStrings("magdlab08.txt");
  surface.setTitle(text[8]);
  beginRecord(PDF,"contract.pdf");
}

void draw(){
  background(#7851A9);
  //Main College text
  textFont(main);
  textSize(140);
  textAlign(CENTER,TOP);
  text(text[0],width/2,0);
  //De-motivational Parts
  textFont(demotivation);
  textSize(50);
  textAlign(RIGHT,TOP);
  text(text[1],3*(width/5),150);
  textAlign(CENTER,TOP);
  text(text[2],width/2,300);
  textAlign(CENTER,TOP);
  textSize(30);
  text(text[3],width/2,350);
  textSize(50);
  textAlign(LEFT,TOP);
  text(text[4],75+(width/5),450);
  //To prompt user to write their name
  textAlign(LEFT,TOP);
  textSize(50);
  textFont(signatureInstructions);
  text(text[5],0,7*(height/10));
  textAlign(CENTER);
  textSize(20);
  text(text[6],width/5,7*(height/10)+50);
  //Last text for saving pdf
  textSize(30);
  textAlign(LEFT,TOP);
  text(text[7],2*(width/5)+100,7*(height/10)+50);
  //User input To sign poster/conract
  textAlign(LEFT,CENTER);
  textSize(20);
  textFont(signature);
  text(new String(name), 10, 8*(height/10));
  saveIcon();
}


//I used lesson 8C Text Entry since it was well formed already
void keyTyped() {
  if (!nameEntryCompleted) {

    // If the user hits a carriage return...
    if (key == '\n' || key == '\r') {

      // Convert the character array to a string and assign
      // it to the user's name variable.
      userName = new String(name);
      nameEntryCompleted = true;

      // If the user hits the delete or backspace key...
    } else if (key == '\b' || int(key) == 127) {
      if (name.length > 0) {

        // Shorten the array name, provided it's greater than 0.
        name = shorten(name);
      }
    } else {

      // Take the name array, append the key entered
      // to the end and assign it to the array.
      name = append(name, key);
    }
  }
}

void mousePressed(){
  if(inRect(mouseX,mouseY)){
    endRecord();
  }
}

boolean inRect(int x, int y){
  boolean inRect = false;
  if((464 - x) <= 25){
    if((675 - y) <= 25){
      inRect = true;
    }
  }
  return inRect;
}
//floppy disk icon for saving pdf
void saveIcon(){
  fill(#00A2ED);
  rect(7*(width/10)+30,8*(height/10)+35,50,50);
  fill(255);
  rect(464,685,30,30);
  rect(464,660,30,5);
}
