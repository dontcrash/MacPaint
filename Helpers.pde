//Stress tested up to 20,000 shapes stored in the array
//Handled this at 22fps on my MacBook Pro
void stressTest(int n) {
  for (int i = 0; i < n; i ++) {
    current_colour.r = randomInt(0, 255);
    current_colour.g = randomInt(0, 255);
    current_colour.b = randomInt(0, 255);
    int r = randomInt(1, 3);
    int rx = randomInt(canvas_x, canvas_x + canvas_width);
    int ry = randomInt(canvas_y, canvas_y + canvas_height);
    if (r == 1) {
      nRect(rx, ry, randomInt(10, 50), randomInt(10, 50));
    }
    if (r == 2) {
      nCircle(rx, ry, randomInt(3, width/20));
    }
  }
}

public class Colour {
  public float r = 0; //red
  public float g = 0; //green
  public float b = 0; //blue
  public float a = 255; //alpha
}

void nRect(int x, int y, int w, int h) {
  addToShapes(new Rectangle(x, y, w, h, current_colour));
}

void nCircle(int x, int y, int d) {
  addToShapes(new Circle(x, y, d, current_colour));
}

void addToShapes(Shape s) {
  shapes.add(s);
}

int randomInt(int s, int e) {
  return int(random(s, e));
}

void removeShapeByMouse() {
  for (int i = shapes.size() - 1; i >= 0; i --) {
    Object s = shapes.get(i);
    if (s instanceof Rectangle) {
      if (handleRect(s)) break;
    }
    if (s instanceof Circle) {
      if (handleCircle(s)) break;
    }
  }
}

boolean handleRect(Object o) {
  Rectangle s = (Rectangle)o;
  if (mouseX >= s.getX() && mouseX <= (s.getX() + s.getW())) {
    if (mouseY >= s.getY() && mouseY <= (s.getY() + s.getH())) {
      shapes.remove(s);
      return true;
    }
  }
  return false;
}

boolean handleCircle(Object o) {
  Circle s = (Circle)o;
  if (dist(s.getX(), s.getY(), mouseX, mouseY) < abs(s.getD()/2)) {
    shapes.remove(s);
    return true;
  }
  return false;
}

//Checks if the mouse is clicked in a specific area
boolean checkIfMouseClick(int x1, int y1, int x2, int y2) {
  if (x1 <= mouseX && mouseX <= y1 && x2 <= mouseY && mouseY <= y2) {
    return true;
  } else {
    return false;
  }
}

//Checks if the mouse is in the drawable canvas area
boolean mouseIsOnCanvas() {
  //TODO check if the mouse is on the canvas area
  //Use canvas_x, canvas_y, canvas_width, canvas_height and the mouseX and mouseY
  //return false if the mouse isn't within the canvas
  return true;
}

//Check if the user clicks on a colour icon
boolean checkForColourChange() {
  boolean colour_change = false;
  if (checkIfMouseClick(64, 146, 577, 656)) {
    colour_change = true;
  }
  if (checkIfMouseClick(170, 228, 589, 647)) {
    colour_change = true;
  }
  if (checkIfMouseClick(245, 303, 597, 663)) {
    colour_change = true;
  }
  if (checkIfMouseClick(324, 393, 591, 648)) {
    colour_change = true;
  }
  if (checkIfMouseClick(417, 500, 582, 657)) {
    colour_change = true;
  }
  if (checkIfMouseClick(523, 600, 591, 648)) {
    colour_change = true;
  }
  if (checkIfMouseClick(629, 706, 578, 662)) {
    colour_change = true;
  }
  if (checkIfMouseClick(713, 764, 593, 656)) {
    colour_change = true;
  }
  if (colour_change) {
    color c = get(mouseX, mouseY);
    current_colour.r = red(c);
    current_colour.g = green(c);
    current_colour.b = blue(c);
    return true;
  } else {
    return false;
  }
}

//This is where we will check for all of the tool areas
//And set tool = depending on where you click
//Return true if a tool is selected
boolean checkForTools() {
  //TODO check if the mouse is clicked on tool icons
  //Example code - if the users clicks between 0, 0 and 50, 50
  if (checkIfMouseClick(838, 925, 51, 151)) {
    tool = 1; //draw tool
    return true;
  } 
  if (checkIfMouseClick(836, 924, 193, 268)) {
    tool = 2; // eraser tool
    return true;
  } 
  if (checkIfMouseClick(838, 873, 317, 347)) {
    tool = 3; // circle tool
    return true;
  } 
  if (checkIfMouseClick(885, 928, 312, 356)) {
    tool = 4; // star tool
    return true;
  } 
  if (checkIfMouseClick(861, 895, 360, 390)) {
    tool = 5; // rectangle/square tool
    return true;
  } 
  if (checkIfMouseClick(837, 919, 442, 516)) {
    tool = 6; // line tool 
    return true;
  } else {
    return false;
  }
}
