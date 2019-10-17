public class Shape {
  Colour c = new Colour();
}

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
