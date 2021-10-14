_parent.setNew_kossan("kossan_prutt1");
stop();
_parent.kossan_track.onSoundComplete = function()
{
   _parent.setNew_draken("draken_prutt1");
   _parent.draken_track.onSoundComplete = function()
   {
      _parent.setNew_kossan("kossan_prutt2");
      _parent.kossan_track.onSoundComplete = function()
      {
         _parent.setNew_draken("draken_prutt2");
         _parent.draken_track.onSoundComplete = function()
         {
            play();
         };
      };
   };
};
