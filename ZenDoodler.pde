int BGCOLOR = 0;

void setup() {
  size(1280,720);
  background(BGCOLOR);
  smooth(8);
}

ArrayList<Outline> outlines = new ArrayList<Outline>();

boolean firstCoord = false;
boolean secondCoord = false;
Point one;
Point two;
Point three;
void draw() {
  if(mousePressed && firstCoord == false && !secondCoord) {

    one = new Point(mouseX, mouseY);
    System.out.println("one: "+one.x_coord + " " + one.y_coord);
    firstCoord = true;
    secondCoord = false;
  }
  else if (firstCoord == true && !mousePressed && !secondCoord) {
    two = new Point(mouseX, mouseY);
    System.out.println("two: "+two.x_coord + " " + two.y_coord);
    firstCoord = false; //Comment this out to only draw one square
   // secondCoord = true;
   OutlineSquare out = new OutlineSquare(one, two);
   outlines.add(out);
   out.drawSelf(225);
  }
  
  /*
  else if (secondCoord == true && mousePressed && !firstCoord){
    three = new Point(mouseX, mouseY);
        System.out.println("three: "+ three.x_coord + " " + three.y_coord + "\n");
    OutlineTriangle os = new OutlineTriangle(one, two, three);
    outlines.add(os);
    os.drawSelf(255);
    //firstCoord = false;

    secondCoord = true;
    firstCoord = true;;
  }
  else if (!mousePressed && firstCoord && secondCoord){
    secondCoord = false;
    firstCoord = false;
  }
  */
}

void keyPressed() {
    if (key == ENTER) {
     stroke(#00ff00);
      Point p = new Point(mouseX, mouseY);
      for (Outline o : outlines) {
        if (p.insideOutline(o)) {
          System.out.println("Point is inside an Outline");
          Spiral sp = new Spiral(p, o, outlines.size()%2 == 0);
          for(int i=0; i<255; i++) {
            Line l = sp.updateLine(i%sp.lines.size(), .01 + i*.0001, .01 + i*.0001);
            sp.lines.set(i%sp.lines.size(), l);
/*            if (outlines.size()%3 == 0)
              stroke(#ff0001 - i);
            else if (outlines.size()%3 == 1)
              stroke(#00ff01 - i*256);
            else
              stroke(#0000ff - i*65536);*/
            line(l.origin.x_coord, l.origin.y_coord, l.destination.x_coord, l.destination.y_coord);
          }
          break;
        }
      }
    }
    if (key == ' '){
      stroke(#00ff00);
      Point p = new Point(mouseX, mouseY);
      for (Outline o : outlines) {
        if (p.insideOutline(o)) {
          System.out.println("Point is inside an Outline");
          ArrayList<OutlineTriangle> tris; 
          ArrayList<OutlineSquare> squares = ((OutlineSquare)o).splitInto4square();
          Spiral sp;
          for(int k = 0; k<4; k++){
          
          tris = (squares.get(k).splitInto4());

          for(int j = 0; j<4; j++){
          
          sp = new Spiral(p, tris.get(j), (outlines.size()%2 + j==0) || (outlines.size()%2 + j==3));
          for(int i=0; i<255; i++) {
            Line l = sp.updateLine(i%sp.lines.size(), .01 + i*.0001, .01 + i*.0001);
            sp.lines.set(i%sp.lines.size(), l);

            line(l.origin.x_coord, l.origin.y_coord, l.destination.x_coord, l.destination.y_coord);
          }
        }

        }
        break;
      }
      }
    }
}

void animateLine(Line toAnimate) {
  int framesToAnim = 60;
  line(toAnimate.origin.x_coord, toAnimate.origin.y_coord, 
  toAnimate.origin.x_coord + float(frameCount % framesToAnim) / framesToAnim * (toAnimate.destination.x_coord - toAnimate.origin.x_coord), 
 toAnimate.origin.y_coord + float(frameCount % framesToAnim) / framesToAnim * (toAnimate.destination.y_coord - toAnimate.origin.y_coord));
}