this.onEnterFrame = function()
{
   ampFrame = _parent._parent._parent[_parent._parent._parent.curSync][Math.round(_parent._parent._parent.stream_s.position / 1000 * 36) - 1];
   mun.gotoAndStop(ampFrame + 2);
   if(_parent._parent._parent.stream_s.position >= _parent._parent._parent.stream_s.duration)
   {
      mun.gotoAndStop(1);
   }
};
