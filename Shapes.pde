public class Shape {
  
  color c;
  
  public Shape(){
    sendToOldArray();
  }
  
}
// creating rectangle function
public class Rectangle extends Shape {

  int x;
  int y;
  int w;
  int h;

  public Rectangle(int x1, int y1, int w1, int h1, color c1) {
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    c = c1;
  }

  int getX() {
    return x;
  }

  int getY() { 
    return y;
  }

  int getW() {
    return w;
  }

  int getH() {
    return h;
  }

  void draw() {
    fill(c);
    rect(x, y, w, h);
  }
}

//creating circle function
public class Ellipse extends Shape {

  int x;
  int y;
  int w;
  int h;

  public Ellipse(int x1, int y1, int w1, int h1, color c1) {
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    c = c1;
  }

  int getX() {
    return x;
  }

  int getY() { 
    return y;
  }
  
  int getD(){
    return w;
  }

  void draw() {
    fill(c);
    ellipse(x, y, w, h);
  }
}

//creating line function
public class Line extends Shape {

  int x;
  int y;
  int xx;
  int yy;

  public Line(int x1, int y1, int x2, int y2, color c1) {
    x = x1;
    y = y1;
    xx = x2;
    yy = y2;
    c = c1;
  }

  int getX() {
    return x;
  }

  int getY() { 
    return y;
  }

  int getXX() {
    return xx;
  }

  int getYY() {
    return yy;
  }

  void draw() {
    fill(c);
    line(x, y, xx, yy);
  }
}

//creating triangle function

public class Triangle extends Shape {

  int x;
  int y;
  int xx;
  int yy;
  int xxx;
  int yyy;

  public Triangle(int x1, int y1, int x2, int y2, int x3, int y3, color c1) {
    x = x1;
    y = y1;
    xx = x2;
    yy = y2;
    xxx = x3;
    yyy = y3;
    c = c1;
  }

  int getX() {
    return x;
  }

  int getY() { 
    return y;
  }

  int getXX() {
    return xx;
  }
  int getYY() {
    return yy;
  }
    int getXXX() {
    return xxx;
  }
    int getYYY() {
    return yyy;
  }
  void draw() {
    fill(c);
    triangle(x, y, xx, yy, xxx, yyy);
  }
}
