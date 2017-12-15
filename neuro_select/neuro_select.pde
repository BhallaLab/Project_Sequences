//import processing.video.*;

//Capture video;
/*@pjs
isTransparent=true
*/

FloatList coordX;
FloatList coordY;
Table coords;
int j;
//when you change the following two values for width and height,
//change the corresponding value in the size() also
int frameWidth = 640; 
int frameHeight = 480;

int gridSize = 300;

void setup(){
  size(640,480);
  background(100);
  //video = new Capture(this,640,480,30);
  //video.start();
  coordX = new FloatList();
  coordY = new FloatList();
  
  coords = new Table();
  coords.addColumn("Height");
  coords.addColumn("Width");
  coords.addColumn("coordX");
  coords.addColumn("coordY");
  
  
}

//void captureEvent(Capture video){
  //video.read();
//}

//void mousePressed(){
//  coordX.append(mouseX);
//  coordY.append(mouseY);
//  //println(mouseX,mouseY);
  
//  TableRow newRow = coords.addRow();
//  newRow.setInt("Height",50);
//  newRow.setInt("Width",50);
//  newRow.setInt("coordX",int(mouseX*gridSize/frameWidth));
//  newRow.setInt("coordY",int(mouseY*gridSize/frameHeight));
    
//}

void keyPressed(){
  if (keyCode == ENTER){
    saveTable(coords, "data/new.csv");
    exit();
  }
}
  

void draw(){
  //image(video,0,0);
  //tint(255,30);
  background(50);
  
  if (mousePressed){
    j = j+1;
    int x = mouseX;
    int y = mouseY;
    coordX.append(x);
    coordY.append(y);
    //println(x,y);
  
    TableRow newRow = coords.addRow();
    newRow.setInt("Height",50);
    newRow.setInt("Width",50);
    newRow.setInt("coordX",int(x*gridSize/frameWidth));
    newRow.setInt("coordY",int(y*gridSize/frameHeight));
    
    fill(120);
    tint(200,100);
    ellipse(x,y,20,20);
    
    fill(0);
    text(j,x,y);
  }

  //int points = coordX.size();
  //for (int i=0;i<points;i++){
  //  int x = int(coordX.get(i));
  //  int y = int(coordY.get(i));
    
       
    //println(points);
    //text(i,coordX.get(i),coordY.get(i));
  //}
}
  