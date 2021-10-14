_parent.setNew_albo("albo_banan2");
albo.gotoAndStop(1);
_parent.albo_track.onSoundComplete = function()
{
   play();
   albo.play();
};
stop();
