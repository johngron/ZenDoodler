class OutlineSquare extends Outline {
  Point topLeft; //Top left corner
  Point bottomRight; //Bottom right corner
  
  OutlineSquare(Point tl1, Point br1) {
    Point tl = new Point(tl1.x_coord, tl1.y_coord);
    Point br = new Point(br1.x_coord, br1.y_coord);
    if (tl.x_coord > br.x_coord) {
      float temp = tl.x_coord;
      tl.x_coord = br.x_coord;
      br.x_coord = temp;
    }
    if (tl.y_coord > br.y_coord) {
      float temp = tl.y_coord;
      tl.y_coord = br.y_coord;
      br.y_coord = temp;
    }
    
    this.topLeft = tl;
    this.bottomRight = br;
  }
  
  void drawSelf(int col) {
    stroke(col);
    line(topLeft.x_coord, topLeft.y_coord, bottomRight.x_coord, topLeft.y_coord);
    line(bottomRight.x_coord, topLeft.y_coord, bottomRight.x_coord, bottomRight.y_coord);
    line(bottomRight.x_coord, bottomRight.y_coord, topLeft.x_coord, bottomRight.y_coord);
    line(topLeft.x_coord, bottomRight.y_coord, topLeft.x_coord, topLeft.y_coord);
  }
  
  boolean pointInside(float x, float y) {
    return (x > topLeft.x_coord && x < bottomRight.x_coord && y > topLeft.y_coord && y < bottomRight.y_coord);
  }
  
  ArrayList<Line> getLines() {
   ArrayList<Line> temp = new ArrayList<Line>();
   temp.add(new Line(topLeft, new Point(bottomRight.x_coord, topLeft.y_coord))); 
   temp.add(new Line(new Point(bottomRight.x_coord, topLeft.y_coord), bottomRight));
   temp.add(new Line(bottomRight, new Point(topLeft.x_coord, bottomRight.y_coord)));
   temp.add(new Line(new Point(topLeft.x_coord, bottomRight.y_coord), topLeft));
   
   return temp;
  }
  
ArrayList<Line> getLines2() {
   ArrayList<Line> temp = new ArrayList<Line>();
   temp.add(new Line(topLeft, new Point(topLeft.x_coord, bottomRight.y_coord))); 
   temp.add(new Line( new Point(topLeft.x_coord, bottomRight.y_coord), bottomRight));
   temp.add(new Line(bottomRight, new Point(bottomRight.x_coord, topLeft.y_coord)));
   temp.add(new Line(new Point(bottomRight.x_coord, topLeft.y_coord), topLeft));
   
   return temp;
  }
  
  float getArea() {
    return Math.abs(topLeft.x_coord - bottomRight.x_coord) * (topLeft.y_coord - bottomRight.y_coord);
  }
  
  ArrayList<OutlineTriangle> splitInto4(){
      Point middle = new Point(.5*(topLeft.x_coord + bottomRight.x_coord),.5*(topLeft.y_coord + bottomRight.y_coord));
      //Point middle2 = new Point(.5*(bottomRight.x_coord + topLeft.x_coord),.5*(topLeft.y_coord + bottomRight.y_coord));
      //Point trueMiddle = new Point(.5*(middle.x_coord + middle2.x_coord), .5*(middle.y_coord + middle2.x_coord));
      
      ArrayList<OutlineTriangle> ret = new ArrayList<OutlineTriangle>();
      ret.add(new OutlineTriangle(topLeft, middle, new Point(topLeft.x_coord, bottomRight.y_coord)));
      ret.add(new OutlineTriangle(bottomRight, middle, new Point(topLeft.x_coord, bottomRight.y_coord)));
      ret.add(new OutlineTriangle(topLeft, middle, new Point(bottomRight.x_coord, topLeft.y_coord)));
      ret.add(new OutlineTriangle(bottomRight, middle, new Point(bottomRight.x_coord, topLeft.y_coord)));
      
      return ret;
  }
  
  ArrayList<OutlineSquare> splitInto4square(){
      Point middle = new Point(.5*(topLeft.x_coord + bottomRight.x_coord),.5*(topLeft.y_coord + bottomRight.y_coord));
      //Point middle2 = new Point(.5*(bottomRight.x_coord + topLeft.x_coord),.5*(topLeft.y_coord + bottomRight.y_coord));
      //Point trueMiddle = new Point(.5*(middle.x_coord + middle2.x_coord), .5*(middle.y_coord + middle2.x_coord));
      
      ArrayList<OutlineSquare> ret = new ArrayList<OutlineSquare>();
      ret.add(new OutlineSquare(topLeft, middle));
      ret.add(new OutlineSquare(bottomRight, middle));
      ret.add(new OutlineSquare(middle, new Point(topLeft.x_coord, bottomRight.y_coord)));
      ret.add(new OutlineSquare(middle, new Point(bottomRight.x_coord, topLeft.y_coord)));
      
      return ret;
  }
    int compareTo(Object o) {
    if (o == this)
      return 0;
    else if (o instanceof Outline) {
      Outline p = (Outline) o;
      float pArea = p.getArea();
      float oArea = this.getArea();
            if (pArea > oArea)
        return -1;
      else if (oArea > pArea)
        return 1;
      else
        return 0;
    }
    else {
      System.out.println("You fucked up hard somewhere");
      return 0;
    }
}