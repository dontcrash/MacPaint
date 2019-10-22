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
boolean checkIfMouseClick(int x, int y, int w, int h) {
  //TODO make this function check if the mouse is in the specified area
  //return false if the mouse isn't
  return true;
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
  if (checkIfMouseClick(0, 0, 50, 50)) {
    colour_change = true;
  }
  if (checkIfMouseClick(50, 50, 50, 50)) {
    colour_change = true;
  }
  if (colour_change) {
    color c = get(mouseX, mouseY);
    current_colour.r = red(c);
    current_colour.g = green(c);
    current_colour.b = blue(c);
    return true;
  }else{
    return false;
  }
}

/*
 else if (64 <= mouseX && mouseX <= 146 && 577 <= mouseY && mouseY <= 656){
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

*/
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
