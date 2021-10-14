_parent.setNew_albo("albo_banan1");
albo.gotoAndStop(1);
_parent.albo_track.onSoundComplete = function()
{
   play();
   albo.play();
};
stop();
