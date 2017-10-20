int score = 0;
int timer = 100;
PImage catcherSprite;
PImage objectSprite;


int[] positions = {52, 168, 284};
int playerPosition = 1;
Box player; 
FallingObject[] objects  = new FallingObject[4];
void setup() //called once at the beginning
{
  size(400,600);
  textSize(32);
  
  catcherSprite = loadImage("shrek_100.png");
  objectSprite = loadImage("onion.png");
  
  player = new Box(positions[playerPosition], 506, catcherSprite);
  for(int i = 0; i < objects.length; i++)
  {
    objects[i] = new FallingObject(positions, objectSprite);
  }
}

void draw() // called every time
{
  background(174,232,251);
  player.draw();
  
  text("Onions: " + score, 30, 50);
  text("Timer: " + timer/10, 30, 90);
  
  if(timer<=400)
  {
    text("GAME OGRE", 110, 300);
    playerPosition--;
    player.x = positions[playerPosition];
    playerPosition++;
    player.x = positions[playerPosition];
  }
  else
  {
    timer -=1;
    for(int i = 0; i < objects.length; i++)
    {
      objects[i].update();
      objects[i].draw();  
    
      if(CheckCollision(objects[i], player))
      {
        score++;
        objects[i].reset();
      }
    }
  }
}
void keyPressed()
{
  if(keyCode == LEFT)
  {
    playerPosition--;
  }
  if(keyCode == RIGHT)
  {
    playerPosition++;
  }
  playerPosition = constrain(playerPosition, 0,2);
  player.x = positions[playerPosition];
  
  if(keyCode == ENTER && timer <= 400)
  {
    timer = 4200;
    score = 0;
  }
}

boolean CheckCollision(Box a, Box b)
{
   return (a.x < (b.x + b.w) && b.x < (a.x + a.w) &&
     a.y < (b.y + b.h) && b.y < (a.y + a.h));
}