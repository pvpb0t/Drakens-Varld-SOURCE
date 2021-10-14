function sendForAlbo()
{
   albo.gotoAndStop("walkL");
   albo.tween("_x",520,2,"linear",0,function()
   {
      albo.gotoAndStop("stillL");
      setNew("albo_problem","albo");
      startFadeDown(curTrack,30);
      S_track.onSoundComplete = function()
      {
         startFadeUp(S_bg_track2);
         albo.gotoAndStop("walkR");
         albo.tween("_x",700,2,"linear",0);
      };
   }
   );
}
map._visible = false;
map.gotoAndStop(game.invStar5 + 1);
dorr.gotoAndStop(game.invStar5 + 1);
startFadeUp(S_bg_track2,100);
safeX = 165;
safeY = 210;
