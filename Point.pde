public class Point {
  float x_coord;
  float y_coord;
  
  Point(float x, float y) {
    x_coord = x;
    y_coord = y;
  }
  
  boolean insideOutline(Outline out) {
    return out.pointInside(x_coord, y_coord);
  }
  
  boolean touchingSpiralLine(Spiral sp) {
    return true;
  }
  
  Point subtract(Point p1){
    return new Point(this.x_coord - p1.x_coord, this.y_coord - p1.y_coord);
  }
}