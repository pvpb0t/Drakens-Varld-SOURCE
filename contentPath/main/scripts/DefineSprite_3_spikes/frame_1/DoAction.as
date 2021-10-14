_Y = -100;
speed = 3;
_X = random(500) + 50;
this.onEnterFrame = function()
{
   _Y = _Y + speed;
   if(_Y > 400)
   {
      removeMovieClip(this);
   }
   _rotation = _rotation + 1;
   if(_parent._parent.ballon.hitTest(_X,_Y,true) && !_parent._parent.dead)
   {
      trace("HIT!");
      _parent._parent.killDragon();
   }
};
