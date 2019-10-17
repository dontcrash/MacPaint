//"Drawable" canvas dimensions, starting from 0,0
//Will need to be changed to the actual drawing area
//We can create a helper function isMouseInCanvas or something of the sorts too
//TODO make sure these four dimensions are correct
int canvas_x = 10;
int canvas_y = 10;
int canvas_width = 700;
int canvas_height = 700;

//The current colour, stored in an object for ease of use
//You can access the current colour by calling current_colour.r or .g .b etc
Colour current_colour = new Colour();

//Array of shapes, stored this way to make the eraser work well
ArrayList<Object> shapes = new ArrayList<Object>();

//Background image object
PImage bg;

//Tool integer to keep track of what is selected
int tool = 0;

//Boolean used to set if "debug" mode is on or off
//Only used to test functions etc
boolean debug_mode = false;

/*
  
 Shapes available:
 nRect(x, y, w, h) - rectangle
 nCircle(x, y, d)  - circle
 
 Functions available:
 stressTest(n) - stress tests the code by adding lots of shapes, n = shape count
 
 Tool integers:
 0 - erase mode
 1 - 
 2 - 
 3 - 
 4 - 
 5 - 
 6 - 
 
 */

void setup() {
  size(1000, 700);
  frameRate(30);
  noStroke();
  //TODO add the colour gradient to bottom right of screen
  //TODO set the inside of the "canvas" area to transparent
  //We will draw the canvas layer on top of the shapes
  //This will ensure shapes aren't drawn on top of our application GUI
  bg = loadImage("Resources/background.png");
  if (debug_mode) stressTest(500);
}

void draw() {
  background(255);
  for (Object s : shapes) {
    if (s instanceof Rectangle) {
      Rectangle r = (Rectangle)s;
      r.draw();
    }
    if (s instanceof Circle) {
      Circle c = (Circle)s;
      c.draw();
    }
  }
  fill(0);
  image(bg, 0, 0, width, height);
  if (debug_mode) text("Shapes: " + shapes.size() + " - FPS: " + int(frameRate), 20, 30);
}

//Show preview of a shape here if conditions are met
void mouseDragged() {
  //TODO make use of mouseDragged - NG
  //I will probably code this logic in, as it's somewhat complicated
}

//Check for tool clicks and canvas clicks
void mouseClicked() {
  //The following lines simply check if the user selects a "button"
  //This will return and do nothing if the user is simply clicking a tool
  if (checkForTools()) return;
  //If the user didn't click on a new tool icon, check if the mouse on canvas
  if (!mouseIsOnCanvas()) return;
  //If the user selected a new colour
  if (checkForColourChange()) return;
  //TODO add if statements for each tool type
  //If the tool is ....
  if (tool == 0) {
    removeShapeByMouse();
  }
  //If the tool is ....
  if (tool == 1) {
    //Something here
  }
}

//Checks if the mouse is released
//This is used to actually commit a shape to the shapes array
void mouseReleased(){
  //TODO this - NG
}

//Checks if the mouse is held down
//Then in mouseDragged we will show previews of shapes
void mousePressed(){
  //TODO this - NG
}
