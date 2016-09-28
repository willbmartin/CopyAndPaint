public class Cbox {
  private int x;
  private int y;
  private boolean selected = false;
  private static final int BOXSIZE = 100;
  
  public Cbox(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public boolean isSelected() {
    return selected;
  }  
  
  public void select() {
    selected = true; 
  }
  
  public void deselect() {
    selected = false; 
  }
  
  public void drawBox() {
    //stroke(0);
    strokeWeight(5);
    if (selected) {
      stroke(255,0,0);
    }
    else {
      stroke(0);
    }
    fill(255,255,255,0);
    rect(x,y,BOXSIZE,BOXSIZE); 
  }
  
  public boolean inBox() {
    return ((mouseX > x) && (mouseX < (x)+BOXSIZE) && (mouseY > y) && (mouseY < (y)+BOXSIZE));
  }  
  
  public void setX(int xIn) {
    x = xIn;
  }
  
  public int getX() {
    return x;
  }
  
  public void setY(int yIn) {
    y = yIn;
  }
  
  public int getY() {
    return y; 
  }
  
}