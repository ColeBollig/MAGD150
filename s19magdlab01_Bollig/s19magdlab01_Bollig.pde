//Set up base background
size(601,399);
background(0);

//set up an overlaying background fade for more detail.
noStroke();
fill(100,40);
rect(0,79,601,319);
fill(100,80);
rect(0,159,601,250);
fill(100,120);
rect(0,239,601,150);
fill(100,160);
rect(0,319,601,100);

//make black landscape
fill(0,255);
ellipseMode(CENTER);
ellipse(300,379,700,85);

//make black city scape to be part of landscape
rectMode(CORNER);
rect(375,320,44,20);
rect(419,300,22,40);
rect(441,310,22,35);
rect(463,320,44,25);
rect(507,280,22,70);
rect(529,300,44,55);
rect(573,320,44,40);
fill(100,200);
stroke(125);
strokeWeight(1);
rect(510,283,3,5);

//Observatory telescope
fill(0,255);
stroke(255);
strokeWeight(30);
line(50,239,170,159);
strokeCap(SQUARE);
stroke(0);
strokeWeight(27);
line(50,239,170,159);
strokeCap(ROUND);
ellipseMode(CENTER);
ellipse(170,159,1,1);

//Front observatory
strokeWeight(2);
stroke(255);

ellipseMode(CENTER);
ellipse(50,239,200,200);

//Observatory details
noFill();
ellipse(50,239,150,200);
ellipse(50,239,100,200);
ellipse(50,239,50,200);
ellipse(50,239,200,150);
ellipse(50,239,200,100);
ellipse(50,239,200,50);
ellipse(50,239,200,1);

fill(0);
rectMode(CENTER);
rect(50,359,180,120);
triangle(141,349,141,398,220,398);

//Moon
noStroke();
fill(200,50);
ellipse(550,50,100,100);
fill(210,100);
rect(550,50,80,80,20,20,20,20);
fill(220,150);
ellipse(560,40,60,60);
fill(230,160);
rect(570,30,40,40,15,15,15,15);
fill(255,255);
ellipse(575,25,20,20);

//Stars
stroke(255);
fill(255,255);
ellipse(3,3,5,5);//these comment slashes are markers for me to know what I've copied
ellipse(59,33,5,5);//
ellipse(25,78,5,5);//
ellipse(98,15,5,5);//
ellipse(163,103,5,5);//
ellipse(177,47,5,5);//
ellipse(210,18,5,5);//
ellipse(249,82,5,5);//
ellipse(289,29,5,5);//
ellipse(337,118,5,5);//
ellipse(376,63,5,5);//
ellipse(402,23,5,5);//
ellipse(438,77,5,5);//
ellipse(501,93,5,5);//
ellipse(587,131,5,5);//
ellipse(439,174,5,5);//

strokeWeight(1);
noFill();
ellipse(3,3,1,20);
ellipse(3,3,20,1);

ellipse(59,33,1,23);
ellipse(59,33,23,1);

ellipse(25,78,1,17);
ellipse(25,78,17,1);

ellipse(98,15,1,20);
ellipse(98,15,20,1);

ellipse(163,103,1,28);
ellipse(163,103,28,1);

ellipse(177,47,1,11);
ellipse(177,47,11,1);

ellipse(210,18,1,26);
ellipse(210,18,26,1);

ellipse(249,82,1,19);
ellipse(249,82,19,1);

ellipse(289,29,1,33);
ellipse(289,29,33,1);

ellipse(337,118,1,23);
ellipse(337,118,23,1);

ellipse(376,63,1,13);
ellipse(376,63,13,1);

ellipse(402,23,1,24);
ellipse(402,23,24,1);

ellipse(438,77,1,16);
ellipse(438,77,16,1);

ellipse(501,93,1,20);
ellipse(501,93,20,1);

ellipse(587,131,1,36);
ellipse(587,131,36,1);

ellipse(439,174,1,24);
ellipse(439,174,24,1);

//Alien from invader zim
stroke(150);
strokeWeight(1);
fill(0);
ellipse(290,335,7,22);
ellipse(310,335,7,22);
stroke(0);
strokeWeight(3);
fill(150,255);
rect(300,300,40,60,15,15,15,15);
rect(300,250,60,60,15,15,15,15);
noStroke();
rect(300,300,37,57,15,15,15,15);
fill(0);
rect(280,205,7,30);
rect(320,205,7,30);
ellipse(275,250,30,30);
ellipse(325,250,30,30);
fill(255);
ellipse(275,250,26,26);
ellipse(325,250,26,26);
fill(0);
ellipse(270,257,5,5);
ellipse(330,257,5,5);
fill(100);
stroke(0);
strokeWeight(1);
rect(300,270,10,10);
strokeWeight(2);
line(300,220,300,225);
line(300,229,300,234);
line(300,238,300,243);
line(300,247,300,252);
line(300,256,300,261);
line(293,265,307,265);
line(300,265,300,269);
line(298,261,302,261);
noStroke();
fill(0);
ellipse(290,300,7,22);
ellipse(310,300,7,22);
