class Box
{
  int x, y, w, h;
  PImage sprite;
  
  Box(int _x, int _y, PImage _sprite)
  {
    x = _x;
    y = _y;
    sprite = _sprite;
    w = sprite.width;
    h = sprite.height;
  }
  
  void draw()
  {
    image(sprite, x ,y);
  }
}