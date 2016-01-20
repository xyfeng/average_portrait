//import gifAnimation.*;
//GifMaker gifExport;

int photosCount;
Photo[] allPhotos;
Pixel[] allPixels;

void setup() {
  size(487, 600);
  background(0);
  noStroke();
  frameRate(12);

//  gifExport = new GifMaker(this, "../../result_animation.gif");
//  gifExport.setRepeat(0);

  allPixels = new Pixel[width * height];
  for (int i=0; i<width*height; i++) {
    allPixels[i] = new Pixel(0, 0, 0);
  }
  loadPhotos();
}

void draw() {
  //background(0);
  if (frameCount <= allPhotos.length) {
    image(allPhotos[allPhotos.length - frameCount].img, 0, 0);
//    gifExport.setDelay(2);
//    gifExport.addFrame();
  } else if (frameCount <= allPhotos.length * 2 + 10 & frameCount > allPhotos.length + 10) {
    frameRate(6);
    Photo one = allPhotos[frameCount- allPhotos.length - 11];
    drawPhoto(one.img, frameCount - allPhotos.length - 10);
//    gifExport.setDelay(1);
//    gifExport.addFrame();
  } else if (frameCount == allPhotos.length * 2 + 11){
    saveFrame("../../result_average.png");
//    gifExport.finish(); 
  }
}

void loadPhotos() {
  Table metaTable = loadTable("metadata.csv", "header");
  photosCount = metaTable.getRowCount();
  allPhotos = new Photo[photosCount];

  int index = 0;
  for ( TableRow row : metaTable.rows () ) {
    String fileName = row.getString("SourceFile");
    String fileSize = row.getString("FileSize");
    int imageWidth = row.getInt("ImageWidth");
    int imageHeight = row.getInt("ImageHeight");

    Photo one = new Photo(fileName, fileSize, imageWidth, imageHeight);
    println(one.name, one.fileSize);
    allPhotos[index] = one;
    index ++;
  }
}

void drawPhoto(PImage img, int number) {
  loadPixels();
  for ( int m=0; m < width; m++) {
    for (int n=0; n < height; n++) {
      color c = img.get(m, n);
      int index = width * n + m;
      //pixels[index] += c / total;
      allPixels[index].addColor(c, number);
      pixels[index] = allPixels[index].getColor();
    }
  }
  updatePixels();
}
