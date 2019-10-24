//"Drawable" canvas dimensions, used in helper functions
int canvas_x = 40;
int canvas_y = 33;
int canvas_width = 729;
int canvas_height = 502;

import java.awt.Menu;
import java.awt.*;

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

//Defines the colour picker preview
int colour_picker_alpha = 0;
int colour_picker_frame = 0;

/*
  
 Shapes available:
 nRect(x, y, w, h) - rectangle
 nCircle(x, y, d)  - circle
 nLine(x1, y1, x2, y2) - line
 
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
  frameRate(24);
  strokeWeight(5);
  //We will draw the canvas layer on top of the shapes
  //This will ensure shapes aren't drawn on top of our application GUI
  bg = loadImage("Resources/background.png");
  colourmap = loadImage("Resources/colourmap.png");
  if (debug_mode) stressTest(10);
  MenuBar mb = new MenuBar();  
  Menu fm = new Menu("File");
  mb.add(fm);
  fm.add(new RedirectingMenuItem(this,"Open"));  
  //fm.add(sl = new RedirectingMenuItem(this,"Save", new MenuShortcut( KeyEvent.VK_S )));
  this.frame.setMenuBar(mb);
}

void draw() {
  background(255);
  for (Object s : shapes) {
    if (s instanceof Rectangle) {
      Rectangle r = (Rectangle)s;
      r.draw();
    }
    if (s instanceof Ellipse) {
      Ellipse c = (Ellipse)s;
      c.draw();
    }
    if (s instanceof Line) {
      Line c = (Line)s;
      c.draw();
      noStroke();
    }
  }
  fill(0);
  if (dragging) {
    fill(current_colour);
    if (tool == 3) {
      ellipse(drag_x, drag_y, mouseX - drag_x, mouseY - drag_y);
    }
    if (tool == 5) {
      rect(drag_x, drag_y, mouseX - drag_x, mouseY - drag_y);
    }
    if(tool == 6){
      stroke(current_colour);
      line(drag_x, drag_y, mouseX, mouseY);
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
  if(colour_picker_alpha > 0){
    colour_picker_frame --;
    if(colour_picker_frame <= 0){
      colour_picker_alpha -= 20;
    }
    fill(red(current_colour), green(current_colour), blue(current_colour), colour_picker_alpha);
    rect(canvas_x, canvas_y + canvas_height - 20 + 1, canvas_width, 20);
  }
}

//Show preview of a shape here if conditions are met
void mouseDragged() {
  if (mouseIsOnCanvas()) {
    //Eraser
    if (tool == 2) {
      removeShapeByMouse();
    }
  } else {
    if (checkIfMouseClick(820, 960, 560, 680)) {
      checkForColourChange();
    }
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
    if (tool == 3) {
      dragging = true;
      drag_x = mouseX;
      drag_y = mouseY;
    }
    //Rect tool
    if (tool == 5) {
      dragging = true;
      drag_x = mouseX;
      drag_y = mouseY;
    }
    //Line tool
    if (tool == 6) {
      dragging = true;
      drag_x = mouseX;
      drag_y = mouseY;
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
    if (mx < drag_x && tool != 6) {
      mx = drag_x;
      drag_x = mouseX;
    }
    if (my < drag_y && tool != 6) {
      my = drag_y;
      drag_y = mouseY;
    }
    //Circle
    if (tool == 3) {
      nEllipse(drag_x, drag_y, mx - drag_x, my - drag_y);
    }
    //Rect
    if (tool == 5) {
      nRect(drag_x, drag_y, mx - drag_x, my - drag_y);
    }
    //Line
    if(tool == 6){
      nLine(drag_x, drag_y, mouseX, mouseY);
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


/*
Erasing of lines
Drasw tool
Triangles
*/
