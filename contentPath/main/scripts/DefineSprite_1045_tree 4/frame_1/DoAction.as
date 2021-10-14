this.onEnterFrame = function()
{
   if(tar.hitTest(_parent.man._x,_parent.man._y,true) && !krona.isTweening() && curY != _parent.man._y)
   {
      curY = _parent.man._y;
      curX = _parent.man._x;
      krona._rotation = 5;
      krona.tween("_rotation",0,2,"easeoutelastic",0,undefined,10,0);
   }
};
tar._visible = false;
stop();
