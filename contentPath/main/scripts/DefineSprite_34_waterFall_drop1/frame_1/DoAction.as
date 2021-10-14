this.onEnterFrame = function()
{
   if(_Y > 130)
   {
      _parent.newDrop(i);
   }
   _alpha = 130 - _Y;
   _Y = _Y + 7 * (_xscale / 100);
};
stop();
