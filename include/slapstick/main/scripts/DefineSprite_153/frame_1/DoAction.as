this.onEnterFrame = function()
{
   ampFrame = _parent._parent[_parent._parent.curAlgenSync][Math.round(_parent._parent.algen_track.position / 1000 * 36) - 1];
   head.h.mun.gotoAndStop(ampFrame + 1);
   if(_parent._parent.algen_track.position >= _parent._parent.algen_track.duration)
   {
      mun.gotoAndStop(1);
   }
};
head.active = true;
head.play();
