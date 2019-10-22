//"Drawable" canvas dimensions, used in helper functions
int canvas_x = 40;
int canvas_y = 34;
int canvas_width = 729;
int canvas_height = 502;

//Store variables to detect Command + Z
boolean command_down = false;
boolean z_down = false;

//The current colour, stored in an object for ease of use
//You can access the current colour by calling current_colour.r or .g .b etc
color current_colour = color(0, 0, 0);

//Used for "undo"
ArrayList<Object> old_shapes = new ArrayList<Object>();

//Array of shapes, stored this way to make the eraser work well
ArrayList<Object> shapes = new ArrayList<Object>();

//Background image object
PImage bg;
PImage colourmap;

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
  ellipseMode(CORNER);
  //TODO check if we need to increase the frameRate later on
  frameRate(60);
  noStroke();
  //TODO add the colour gradient to bottom right of screen
  //TODO set the inside of the "canvas" area to transparent
  //We will draw the canvas layer on top of the shapes
  //This will ensure shapes aren't drawn on top of our application GUI
  bg = loadImage("Resources/background.png");
  colourmap = loadImage("Resources/colourmap.png");
  if (debug_mode) stressTest(10);
  nEllipse(200, 200, 1, 100);
  tool = 2;
}

void draw() {
  background(255);
  //println(mouseX + " - " + mouseY);
  for (Object s : shapes) {
    if (s instanceof Rectangle) {
      Rectangle r = (Rectangle)s;
      r.draw();
    }
    if (s instanceof Ellipse) {
      Ellipse c = (Ellipse)s;
      c.draw();
    }
  }
  fill(0);
  if (debug_mode) {
    fill(current_colour);
    rect(0, 0, 10, 10);
  }
  if (dragging) {
    fill(current_colour);
    if (tool == 5) {
      rect(drag_x, drag_y, mouseX - drag_x, mouseY - drag_y);
    }
    if (tool == 3) {
      ellipse(drag_x, drag_y, mouseX - drag_x, mouseY - drag_y);
    }
  }
  image(bg, 0, 0, width, height);
  if (debug_mode) text("Shapes: " + shapes.size() + " - FPS: " + int(frameRate), 25, 30);
  stroke(0);
  fill(0, 0, 0, 0);
  //Highlight selected tool
  if (tool == 1) {
    rect(838, 51, 100, 100);
  }
  if (tool == 2) {
    rect(836, 193, 100, 80);
  }
  if (tool == 3) {
    rect(838, 317, 40, 40);
  } 
  if (tool == 4) {
    rect(889, 317, 40, 40);
  } 
  if (tool == 5) {
    rect(858, 358, 40, 35);
  } 
  if (tool == 6) {
    rect(837, 442, 80, 80);
  }
  image(colourmap, 820, 560, 140, 120);
  noStroke();
  //TODO add current colour selection preview somewhere
}

//Show preview of a shape here if conditions are met
void mouseDragged() {
  //Eraser
  if (tool == 2) {
    removeShapeByMouse();
  }
  //TODO add colour picker here
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
    if (tool == 3) {
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
  int mx = mouseX;
  int my = mouseY;
  if (dragging) {
    //Swap positions if negative values
    if (mx < drag_x) {
      mx = drag_x;
      drag_x = mouseX;
    }
    if (my < drag_y) {
      my = drag_y;
      drag_y = mouseY;
    }
    //Rect
    if (tool == 5) {
      nRect(drag_x, drag_y, mx - drag_x, my - drag_y);
    }
    //Circle
    if (tool == 3) {
      nEllipse(drag_x, drag_y, mx - drag_x, my - drag_y);
    }
    dragging = false;
  }
}

void keyPressed() { 
  if (key == 122) {
    z_down = true;
  }
  if (key == 65535) {
    command_down = true;
  }
  //Command + Z (undo)
  if (command_down && z_down) {
    command_down = false;
    z_down = false;
    shapes = (ArrayList)old_shapes.clone();
  }
}

void keyReleased() {  
  if (key == 122) {
    z_down = false;
  }
  if (key == 65535) {
    command_down = false;
  }
}
