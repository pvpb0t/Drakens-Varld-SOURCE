this.onEnterFrame = function()
{
   ampFrame = _parent._parent._parent[_parent._parent._parent.curKossanSync][Math.round(_parent._parent._parent.kossan_track.position / 1000 * 36) - 1];
   mun.gotoAndStop(ampFrame + 1);
   if(_parent._parent._parent.kossan_track.position >= _parent._parent._parent.kossan_track.duration)
   {
      mun.gotoAndStop(1);
      gotoAndStop(1);
   }
};
head.active = true;
head.play();
