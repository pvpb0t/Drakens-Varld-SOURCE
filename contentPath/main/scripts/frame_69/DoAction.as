function sendForDraken()
{
   draken.gotoAndStop("walkR");
   draken.tween("_x",80,2,"linear",0,function()
   {
      draken.gotoAndStop("stillR");
      setNew("draken_problem","draken");
      startFadeDown(curTrack,30);
      S_track.onSoundComplete = function()
      {
         startFadeUp(S_bg_track1);
         draken.gotoAndStop("walkL");
         draken.tween("_x",-60,2,"linear",0);
      };
   }
   );
}
map._visible = false;
map.gotoAndStop(game.invStar3 + 1);
bro.gotoAndStop(game.invStar3 + 1);
startFadeUp(S_bg_track1);
safeX = 210;
safeY = 350;
