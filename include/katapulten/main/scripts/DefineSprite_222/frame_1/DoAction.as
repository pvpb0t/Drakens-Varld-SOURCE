this.onEnterFrame = function()
{
   if(this.hitTest(_parent._parent._parent.alg._x,_parent._parent._parent.alg._y))
   {
      play();
   }
};
stop();
