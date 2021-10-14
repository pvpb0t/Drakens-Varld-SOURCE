this.onEnterFrame = function()
{
   ampFrame = _parent._parent[_parent._parent.curSync][Math.round(_parent._parent.S_track.position / 1000 * 36) - 1];
   mun.gotoAndStop(ampFrame + 1);
   if(_parent._parent.S_track.position >= _parent._parent.S_track.duration)
   {
      if(_parent._parent.starStatus != 1)
      {
         if(_parent._parent.starStatus == 2)
         {
         }
      }
      mun.gotoAndStop(1);
      gotoAndStop(1);
   }
};
head.active = true;
head.play();
