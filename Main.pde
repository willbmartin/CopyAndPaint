
//uses a simple grid snap to paint aligned text
public static final int GRIDSIZE = 10;
public static final int BOXSIZE = 100;
public static int selectedBox = 0;
public static Cbox[] userBoxes;
//public char stamp = '%';

void setup() {
  size(500, 500);
  background(255);
  setUpBoxes();
}

void draw(){
  stroke(0);
  paintBox();
  //selector();
  drawBoxBounds();
}

public void brush() {
  noStroke();
  fill(0);
  ellipse(mouseX, mouseY, 10, 10);
  fill(0);
}

public boolean inAnyBox() {
  for (int i = 0; i < 5; i++) {   
    if(userBoxes[i].inBox()) {
      return true;
    }
  }
  return false;
}

public void keyPressed() {
  if ((key == ENTER) && (selectedBox < 4)) {
    userBoxes[selectedBox].deselect();
    selectedBox++;
    userBoxes[selectedBox].select();
    }
  if ((key == BACKSPACE) && (selectedBox > 0)) {
    userBoxes[selectedBox].deselect();
    selectedBox--;
    userBoxes[selectedBox].select();
  }
}

public void paintBox() {
  for (int i = 0; i < 5; i++) {   
    if (userBoxes[i].isSelected()) {
      if (mousePressed && !inAnyBox() && (mouseButton == LEFT)) {
        copy(userBoxes[i].getX()+10,userBoxes[i].getY()+10,BOXSIZE-12,BOXSIZE-12,(mouseX/GRIDSIZE)*GRIDSIZE,(mouseY/GRIDSIZE)*GRIDSIZE,GRIDSIZE,GRIDSIZE); 
      }
      if (mousePressed && userBoxes[i].inBox() && (mouseButton == LEFT)) { 
        brush();
      }
      if (mousePressed && (mouseButton == RIGHT)) {
        //erase
        noStroke();
        fill(255,255,255,255);
        rect((mouseX/GRIDSIZE)*GRIDSIZE,(mouseY/GRIDSIZE)*GRIDSIZE,GRIDSIZE,GRIDSIZE);
      } 
    }
  }  
  
}

void setUpBoxes() {
  userBoxes = new Cbox[5];
  int x = 0;
  int y = height-BOXSIZE;
  for (int i = 0; i < 5; i++) {
    userBoxes[i] = new Cbox(x, y);
    x += width/5;
  }  
} 

void drawBoxBounds() {
  int x = 0;
  int y = height-BOXSIZE;
  for (int i = 0; i < 5; i++) {   
    userBoxes[i].drawBox();
    x += width/5;
  }
  
}  
  
void grid(){
  //place both lines in draw() to visualize the grid
  for (int i = 0; i < width/GRIDSIZE; i++) {
    line(i*GRIDSIZE, 0, i*GRIDSIZE, height);
  }
  for (int i = 0; i < height/GRIDSIZE; i++) {
    line(0, i*GRIDSIZE, width, i*GRIDSIZE);
  } 
}