function restart()
{
   _alpha = 0;
   speed = 4 / (random(2) + 2);
   _X = random(30) + 5;
   _Y = startY;
}
startY = _Y;
restart();
this.onEnterFrame = function()
{
   if(_Y < 0)
   {
      restart();
   }
   if(_alpha < 100)
   {
      _alpha = _alpha + 10;
   }
   _Y = _Y - speed * 1.05;
};
