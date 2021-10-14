var speed = 0;
var maxspeed = 4;
var roto = 0.08;
var friction = 0.15;
var hitback = 0.5;
var angle;
var steer = 0;
var ideal_hm = 0;
var ideal_vm = 0;
var hm = 0;
var vm = 0;
var actual_speed = 0;
var curCheck = 0;
this.onEnterFrame = function()
{
   boatSpeedVol = speed;
   steer = steer - steer * 0.1;
   if(speed < 0)
   {
      speed = 0;
   }
   if(Key.isDown(37))
   {
      steer = steer - roto;
   }
   if(Key.isDown(39))
   {
      steer = steer + roto;
   }
   if(steer > 1.5)
   {
      steer = 1.5;
   }
   if(steer < -1.5)
   {
      steer = -1.5;
   }
   if(Key.isDown(32) && speed < maxspeed)
   {
      if(!_parent.stopGame)
      {
         speed = speed + 0.5;
      }
      else
      {
         speed = speed / 40;
      }
   }
   if(Key.isDown(40))
   {
      speed = speed * 0.4;
   }
   speed = speed * 0.95;
   ideal_hm = speed * Math.cos(angle);
   ideal_vm = speed * Math.sin(angle);
   hm = hm + (ideal_hm - hm) * friction;
   vm = vm + (ideal_vm - vm) * friction;
   if(_parent.map.hitTest(_X,_Y + _parent.YreConstruktor,true))
   {
      _X = oldX;
      _Y = oldY;
      slideY = (_Y - oldY) * 10;
      slideX = (_X - oldX) * 10;
      this.slideTo(_X + slideX,_Y + slideY,0.3,"easeoutquint");
   }
   else
   {
      oldX = _X;
      oldY = _Y;
      _X = _X + hm;
      _Y = _Y + vm;
   }
   if(_parent.enemy2.hitTest(_X,_Y + _parent.YreConstruktor))
   {
      _parent.enemy2.slideTo(_parent.enemy2._x + _parent.enemy2.hm * 4,_parent.enemy2._y + _parent.enemy2.vm * 4,0.3,"easeoutquint");
      this.slideTo(_X + hm * -4,_Y + vm * -4,0.3,"easeoutquint");
   }
   if(_parent.enemy1.hitTest(_X,_Y + _parent.YreConstruktor))
   {
      _parent.enemy1.slideTo(_parent.enemy1._x + _parent.enemy1.hm * 4,_parent.enemy1._y + _parent.enemy1.vm * 4,0.3,"easeoutquint");
      this.slideTo(_X + hm * -4,_Y + vm * -4,0.3,"easeoutquint");
   }
   actual_speed = Math.sqrt(hm * hm + vm * vm);
   angle = angle + steer * actual_speed * 0.055;
   _rotation = angle * 57.3;
   if(_parent["check" + curCheck].hitTest(_X,_Y + _parent.YreConstruktor,true))
   {
      if(curCheck >= 7)
      {
         _parent.addLap("laps");
         _parent.scoreBoard.gotoAndStop(_parent.laps + 1);
         curCheck = 0;
      }
      curCheck++;
   }
};
