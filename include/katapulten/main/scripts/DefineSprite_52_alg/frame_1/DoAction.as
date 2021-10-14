function restart()
{
   this.tween("_alpha",0,0.3,"easeoutquad",2,function()
   {
      removeMovieClip(_parent.skugga);
      _parent.restart();
      this.removeMovieClip();
   }
   );
   landed = true;
   _parent.skugga.tween("_alpha",0,0.3,"easeoutquad",2);
}
this.createEmptyMovieClip("scream",1);
this.createEmptyMovieClip("landa",2);
S_landa = new Sound("landa");
S_scream = new Sound("scream");
S_landa.setVolume(70);
S_landa.attachSound("algen_katapult_landa" + (random(3) + 1));
S_scream.attachSound("algen_katapult_scream" + (random(3) + 1));
gravity = 6;
bounce = 0.3;
x = 0;
y = 0;
oldx = x;
oldy = y;
_rotation = y - oldy;
vy = - _parent.shotAngle;
vx = _parent.speed;
landed = false;
S_scream.start();
this.onEnterFrame = function()
{
   oldx = x;
   oldy = y;
   x = - _parent.slingshot._x;
   y = _Y;
   vy = vy + gravity;
   x = x + vx / 10;
   y = y + vy / 10;
   if(y > 280)
   {
      gotoAndStop("done");
      y = 280;
      vx = vx * bounce;
      vy = vy * (- bounce);
      if(!landed)
      {
         restart();
      }
   }
   this.tween("_x",300,2);
   _Y = y;
   _parent.skugga._x = _X;
   _parent.skugga._xscale = y / 3 + 80;
   _parent.skugga._yscale = y / 3 + 80;
   if(!landed)
   {
      _parent.skugga._alpha = _parent.skugga._yscale - 30;
   }
   _parent.slingshot._x = - x;
   _parent.trad._x = _parent.trad._x - (x - oldx);
   _parent.para4._x = _parent.slingshot._x * 1.5;
   _parent.bg._x = _parent.bg._x - (x - oldx);
   _parent.bg2._x = _parent.bg2._x - (x - oldx) / 2;
   _parent.bg3._x = _parent.bg3._x - (x - oldx) / 3;
   _parent.para3._x = _parent.slingshot._x / 2;
   _parent.para2._x = _parent.slingshot._x / 3;
   _parent.para1._x = _parent.slingshot._x / 6;
   _rotation = (y - oldy) * 2;
   if(_parent.trad.top.hitTest(_X,_Y,true))
   {
      removeMovieClip(_parent.skugga);
      _parent.trad.top.play();
      S_scream.stop();
      _parent._parent.playSound("landa_i_trad");
      _parent._parent.totScore = _parent._parent.totScore + 1;
      _parent._parent.cake.gotoAndStop(_parent._parent.totScore + 1);
      removeMovieClip(this);
   }
   S_scream.setVolume(70 + y / 10);
};
