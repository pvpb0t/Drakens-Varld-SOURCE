this.onEnterFrame = function()
{
   ampFrame = _parent._parent._parent[_parent._parent._parent.curAlboSync][Math.round(_parent._parent._parent.albo_track.position / 1000 * 36) - 1];
   mun.gotoAndStop(ampFrame + 1);
   if(_parent._parent._parent.albo_track.position >= _parent._parent._parent.albo_track.duration)
   {
      mun.gotoAndStop(1);
   }
};
