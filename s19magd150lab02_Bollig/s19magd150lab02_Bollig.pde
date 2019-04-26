//set up background
size(600,600);
background(255);

//balloon hook
fill(#0a0a0a);
beginShape();
vertex(285,600);
vertex(285,570);
vertex(315,570);
vertex(315,580);
vertex(305,580);
vertex(305,575);
vertex(295,575);
vertex(295,600);
endShape(CLOSE);

//balloons

//red balloon
fill(255,0,0,255);
triangle(70,330,230,330,150,420);
arc(150,270,200,200,HALF_PI+QUARTER_PI,TWO_PI+QUARTER_PI,OPEN);
triangle(150,420,170,440,130,440);
//string
stroke(#2a52be);
strokeWeight(5);
line(150,420,300,573);
stroke(0);
strokeWeight(1);

//green balloon
fill(0,255,0,255);
triangle(235,200,395,200,315,290);
arc(315,140,200,200,HALF_PI+QUARTER_PI,TWO_PI+QUARTER_PI,OPEN);
triangle(315,290,335,310,295,310);
//string
stroke(#7851a9);
strokeWeight(5);
line(315,290,300,573);
stroke(0);
strokeWeight(1);

//blue balloon
fill(0,0,255,255);
triangle(380,370,540,370,460,460);
arc(460,310,200,200,HALF_PI+QUARTER_PI,TWO_PI+QUARTER_PI,OPEN);
triangle(460,460,440,480,480,480);
//string
colorMode(HSB);
stroke(59,89,100);
strokeWeight(5);
line(460,460,300,573);
