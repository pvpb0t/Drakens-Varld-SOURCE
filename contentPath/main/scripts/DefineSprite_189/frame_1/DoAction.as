this.onEnterFrame = function()
{
   ampFrame = _parent._parent[_parent._parent.curSync][Math.round(_parent._parent.S_track.position / 1000 * 36) - 1];
   gotoAndStop(ampFrame + 1);
   if(_parent._parent.S_track.position >= _parent._parent.S_track.duration)
   {
   }
};
head.active = true;
head.play();
