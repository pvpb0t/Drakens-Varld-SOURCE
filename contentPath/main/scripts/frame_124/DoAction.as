function sendForKossan()
{
   kossan.gotoAndStop("walkR");
   kossan.tween("_x",80,2,"linear",0,function()
   {
      kossan.gotoAndStop("stillR");
      setNew("kossan_problem","kossan");
      startFadeDown(curTrack,30);
      S_track.onSoundComplete = function()
      {
         startFadeUp(S_bg_track1);
         kossan.gotoAndStop("walkL");
         kossan.tween("_x",-60,2,"linear",0);
      };
   }
   );
}
map._visible = false;
oak.gotoAndStop(game.invStar1 + 1);
map.gotoAndStop(game.invStar1 + 1);
startFadeUp(S_bg_track1);
safeX = 490;
safeY = 125;
