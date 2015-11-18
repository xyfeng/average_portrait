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
