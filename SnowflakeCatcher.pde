Snowflake [] snow;
int numw;
void setup()   
 {     
  size(300,300);
  snow = new Snowflake [125];
  for(int i = 0; i < snow.length; i++)
  {
    snow[i] = new Snowflake();
  }
  frameRate(30);
 }   
 void draw()   
 {    
  background(127);
  fill(0);
  ellipse(150,270,50,20);
  numw = 0;
  for(int i = 0; i < snow.length; i++)
  {
    
    snow[i].wind();
    snow[i].wrap();
    snow[i].lookDown();
    snow[i].move();
    snow[i].show();
    if(snow[i].colour == 255)
    {
      numw++;
    } 
  }
  fill(255);
  if(numw == 0)
  {
    text("You Win!!",120,130);
    text("Press Space to Restart",85,150);
  }
  text("Number of Snowflakes Left: " + (numw),50,20);
 }  

void keyPressed() 
{
  if (key == ' ')
  {
    for(int i = 0; i < snow.length; i++)
    {
      snow[i].colour = 255;
      if(snow[i].sy > 300)
      {
        snow[i].sy = (int)(Math.random()*50 - 50);
      }
      snow[i].moving = true;
    }
  }    
}

class Snowflake
{
  int sx, sy, speed, winds, colour;
  boolean moving;
  Snowflake()
  {
    sx = (int)(Math.random()*400 - 50);
    sy = (int)(Math.random()*300);
    speed =(int)(Math.random()*4) + 2;
    colour = 255;
    moving = true;
  }
  void show()
  {
    noStroke();
    fill(colour);
    ellipse(sx,sy,5,5);
  }
  void lookDown()
  {
    if(sy > 246)
    {
      if(get(sx,sy+3) == color(0))
      {
        colour = 127;
      }
    }
  }
  void move()
  {
    if(moving == true)
      sy = sy + speed;
  }
  void wind()
  {
    if(mouseX > 250 && mouseX < 300)
      {
        winds = 2;
      }
    else if(mouseX > 200 && mouseX < 250)
      {
        winds = 1;
      }
    else if(mouseX > 50 && mouseX < 100)
      {
        winds = -1;
      }
    else if(mouseX > 0 && mouseX < 50)
      {
        winds = -2;
      }
    else 
      {
        winds = 0;
      }
    sx = sx + winds;
  }
  void wrap()
  {
    if(sy > 300)
    {
      if(colour == 127)
      {
        moving = false;
      }
      else
      {
        sy = 0;
        sx = (int)(Math.random()*400 - 50);
        speed =(int)(Math.random()*4) + 2;
      }
    }
  }
}



