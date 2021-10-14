function setNew_draken(ljud)
{
   curDrakenSync = ljud + "_sync";
   draken_lipFrame = 0;
   curDrakenTalk = ljud;
   draken_track = new Sound(this);
   draken_track.attachSound(curDrakenTalk);
   draken_track.start();
   draken.head.gotoAndStop(2);
}
function setNew_algen(ljud)
{
   curAlgenSync = ljud + "_sync";
   algen_lipFrame = 0;
   curAlgenTalk = ljud;
   algen_track = new Sound(this);
   algen_track.attachSound(curAlgenTalk);
   algen_track.start();
   algen.head.gotoAndStop(2);
}
draken_end_sync = [0,0,0,2,5,8,9,9,8,7,7,6,5,4,2,1,3,5,6,6,5,4,4,4,4,4,3,2,1,2,3,3,3,3,3,4,5,5,5,4,4,4,4,3,2,1,0,0,1,2,3,5,6,7,7,7,6,5,4,3,2,2,2,3,3,3,3,3,2,1,1,0,0,0,0,2,3,3,3,2,1,0,0,0,0,2,3,4,4,4,3,3,4,5,6,6,5,4,4,4,4,3,2,1,0,0,0,0];
algen_end_sync = [0,0,0,1,2,3,4,6,6,6,6,6,6,6,6,4,2,2,3,4,4,4,4,4,4,4,5,7,7,6,4,3,3,2,1,0,0,0,0,0,0,0,0,0,1,2,3,4,5,4,4,4,4,3,2,1,1,3,4,5,7,8,9,10,10,8,5,2,1,1,2,4,5,5,5,4,3,2,2,3,5,6,6,5,4,3,1,1,2,3,4,4,5,6,7,6,5,5,5,4,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,4,5,6,5,3,2,3,5,5,3,2,1,0,0,1,2,3,3,3,3,3,4,5,5,5,5,5,5,5,4,2,1,1,0];
setNew_algen("algen_end");
algen_track.onSoundComplete = function()
{
   setNew_draken("draken_end");
   draken_track.onSoundComplete = function()
   {
      menu_play_again.btn_yes.tween("_y",menu_play_again.btn_yes_Y,1,"easeoutback");
      menu_play_again.btn_no.tween("_y",menu_play_again.btn_no_Y,1,"easeoutback",0.5);
   };
};
goto = "track1";
