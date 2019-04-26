//Initialize the begining radius' of the circles
float cirRadius = 1.0;
float cirRadius2 = 1.0;
float cirRadius3 = 1.0;
float cirRadius4 = 1.0;
//reset arguments used later to make sure all circles don't disappear at once
boolean reset = false;
boolean reset2 = false;
boolean reset3 = false;
//Initialization for centers of circles
int x1 = 640,x2 = 640,x3 = 640,x4 = 640,y1 = 400,y2 = 400,y3 = 400,y4 = 400;
//Initialization on how large the circle can grow
int radiusMax = 1500, radiusMax2 = 1500, radiusMax3 = 1500, radiusMax4 = 1500;

void setup(){
  size(1280,800);
  background(0);
  
}


void draw(){
    if(frameCount % 60 == 0){
      println((frameCount / 60) + " seconds have passed.");
    }
   //base setup and reset
   stroke(255);
   ellipseMode(CENTER);
   noFill();
   clear();
   
   //gives trippy color change
   stroke(int(random(256)),int(random(256)),int(random(256)));
   
   
   ellipse(x1,y1,cirRadius,cirRadius);//first circle creation
   
   if(cirRadius > 800 || reset == true){//conditional to create and keep second circle
     ellipse(x2,y2,cirRadius2,cirRadius2);//second circle
     
     if(cirRadius2 > 800 || reset2 == true){//conditional to create and keep third circle
       ellipse(x3,y3,cirRadius3,cirRadius3);//third circle
       
       if(cirRadius3 > 800 || reset3 == true){//conditional to create and keep last circle
         ellipse(x4,y4,cirRadius4,cirRadius4);//last circle creation
         
         if(cirRadius4 <= radiusMax4){//conditional to grow last circle
           radiusMax4 = (width+ 220 + abs(640 - x4));//sets how much the circle can grow
           cirRadius4 += 5.0;//increase radius
         }
         else{//resets last circle
           cirRadius4 = 1.0;
           x4 = mouseX;
           y4 = mouseY;
           println("Cricle #4 center: "+x4+","+y4);
           reset3 = false;
         }
       }
       
       if(cirRadius3 <= radiusMax3){//conditional to grow third circle
         radiusMax3 = (1500 + abs(640 - x3));//set how much circle can grow
         cirRadius3 += 5.0;
       }
       else{//reset circle
         cirRadius3 = 1.0;
         x3 = mouseX;
         y3 = mouseY;
         println("Cricle #3 center: "+x3+","+y3);
         reset2 = false;
         reset3 = true;
       }
     }
     
     if(cirRadius2 <= radiusMax2){//conditional to grow second circle
       //use of max function
       radiusMax2 = max(0,1500 + abs(640 - x1));//set how much second circle can grow
       cirRadius2 += 5.0;
     }
     else{//reset circle
       cirRadius2 = 1.0;
       x2 = mouseX;
       y2 = mouseY;
       println("Cricle #2 center: "+x2+","+y2);
       reset = false;
       reset2 = true;
     }
   }
   
   if(cirRadius <= radiusMax){//conditional to grow first circle
     //use of min function
     radiusMax = min(100000000,1500 + abs(640 - x1));//set how much circle can grow
     cirRadius += 5.0;
   }
   else{//reset first circle
     cirRadius = 1.0;
     x1 = mouseX;
     y1 = mouseY;
     println("Cricle #1 center: "+x1+","+y1);
     reset = true;
   }
}
