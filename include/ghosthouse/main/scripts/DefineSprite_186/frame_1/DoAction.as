this.onMouseUp = function()
{
   if(!_parent._parent._parent._parent.turnLandGood && _Y > 100)
   {
      if(this.hitTest(_root._xmouse,_root._ymouse))
      {
         _parent.locker.nextFrame();
      }
   }
};
