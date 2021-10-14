_parent.setNew_draken("draken_prutt3");
_parent.draken_track.onSoundComplete = function()
{
   _parent.setNew_kossan("kossan_prutt3");
   _parent.kossan_track.onSoundComplete = function()
   {
      _parent.tweenDown();
   };
};
stop();
