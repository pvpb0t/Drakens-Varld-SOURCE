stop();
_parent["s" + _name.substr(1,1)]._visible = false;
this.onMouseUp = function()
{
   if(this.hitTest(_root._xmouse,_root._ymouse))
   {
      if(_currentframe > 1)
      {
         gotoAndStop(1);
      }
      else
      {
         gotoAndPlay(2);
      }
   }
};
