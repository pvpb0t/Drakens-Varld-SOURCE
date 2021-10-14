var speed = 0;
var maxspeed = 3;
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
var curSteer = 0;
diff = random(30) - 15;
stuckTime = 0;
this.onEnterFrame = function()
{
   steer = steer - steer * 0.1;
   temPx = _X - _parent["steer_" + curSteer]._x;
   temPy = _Y - _parent["steer_" + curSteer]._y;
   distance = Math.sqrt(temPx * temPx + temPy * temPy);
   if(distance < 30)
   {
      if(curSteer == 11)
      {
         curSteer = 0;
         diff = random(30) - 15;
      }
      else
      {
         diff = random(30) - 15;
         curSteer++;
      }
   }
   nextRot = Math.floor(180 * Math.atan2(_parent["steer_" + curSteer]._y + diff - _Y,_parent["steer_" + curSteer]._x + diff - _X) / 3.141592653589793);
   if(_rotation - nextRot >= 180)
   {
      nextRot = nextRot + 360;
   }
   if(_rotation < nextRot)
   {
      steer = steer + roto;
   }
   if(_rotation > nextRot)
   {
      steer = steer - roto;
   }
   if(speed < 0)
   {
      speed = 0;
   }
   if(speed < maxspeed)
   {
      speed = speed + 0.5;
   }
   if(steer > 1.5)
   {
      steer = 1.5;
   }
   if(steer < -1.5)
   {
      steer = -1.5;
   }
   if(!_parent.stopGame)
   {
      speed = speed * 0.95;
   }
   else
   {
      speed = speed / 40;
   }
   ideal_hm = speed * Math.cos(angle);
   ideal_vm = speed * Math.sin(angle);
   hm = hm + (ideal_hm - hm) * friction;
   vm = vm + (ideal_vm - vm) * friction;
   if(_parent.enemy2.hitTest(_X,_Y + _parent.YreConstruktor))
   {
      _parent.enemy2.slideTo(_parent.enemy2._x + _parent.enemy2.hm * 4,_parent.enemy2._y + _parent.enemy2.vm * 4,0.3,"easeoutquint");
      this.slideTo(_X + hm * -4,_Y + vm * -4,0.3,"easeoutquint");
   }
   if(_parent.boat.hitTest(_X,_Y + _parent.YreConstruktor))
   {
      _parent.boat.slideTo(_parent.boat._x + _parent.boat.hm * 4,_parent.boat._y + _parent.boat.vm * 4,0.3,"easeoutquint");
      this.slideTo(_X + hm * -4,_Y + vm * -4,0.3,"easeoutquint");
   }
   if(_parent.map.hitTest(_X,_Y + _parent.YreConstruktor,true))
   {
      _X = oldX;
      _Y = oldY;
      speed = speed * hitback;
   }
   else
   {
      oldX = _X;
      oldY = _Y;
      _X = _X + hm;
      _Y = _Y + vm;
   }
   actual_speed = Math.sqrt(hm * hm + vm * vm);
   angle = angle + steer * actual_speed * 0.055;
   _rotation = angle * 57.3;
   if(_parent["check" + curCheck].hitTest(_X,_Y + _parent.YreConstruktor,true))
   {
      if(curCheck >= 7)
      {
         _parent.addLap("enemy2Laps");
         curCheck = 0;
      }
      curCheck++;
   }
};
