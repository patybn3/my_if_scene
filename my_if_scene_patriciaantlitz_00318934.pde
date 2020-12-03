/* Assignment number 7
Using Conditionals and Boolean Expressions

00318934
Patricia Antlitz
Professor Ethel Schuster
CIS-140

7-2 Write a program to draw a scene. It must do the following:
a- If the user presses the ‘r’, change the background to red, and draws a 
character of your choice
b- If the user presses the ‘g’, change the background to green, and draws a 
set of yellow rectangles
c- If the user presses the ‘b’, change the background to blue and draws a 
collection of clouds
d- If the user presses the ‘c’ and clicks the mouse on the top right of the 
screen, it draws a set of clouds
e- If the user presses the ‘v’ and clicks the mouse on the bottom right of 
the screen, it draws a car or a house
f- If the user presses the ‘z’ and clicks the mouse in the middle of the 
screen, it draws a complete scene with a car or a house, clouds, sun, etc.

I have used other sources, as detailed in my submitted source file.
https://processing.org/reference/keyTyped_.html
https://forum.processing.org/two/discussion/17094/how-to-make-a-circle-to-square-pattern-or-shape-to-another-shape-pattern
https://processing.org/reference/sin_.html
https://processing.org/reference/radians_.html
https://processing.org/reference/cos_.html
https://processing.org/reference/mousePressed_.html
https://stackoverflow.com/questions/31381744/processing-how-to-write-on-mouse-click-in-region-for-effect-of-clicking-a-b


*/

// setting gloabal variables for colors used
int green = color(0, 100, 0);
int lightGreen = color(157, 252, 136);
int white = color(255);
int gray = color(240);
int brown = color(112, 73, 0);
int red = color(150, 0, 0);
int yellow = color(240, 200, 0);
int blue = color(181, 234, 255);

// Function setup holds the screen size
void setup(){
  size(500, 500);
}

// setting global variables of type boolean for function mousePressed
// variable mouseLeft for when clicking on the top left of the screen
boolean mouseLeft = false;
// variable house to show the house at click
boolean house = false;
// variable landScape to show everything
boolean landScape = false;

// Function mousePressed holds commands to run when mouse is pressed
void mousePressed(){
  /* first statement = setup for when clicking the top left of the screen
  checked if mouse when related to the x axis is less or equal to half of
  the width of the page and when related to the y axis is equal or less to
  half of the height. */
  if(mouseX <= width/2 && mouseY <= height/2){
    // sets variable mouseLeft that was false to true
  mouseLeft = true;
  } /* sec. statement = setup for when clicking the bottom right of the 
  screen, checked if mouse when related to the x axis is greater than
  the half of the width, and when related to the y axis is greater than
  half of the height. */
  else if(mouseX > width/2 && mouseY > height/2){ 
  house = true;
  } /* Third statement = setup for when clicking the in the middle of the 
  screen, checked if mouse when related to the x axis is greater or equal than
  the a third of the width but less than the third when multiplied by 2, 
  and if it is greater or equal than a third of the height but less and
  equal than the third when multiplied by 2*/
  else if(mouseX >= width/3 && mouseX <= 2*width/3 ||
  mouseY >= height/3 && mouseY <= 2*height/3){
  landScape = true;
  }
  else {
    // if not let the variables be false like before
  mouseLeft = false;
  house = false;
  landScape = false;
  }
}

// draw Function folds the setups that makes mousePressed work
void draw(){
  /* first if statemnt calls the variable mouseLeft that once clicked will
  become true and checks if the key "c" or "C" were also clicked and 
  displays a set of clouds on the top left screen. */
  if(mouseLeft && int(key) == 99 || mouseLeft && int(key) == 67){
    /*Used function drawClouds to draw the clouds on the screen*/
   drawClouds(white, width/3, height/4, 105, 45, 100, 50, 60, 60);
  }
  
   /* sec. if statemnt calls the variable house that once clicked will
  become true and checks if the key "v" or "V" were also clicked and 
  displays a house on the bottom right screen. */
  if(house && int(key) == 118 || house && int(key) == 86){
   houseChar();
  }
  
   /* Third if statemnt calls the variable landScape that once clicked will
  become true and checks if the key "Z" or "z" were also clicked and 
  displays the whole design on the screen */
  if(landScape && int(key) == 122 || landScape && int(key) == 90){
    // calls all the functions that make the design
   setBack(blue);
   clouds();
   myChar();
   houseChar();
  }
}

/* Function setBack sets the background color of the screen. Function allow
for the color to be changed every time it is called*/
void setBack(int c){
  background(c);
}

/* Function drawCircle draws all the circles on the screen, it calls for
a param c of type integer for the color, floats x and y for the position
of x and y on the screen and integers w and t for the width and height
of the circles*/
void drawCircle(int c, float x, float y, int w, int t){
  // fill the circle with selected color using param c
  fill(c);
  // calls the remaining params
  ellipse(x, y, w, t);
}

// Function draw rectangle draws all reactangles in this program
void drawRect(int c, int x, int y, int w, int t){
  fill(c);
  rect(x, y, w, t);
}

/* Function houseChar draws the house character on the scree, it does not
pass any parameters because it contain multiple different shapes and, it
uses other functions to draw most. */
void houseChar(){
  // calls function drawRect to draw a couple of rectangles on the screen
  // First is a square that makes the outside of the house
  drawRect(yellow, 300, 300, 100, 100);
  // color red fills the shape triangle for the roof
  fill(red);
  triangle(290, 300, 350, 250, 410, 300);
  // door
  drawRect(brown, 340, 350, 20, 50);
  //left window
  drawRect(blue, 310, 320, 20, 20);
  //right window
  drawRect(blue, 370, 320, 20, 20);
}

/* This function draws the apples on the tree from function myChar. It takes
param rad that represents the inner radius of the circle (tree), parqam
iloc that represents the value of i to be used on the for loop and param
space that represents what will be add to i on the loop*/
void apples(int rad, int iloc, int space){
  // local variables set position of x and y
  int xCen = 100;
  int yCen = 250;
  // variable innerR represents the inner radius
  int innerR = rad;
  // for loop will loop around the circle
  for(int i = iloc; i < 360; i+=space){
    /* float x and y will take the position of x and y given at params 
    xCen and yCen and will add it to the cosine or sine of an angle, multiply it
    by the conversion of the degree measurement to its corresponding value
    in radians and i and add it to the inner radius of the circle*/
    float x = xCen + ( cos(radians(i)) * innerR );
    float y = yCen + ( sin(radians(i)) * innerR );
    // calls function drawCircle to draw multiple circles
    drawCircle(red, x, y, 20, 20);
  }
}

/* Function myChar draws my character on the screen, it passes no params
because it used other functions to draw the scene*/
void myChar(){
  stroke(0);
  drawRect(green, 0, 400, width, 400);
  drawRect(brown, 90, 300, 20, 110);
  drawCircle(green, 100, 250, 200, 200);
  drawCircle(yellow, 430, 80, 70, 70);
  apples(80, 0, 40);
  apples(55, 40, 60);
  apples(30, 0, 90);
}

/* function drawClouds creates a pattern of ellipses on the screen 
it takes param c for coloer, int wide and tall are used on the for loop
to calculate until where to loop, xloc and yloc are the value of numX and
numY on the loop, params w and t are the width and height of the ellipses,
and params xSpace and ySpace are the sparation between them.*/
void drawClouds(int c, int wide, int tall, int xloc, int yloc, int w, int t,
int xSpace, int ySpace){

  // removed border from shapes
  noStroke();
  /* for loop will loop over a given initial number called numX to be set once
  this function is called using xloc, until variable wide is reached and
  add a given number to numX */
  for(int numX = xloc; numX <= wide; numX+=xSpace){
    for(int numY = yloc; numY <= tall; numY+=ySpace){
      // uses Function drawCircle to draw ellipses
      drawCircle(c, numX, numY, w, t);
    }
  }
}

/* this Function calls the previous one, drawClouds and put it in one so
it is easier to call it later*/
void clouds(){
  drawClouds(gray, width/3, height/3, 90, 50, 100, 50, 60, 60);
  drawClouds(gray, 13*width/16, height/4, 300, 60, 100, 60, 80, 80);
  drawClouds(gray, width, height/2, 80, 190, 130, 60, 150, 100);
}

// Function keyTyped will look for specific key pressed on the keyboard
void keyTyped() {

  // if key "r" or "R" is clicked
    if(int(key) == 114 || int(key) == 82) {
      // maked the background red
    setBack(red);
    // and draw my character
    myChar();
    
    } // if key "g" or "G" is clicked
    else if(int(key) == 103 || int(key) == 71) {
      // set the background to green
    setBack(lightGreen);
    // draw two yellow rectangles
    drawRect(yellow, 0, 0, width, height/3);
    drawRect(yellow, 0, 2*height/3, width, height/3);
    
    } // if key "b" or "B" is clicked
    else if(int(key) == 98 || int(key) == 66) {
      // set the background to blue
    setBack(blue);
    // add some clouds to the screen
    clouds();
    } 
}

//end.
