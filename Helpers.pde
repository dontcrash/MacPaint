//Stress tested up to 20,000 shapes stored in the array
//Handled this at 22fps on my MacBook Pro
void stressTest(int n) {
  for (int i = 0; i < n; i ++) {
    int r = randomInt(1, 3);
    int rx = randomInt(canvas_x, canvas_x + canvas_width);
    int ry = randomInt(canvas_y, canvas_y + canvas_height);
    if (r == 1) {
      nRect(rx, ry, randomInt(10, 50), randomInt(10, 50));
    }
    if (r == 2) {
      nEllipse(rx, ry, randomInt(3, width/20), randomInt(3, width/20));
    }
  }
}

void nRect(int x, int y, int w, int h) {
  addToShapes(new Rectangle(x, y, w, h, current_colour));
}

void nEllipse(int x, int y, int w, int h) {
  addToShapes(new Ellipse(x, y, w, h, current_colour));
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
    if (s instanceof Ellipse) {
      if (handleEllipse(s)) break;
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

boolean handleEllipse(Object o) {
  Ellipse s = (Ellipse)o;
  if (pointInsideEllipse(s)) {
    shapes.remove(s);
    return true;
  }
  //Handle 1 pixel wide/high ellipses
  if (s.getW() == 1 || s.getH() == 1) {
    if (checkIfMouseClick(s.getX(), s.getX() + s.getW(), s.getY(), s.getY() + s.getH())) {
      shapes.remove(s);
      return true;
    }
  }
  return false;
}

boolean pointInsideEllipse(Ellipse s) {
  double rx = s.getW() / 2;
  double ry = s.getH() / 2;
  double tx = (mouseX - (s.getX() + rx)) / rx;
  double ty = (mouseY - (s.getY() + ry)) / ry;
  return tx * tx + ty * ty <= 1.0;
}

//Checks if the mouse is clicked in a specific area
boolean checkIfMouseClick(int x1, int x2, int y1, int y2) {
  int mx = mouseX;
  int my = mouseY;
  if (mx >= x1 && mx <= x2 && my >= y1 && my <= y2) {
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
  if (canvas_x <= mouseX && mouseX <= canvas_width + canvas_x && canvas_y - height <= mouseY && mouseY <= canvas_height + canvas_y) {
    return true;
  } else {
    return false;
  }
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
  if (checkIfMouseClick(820, 960, 560, 680)) {
    colour_change = true;
  }
  if (colour_change) {
    color c = get(mouseX, mouseY);
    //Bounding box check if user clicks background image
    if (c == -14917233) return true;
    current_colour = c;
    return true;
  } else {
    return false;
  }
}

//This is where we will check for all of the tool areas
//And set tool = depending on where you click
//Return true if a tool is selected
boolean checkForTools() {
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
    tool = 4; // triangle tool
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

void sendToOldArray() {
  old_shapes = (ArrayList)shapes.clone();
}
