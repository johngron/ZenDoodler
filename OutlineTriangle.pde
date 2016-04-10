class OutlineTriangle extends Outline {
  
  private Point top; //will always be above or equal to the other points
  private Point left; //will always be more to the left than right
  private Point right; //will always be more to the right than Left
  
  OutlineTriangle(Point t, Point r, Point l){
    Point a = t;
    Point b = r;
    Point c = l;
    if (a.y_coord > b.y_coord || a.y_coord > c.y_coord){
      if (b.y_coord > c.y_coord){
        System.out.println("top is three, three is now one");
        top = c;
        c = a;
      }
      else{
        System.out.println("top is two, two is now one");
        top = b;
        b = a;
      }
    }
    else{
      top = a;
      System.out.println("top is one");
    }
    if (b.x_coord > c.x_coord){
      System.out.println("right is two");
          System.out.println("left is three");
      right = b;
      left = c;
    }
    else{
      System.out.println("right is three");
      System.out.println("left is two");
      right = c;
      left = b;
    }
  }
  
  void drawSelf(int col){
    System.out.println("top: "+top.x_coord + " " + top.y_coord);
    System.out.println("right: "+right.x_coord + " " + right.y_coord);
    System.out.println("left: "+left.x_coord + " " + left.y_coord);
    stroke(col);
    line(top.x_coord, top.y_coord, right.x_coord, right.y_coord);
    line(right.x_coord, right.y_coord, left.x_coord, left.y_coord);
    line(left.x_coord, left.y_coord, top.x_coord, top.y_coord);
  }
  
  ArrayList<Line> getLines (){
     ArrayList<Line> temp = new ArrayList<Line>();
     temp.add(new Line(top, right));
     temp.add(new Line(right, left));
     temp.add(new Line(left, top));
     return temp;
  }
  
    ArrayList<Line> getLines2 (){
     ArrayList<Line> temp = new ArrayList<Line>();
     temp.add(new Line(top, left));
     temp.add(new Line(left, right));
     temp.add(new Line(right, top));
     return temp;
  }
  
  boolean pointInside(float x, float y){
     Point a = new Point(x, y);
     return (sameSide(a, top, right) && sameSide(a, right, left) && sameSide(a, left, top));
  }
  // more inaccurate in cases further away from isosceles
  float getArea(){
    float h = (right.y_coord + left.y_coord) - top.y_coord;
    float bl = (float) Math.sqrt(Math.pow(right.x_coord - left.x_coord, 2) + Math.pow(right.y_coord - left.y_coord, 2));
    return h*bl*.5;
  }
  
  private boolean sameSide(Point a, Point o, Point d){
     return crossProduct(d.subtract(o), a.subtract(o)) > 0;
  }
  
  private float crossProduct(Point a, Point b){
    return (a.x_coord*b.y_coord) - (a.y_coord*b.x_coord);
  }
}