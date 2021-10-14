_Y = - random(200) + 100;
gotoAndStop(random(2) + 1);
speed = _xscale / 20;
this.onEnterFrame = function()
{
   if(_Y > 400)
   {
      if(_parent._name == "cloudHolder2")
      {
         _parent._parent.makeCloud2();
      }
      else
      {
         _parent._parent.makeCloud();
      }
      removeMovieClip(this);
   }
   _Y = _Y + speed;
};
