//"Drawable" canvas dimensions, starting from 0,0
int canvas_width = 700;
int canvas_height = 700;
Colour current_colour = new Colour();
//Array of shapes, stored this way to make the eraser work well
ArrayList<Object> shapes = new ArrayList<Object>();
boolean debug_mode = true;
//Mode int to keep track of what mode you are in
int mode = 0;

/*
  
  Shapes:
    nRect(x, y, w, h) - rectangle
    nCircle(x, y, d)  - circle
    
  Modes:
    1) Eraser tool, call removeShapeByMouse()
  
  
*/

void setup() {
  size(1000, 700);
  frameRate(30);
  noStroke();
  if(debug_mode) stressTest(500);
}

void draw() {
  background(255);
  for (Object s : shapes){
    if(s instanceof Rectangle){
      Rectangle r = (Rectangle)s;
      r.draw();
    }
    if(s instanceof Circle){
      Circle c = (Circle)s;
      c.draw();
    }
  }
  fill(0);
  if(debug_mode) text("Shapes: " + shapes.size() + " - FPS: " + int(frameRate), 10, 20);
}

void mouseDragged() {
  removeShapeByMouse();
  //nCircle(mouseX, mouseY, 8);
}

void mouseClicked(){
 removeShapeByMouse();
}
