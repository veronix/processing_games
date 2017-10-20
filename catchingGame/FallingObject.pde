class FallingObject extends Box
{
  int spd;
  int[] positions;
  
  FallingObject(int[] _positions, PImage _sprite)
  {
    super(0,0, _sprite);
    positions = _positions;
    reset();
  }
  
  void reset()
  {
    x = positions[(int)random(3)];
    y = -1 * (int)random(10);
    spd = (int)random(2,7);
  }
  
  void update()
  {
    y += spd;
    if(y > 600)
      reset();
  }
}