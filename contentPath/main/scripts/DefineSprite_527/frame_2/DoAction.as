this.onEnterFrame = function()
{
   ampFrame = _parent._parent.stream_s_sync[Math.round(_parent._parent.stream_s.position / 1000 * 36) - 1];
   mun.gotoAndStop(ampFrame + 1);
   if(_parent._parent.stream_s.position >= _parent._parent.stream_s.duration)
   {
      mun.gotoAndStop(1);
   }
};
stop();
