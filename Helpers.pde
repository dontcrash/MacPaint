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
  public int r = 0; //red
  public int g = 0; //green
  public int b = 0; //blue
  public int a = 255; //alpha
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
boolean checkIfMouseClick(int x, int y, int w, int h) {
  if (x <= mouseX && mouseX <= y && w <= mouseY && mouseY <= h){
  return true;
  } else {
    return false;
    //TODO make this function check if the mouse is in the specified area
  //return false if the mouse isn't
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
  //TODO code this logic using the get() function to set a colour
  //return true if the user clicks on a colour icon
  //For example, check if yellow paint is clicked
  if (checkIfMouseClick(0, 0, 50, 50)) {
    current_colour.r = 200;
    current_colour.g = 200;
    current_colour.b = 200;
    return true;
  }
  return false;
}

//This is where we will check for all of the tool areas
//And set tool = depending on where you click
//Return true if a tool is selected
boolean checkForTools() {
  //TODO check if the mouse is clicked on tool icons
  //Example code - if the users clicks between 0, 0 and 50, 50
  if (checkIfMouseClick(0, 0, 50, 50)) {
    tool = 1;
    return true;
  }
  return false;
}
