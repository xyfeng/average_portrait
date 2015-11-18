class Pixel {
  float r;
  float g;
  float b;
  Pixel(float _r, float _g, float _b) {
    r = _r;
    g = _g;
    b = _b;
  }

  void addColor(color c, int num) {
    r = r * (num-1.0) / num + red(c) / (float)num;
    g = g * (num-1.0) / num + green(c) / (float)num;
    b = b * (num-1.0) / num + blue(c) / (float)num;
  }

  color getColor() {
    return color(r, g, b);
  }
}