public class Shape {
  Colour c = new Colour();
}
// creating rectangle function
public class Rectangle extends Shape {

  int x;
  int y;
  int w;
  int h;

  public Rectangle(int x1, int y1, int w1, int h1, Colour c1) {
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    c.r = c1.r;
    c.g = c1.g;
    c.b = c1.b;
    c.a = c1.a;
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
    fill(c.r, c.b, c.g, c.a);
    rect(x, y, w, h);
  }
}

//creating circle function
public class Circle extends Shape {

  int x;
  int y;
  int d;

  public Circle(int x1, int y1, int d1, Colour c1) {
    x = x1;
    y = y1;
    d = d1;
    c.r = c1.r;
    c.g = c1.g;
    c.b = c1.b;
    c.a = c1.a;
  }

  int getX() {
    return x;
  }

  int getY() { 
    return y;
  }

  int getD() {
    return d;
  }

  void draw() {
    fill(c.r, c.b, c.g, c.a);
    circle(x, y, d);
  }
}

//creating line function
public class Line extends Shape {

  int x;
  int y;
  int xx;
  int yy;

  public Line(int x1, int y1, int x2, int y2, Colour c1) {
    x = x1;
    y = y1;
    xx = x2;
    yy = y2;
    c.r = c1.r;
    c.g = c1.g;
    c.b = c1.b;
    c.a = c1.a;
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
    fill(c.r, c.b, c.g, c.a);
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

  public Triangle(int x1, int y1, int x2, int y2, int x3, int y3, Colour c1) {
    x = x1;
    y = y1;
    xx = x2;
    yy = y2;
    xxx = x3;
    yyy = y3;
    c.r = c1.r;
    c.g = c1.g;
    c.b = c1.b;
    c.a = c1.a;
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
    fill(c.r, c.b, c.g, c.a);
    triangle(x, y, xx, yy, xxx, yyy);
  }
}
