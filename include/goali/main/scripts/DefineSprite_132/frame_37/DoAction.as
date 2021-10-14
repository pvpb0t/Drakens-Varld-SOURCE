head.play();
_parent.draken_info_track.start();
stop();
_parent.draken_info_track.onSoundComplete = function()
{
   play();
};
