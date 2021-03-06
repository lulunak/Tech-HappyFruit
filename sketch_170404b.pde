import processing.video.*;
 
Capture video; 
final int TOLERANCE = 20;
 
float XRc = 0;// XY coordinate of the center of the first target
float YRc = 0;
float XRh = 0;// XY coordinate of the center of the second target
float YRh = 0;
float XRc2 = 0; // XY coordinate of the center of the third target
float YRc2 = 0;
float XRh2 = 0;// XY coordinate of the center of the fourth target
float YRh2 = 0;

PImage orange;
PImage red;
PImage green;
PImage yellow;
 
int ii=0; //Mouse click counter
 
color trackColor; //The first color is the center of the robot 
color trackColor2; //The second color is the head of the robot
color trackColor3; //The first color is the center of the robot 2
color trackColor4; //The second color is the head of the robot 2



void setup() {
size(1280,720);
printArray(Capture.list());
video = new Capture(this,1280,720);
video.start();
 
trackColor = color(255,0,0);
trackColor2 = color(255,0,0);
trackColor3 = color(255,0,0);
trackColor4 = color(255,0,0);
smooth();

orange = loadImage("orange.png");
red = loadImage("apple.png");
green = loadImage("pear.png");
yellow = loadImage("lemon.png");
}
 
void draw() {
background(0);

if (video.available()) {
    video.read();
}
 
video.loadPixels();
image(video,0,0);
 
  float r2 = red(trackColor);
  float g2 = green(trackColor);
  float b2 = blue(trackColor);
 
  float r3 = red(trackColor2);
  float g3 = green(trackColor2);
  float b3 = blue(trackColor2);
 
  float r4 = red(trackColor3);
  float g4 = green(trackColor3);
  float b4 = blue(trackColor3);
 
  float r5 = red(trackColor4);
  float g5 = green(trackColor4);
  float b5 = blue(trackColor4);
 
  int somme_x = 0, somme_y = 0; 
  int compteur = 0;
 
  int somme_x2 = 0, somme_y2 = 0; 
  int compteur2 = 0;
 
  int somme_x3 = 0, somme_y3 = 0; 
  int compteur3 = 0;
 
  int somme_x4 = 0, somme_y4 = 0; 
  int compteur4 = 0;
 
  for(int x = 0; x < video.width; x++) {
    for(int y = 0; y < video.height; y++) {
 
      int currentLoc = x + y*video.width;
      color currentColor = video.pixels[currentLoc];
 
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
 
 
      if(dist(r1,g1,b1,r2,g2,b2) < TOLERANCE) {
         somme_x += x;
         somme_y += y;
        compteur++;
      }
 
      else if(compteur > 0) { 
        XRc = somme_x / compteur;
        YRc = somme_y / compteur;
      }
 
 
      if(dist(r1,g1,b1,r3,g3,b3) < TOLERANCE) {
         somme_x2 += x;
         somme_y2 += y;
        compteur2++;
      }
 
      else if(compteur2 > 0) { 
        XRh = somme_x2 / compteur2;
        YRh = somme_y2 / compteur2;
      }
 
      if(dist(r1,g1,b1,r4,g4,b4) < TOLERANCE) {
         somme_x3 += x;
         somme_y3 += y;
        compteur3++;
      }
 
      else if(compteur3 > 0) { 
        XRc2 = somme_x3 / compteur3;
        YRc2 = somme_y3 / compteur3;
      }
 
      if(dist(r1,g1,b1,r5,g5,b5) < TOLERANCE) {
         somme_x4 += x;
         somme_y4 += y;
        compteur4++;
      }
 
      else if(compteur4 > 0) { 
        XRh2 = somme_x4 / compteur4;
        YRh2 = somme_y4 / compteur4;
      }
     }
  }
 
 
  if(XRc != 0 || YRc != 0) { // Draw a circle at the first target
    image(orange,XRc-90.5,YRc-100, 181, 200);
  }
 
  if(XRh != 0 || YRh != 0) {// Draw a circle at the second target
    image(red,XRh-74,YRh-100, 148, 200);
  }
 
  if(XRc2 != 0 || YRc2 != 0) {// Draw a circle at the third target
    image(green,XRc2-74,YRc2-100, 148, 200);
  }
 
   if(XRh2 != 0 || YRh2 != 0) {// Draw a circle at the fourth target
    image(yellow,XRh2-60,YRh2-100, 120, 200);
  }
 
}
void mousePressed() {
  if (mousePressed && (mouseButton == RIGHT)) { // Save color where the mouse is clicked in trackColor variable  
  if(ii==0){  
 
    if (mouseY>480){mouseY=0;mouseX=0;}
  int loc = mouseX + mouseY*video.width;
 
  trackColor = video.pixels[loc];
ii=1;  
}
  else if(ii==1){  
    if (mouseY>480){mouseY=0;mouseX=0;}
  int loc2 = mouseX + mouseY*video.width;
  trackColor2 = video.pixels[loc2];
ii=2;  
}
  else if(ii==2){  
    if (mouseY>480){mouseY=0;mouseX=0;}
  int loc3 = mouseX + mouseY*video.width;
  trackColor3 = video.pixels[loc3];
ii=3;  
}
  else if(ii==3){  
    if (mouseY>480){mouseY=0;mouseX=0;}
  int loc4 = mouseX + mouseY*video.width;
  trackColor4 = video.pixels[loc4];
ii=0;  
}
 
 
  }
  }