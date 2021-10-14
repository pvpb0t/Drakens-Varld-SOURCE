stop();
this.onMouseUp = function()
{
   if(this.hitTest(_root._xmouse,_root._ymouse))
   {
      play();
      _parent.nyckel.tween(["_y","_rotation"],[120,45],2,"easeinquint");
   }
};
