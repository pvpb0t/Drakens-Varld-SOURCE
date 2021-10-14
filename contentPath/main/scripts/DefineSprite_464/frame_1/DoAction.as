function elastic(X, Y, R)
{
   Xscale = Xscale * accel + (X - draken._x) * convert;
   Yscale = Yscale * accel + (Y - draken._y) * convert;
   Rscale = Rscale * accel + (R - draken._rotation) * convert;
   draken._x = draken._x + Xscale;
   draken._y = draken._y + Yscale;
   draken._rotation = draken._rotation + Rscale;
}
function makeCloud()
{
   i++;
   scale = random(40) + 40;
   cloudHolder.attachMovie("clouds","cloud" + i,i);
   cloudHolder["cloud" + i]._xscale = scale;
   cloudHolder["cloud" + i]._yscale = scale;
   cloudHolder["cloud" + i]._alpha = scale;
   cloudHolder["cloud" + i]._x = random(500) + 50;
}
function makeCloud2()
{
   i++;
   scale = random(20) + 80;
   cloudHolder2.attachMovie("clouds","cloud" + i,i);
   cloudHolder2["cloud" + i]._xscale = scale;
   cloudHolder2["cloud" + i]._yscale = scale;
   cloudHolder2["cloud" + i]._alpha = scale;
   cloudHolder2["cloud" + i]._x = random(500) + 50;
}
function killDragon()
{
   dead = true;
   ballon.play();
   ballon.tween("_y",500,3,"easeoutexpo",0.4,function()
   {
      ballon.gotoAndStop(1);
      ballon.tween(["_y","_x"],[100,300],3,"easeoutexpo",1,function()
      {
         xstartpos = ballon._x;
         ystartpos = ballon._y;
         X = 0;
         Y = 0;
         R = 0;
         Xscale = 0;
         Yscale = 0;
         Rscale = 0;
         xpos = ballon._x;
         ypos = ballon._y;
         dead = false;
      }
      );
   }
   );
}
xstartpos = ballon._x;
ystartpos = ballon._y;
speed = 5;
xpos = ballon._x;
ypos = ballon._y;
xdiff = 0;
ydiff = 0;
movie_width = 600;
movie_height = 320;
draken.swapDepths(2);
cloudHolder2.swapDepths(3);
accel = 0.8;
convert = 0.1;
X = 0;
Y = 0;
R = 0;
Xscale = 0;
Yscale = 0;
Rscale = 0;
i = 0;
makeCloud2();
makeCloud();
makeCloud();
makeCloud();
makeCloud();
makeCloud();
ballon.onEnterFrame = function()
{
   if(random(40) == 0)
   {
      spikesHolder.attachMovie("spikes","spike" + spikesHolder.getNextHighestDepth(),spikesHolder.getNextHighestDepth());
   }
   with(ballon)
   {
      elastic(_x,_y + 50,_rotation,"draken")
      draken.draken_arm._rotation = _rotation * 4
      draken.draken_arm2._rotation = _rotation * 8 + 180
      draken.draken_foot._rotation = (- _rotation) * 4
      draken.draken_foot2._rotation = (- _rotation) * 3
      if(!dead)
      {
         if(Key.isDown(39))
         {
            xpos = xpos + speed;
         }
         if(Key.isDown(37))
         {
            xpos = xpos - speed;
         }
         if(Key.isDown(38))
         {
            ypos = ypos - speed;
         }
         if(Key.isDown(40))
         {
            ypos = ypos + speed;
         }
         if(ypos > movie_height - 40)
         {
            ypos = movie_height - 40;
         }
         else if(ypos < _height / 2)
         {
            ypos = _height / 2;
         }
         if(xpos > movie_width - _width / 2)
         {
            xpos = movie_width - _width / 2;
         }
         else if(xpos < _width / 2)
         {
            xpos = _width / 2;
         }
         if(!(_y < ypos + 5 and _y > ypos - 5))
         {
            _y = _y + (ypos - _y) * 0.1;
         }
         if(_x < xpos + 5 and _x > xpos - 5)
         {
            if(_rotation != 0)
            {
               _rotation = 0;
            }
         }
         else
         {
            _rotation = (xpos - _x) * 0.1;
            _x = _x + (xpos - _x) * 0.1;
         }
         ydiff = _y - ypos;
      }
      
   };
   removeMovieClip(line);
   createEmptyMovieClip("line",1);
   with(line)
   {
      lineStyle(2,0,100)
      moveTo(ballon._x,ballon._y + 20)
      lineTo(draken._x,draken._y)
      
   };
};
