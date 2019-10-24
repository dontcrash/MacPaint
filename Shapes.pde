public class Shape {

  color c;

  public Shape() {
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

  int getW() {
    return w;
  }

  int getH() {
    return h;
  }

  void draw() {
    fill(c);
    ellipse(x, y, w, h);
  }
}

//creating line function
public class Line extends Shape {

  int x1;
  int y1;
  int x2;
  int y2;

  public Line(int nx1, int ny1, int nx2, int ny2, color c1) {
    x1 = nx1;
    y1 = ny1;
    x2 = nx2;
    y2 = ny2;
    c = c1;
  }

  int getX1() {
    return x1;
  }

  int getY1() { 
    return y1;
  }

  int getX2() {
    return x2;
  }

  int getY2() {
    return y2;
  }

  void draw() {
    stroke(c);
    line(x1, y1, x2, y2);
  }
}

//creating triangle function
public class Triangle extends Shape {

  float x;
  float y;
  float xx;
  float yy;
  float xxx;
  float yyy;

  public Triangle(float x1, float y1, float x2, float y2, float x3, float y3, color c1) {
    x = x1;
    y = y1;
    xx = x2;
    yy = y2;
    xxx = x3;
    yyy = y3;
    c = c1;
  }

  float getX() {
    return x;
  }

  float getY() { 
    return y;
  }

  float getXX() {
    return xx;
  }
  float getYY() {
    return yy;
  }
  float getXXX() {
    return xxx;
  }
  float getYYY() {
    return yyy;
  }
  
  void draw() {
    fill(c);
    triangle(x, y, xx, yy, xxx, yyy);
  }
}
