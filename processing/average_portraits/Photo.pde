// References
// http://docs.oracle.com/javase/8/docs/api/java/text/SimpleDateFormat.html
// http://docs.oracle.com/javase/8/docs/api/java/util/Date.html

import java.util.Comparator;

class Photo {
  PImage img;
  String name;
  int img_w;
  int img_h;
  int fileSize;

  Photo( String f_name, String f_size, int w, int h) {
    name = f_name;
    img = loadImage(name);
    img_w = w;
    img_h = h;
    fileSize = int(f_size.substring(0, f_size.indexOf(' ')));
  }
}

class fileSizeComparator implements Comparator<Photo> {
  @Override
    public int compare(Photo o1, Photo o2) {
    return int(o1.fileSize - o2.fileSize);
  }
}