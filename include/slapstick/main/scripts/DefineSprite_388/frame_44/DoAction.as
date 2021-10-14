_parent.setNew_albo("albo_wallet_1");
albo.gotoAndStop(1);
_parent.albo_track.onSoundComplete = function()
{
   play();
   albo.play();
};
stop();
