//"Drawable" canvas dimensions, used in helper functions
int canvas_x = 40;
int canvas_y = 34;
int canvas_width = 729;
int canvas_height = 502;

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
boolean debug_mode = true;

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
  //TODO check if we need to increase the frameRate later on
  frameRate(20);
  noStroke();
  //TODO add the colour gradient to bottom right of screen
  //TODO set the inside of the "canvas" area to transparent
  //We will draw the canvas layer on top of the shapes
  //This will ensure shapes aren't drawn on top of our application GUI
  bg = loadImage("Resources/background.png");
  if (debug_mode) stressTest(10);
}

void draw() {
  background(255);
  //println(mouseX); 
  //println(mouseY);
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
  if (debug_mode) text("Shapes: " + shapes.size() + " - FPS: " + int(frameRate), 25, 30);
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
void mouseReleased() {
  //TODO this - NG
}

//Checks if the mouse is held down
//Then in mouseDragged we will show previews of shapes
void mousePressed() {
  //TODO this - NG
}

/* mouse coordinates for buttons 
 
 if (838 <= mouseX && mouseX <= 925 && 51 <= mouseY && mouseY <= 151){
 call draw tool;
 } else if (836 <= mouseX && mouseX <= 924 && 193 <= mouseY && mouseY <= 268){
 call eraser tool;
 } else if (838 <= mouseX && mouseX <= 873 && 317 <= mouseY && mouseY <= 347){
 call circle tool;
 } else if (885 <= mouseX && mouseX <= 928 && 312 <= mouseY && mouseY <= 356){
 call star tool;
 } else if (861 <= mouseX && mouseX <= 895 && 360 <= mouseY && mouseY <= 390){
 call rectangle tool;
 } else if (837 <= mouseX && mouseX <= 919 && 442 <= mouseY && mouseY <= 516){
 call line/stroke tool;
 } else if (64 <= mouseX && mouseX <= 146 && 577 <= mouseY && mouseY <= 656){
 call "blue" colour;
 } else if (170 <= mouseX && mouseX <= 228 && 589 <= mouseY && mouseY <= 647){
 call "green" colour;
 } else if (245 <= mouseX && mouseX <= 303 && 597 <= mouseY && mouseY <= 663){
 call "red" colour;
 } else if (324 <= mouseX && mouseX <= 393 && 591 <= mouseY && mouseY <= 648){
 call "yellow" colour;
 } else if (417 <= mouseX && mouseX <= 500 && 582 <= mouseY && mouseY <= 657){
 call "purple" colour;
 } else if (523 <= mouseX && mouseX <= 600 && 591 <= mouseY && mouseY <= 648){
 call "pink" colour;
 } else if (629 <= mouseX && mouseX <= 706 && 578 <= mouseY && mouseY <= 662){
 call "black" colour;
 } else if (713 <= mouseX && mouseX <= 764 && 593 <= mouseY && mouseY <= 656){
 call "white" colour;
 }
 */
