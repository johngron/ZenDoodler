abstract public class Outline implements Comparable {
  
  abstract void drawSelf(int col);
  abstract boolean pointInside(float x, float y);
  abstract float getArea();
  abstract ArrayList<Line> getLines();
  abstract ArrayList<Line> getLines2();
  
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
}