import processing.video.*;

Capture video;
FloatList coordX;
FloatList coordY;
Table coords;

void setup(){
  size(695,390);
  video = new Capture(this,640,480,30);
  video.start();
  coordX = new FloatList();
  coordY = new FloatList();
  
  coords = new Table();
  coords.addColumn("Height");
  coords.addColumn("Width");
  coords.addColumn("coordX");
  coords.addColumn("coordY");
  
  
}

void captureEvent(Capture video){
  video.read();
}

void mousePressed(){
  coordX.append(mouseX);
  coordY.append(mouseY);
  println(mouseX,mouseY);
  
  TableRow newRow = coords.addRow();
  newRow.setInt("Height",50);
  newRow.setInt("Width",50);
  newRow.setInt("coordX",mouseX);
  newRow.setInt("coordY",mouseY);  
}

void keyPressed(){
  if (keyCode == ENTER){
    saveTable(coords, "data/new.csv");
    exit();
  }
}
  

void draw(){
  image(video,0,0);
  tint(255,30);
  ellipse(mouseX,mouseY,30,30);
}  