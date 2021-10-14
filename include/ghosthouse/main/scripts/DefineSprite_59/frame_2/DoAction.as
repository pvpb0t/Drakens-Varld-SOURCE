this.onEnterFrame = function()
{
   ampFrame = _parent._parent.draken_info_sync[Math.round(_parent._parent.draken_info_track.position / 1000 * 36) - 1];
   mun.gotoAndStop(ampFrame + 1);
   if(_parent._parent.draken_info_track.position >= _parent._parent.draken_info_track.duration)
   {
      mun.gotoAndStop(1);
   }
};
stop();
