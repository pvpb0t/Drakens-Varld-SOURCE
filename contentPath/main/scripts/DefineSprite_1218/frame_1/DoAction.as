_visible = false;
this.onEnterFrame = function()
{
   if(this.hitTest(_parent.man._x,_parent.man._y,true) && !done)
   {
      _parent.streamSound(ljud,who,sync);
      done = true;
   }
};
