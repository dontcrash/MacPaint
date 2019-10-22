//"Drawable" canvas dimensions, used in helper functions
int canvas_x = 40;
int canvas_y = 34;
int canvas_width = 729;
int canvas_height = 502;

//The current colour, stored in an object for ease of use
//You can access the current colour by calling current_colour.r or .g .b etc
color current_colour = color(0, 0, 0);

//Array of shapes, stored this way to make the eraser work well
ArrayList<Object> shapes = new ArrayList<Object>();

//Background image object
PImage bg;

//Tool integer to keep track of what is selected
int tool = 0;

//Boolean used to set if "debug" mode is on or off
//Only used to test functions etc
boolean debug_mode = false;

//Check for mouse drag
int drag_x = 0;
int drag_y = 0;
boolean dragging = false;

/*
  
 Shapes available:
 nRect(x, y, w, h) - rectangle
 nCircle(x, y, d)  - circle
 
 Functions available:
 stressTest(n) - stress tests the code by adding lots of shapes, n = shape count
 
 Tool integers:
 1 - draw
 2 - eraser
 3 - circle
 4 - triangle
 5 - rect
 6 - line
 
 */

void setup() {
  size(1000, 700);
  //TODO check if we need to increase the frameRate later on
  frameRate(60);
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
  //println(mouseX + " - " + mouseY);
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
  if (debug_mode) {
    fill(current_colour);
    rect(0, 0, 10, 10);
  }
  if (dragging) {
    if (mouseX > drag_x && mouseY > drag_y) {
      fill(current_colour);
      rect(drag_x, drag_y, mouseX - drag_x, mouseY - drag_y);
    }
  }
  if (debug_mode) text("Shapes: " + shapes.size() + " - FPS: " + int(frameRate), 25, 30);
  stroke(0);
  fill(0, 0, 0, 0);
  //Highlight selected tool
  if (tool == 1) {
    rect(838, 51, 100, 100);
  }
  if (tool == 2) {
    rect(838, 180, 100, 100);
  }
  noStroke();
}

//Show preview of a shape here if conditions are met
void mouseDragged() {
  //Eraser
  if (tool == 2) {
    removeShapeByMouse();
  }
}

//Checks if the mouse is held down
//Then in mouseDragged we will show previews of shapes
void mousePressed() {
  if (mouseIsOnCanvas()) {
    //Eraser
    if (tool == 2) {
      removeShapeByMouse();
    }
    //Rect tool
    if (tool == 5) {
      dragging = true;
      drag_x = mouseX;
      drag_y = mouseY;
    }
    //If the tool is ....
    if (tool == 1) {
      //Something here
    }
  } else {
    //The following lines simply check if the user selects a "button"
    //This will return and do nothing if the user is simply clicking a tool
    if (checkForTools()) return;
    //If the user selected a new colour
    if (checkForColourChange()) return;
  }
}

//Checks if the mouse is released
//This is used to actually commit a shape to the shapes array
void mouseReleased() {
  //Rect tool
  if (tool == 5) {
    if (dragging) {
      //commit shape
      if (mouseX > drag_x && mouseY > drag_y) {
        nRect(drag_x, drag_y, mouseX - drag_x, mouseY - drag_y);
      }
      dragging = false;
    }
  }
}
