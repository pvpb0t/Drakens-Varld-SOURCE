function sendForAlgen()
{
   algen.gotoAndStop("walkL");
   algen.tween("_x",520,2,"linear",0,function()
   {
      algen.gotoAndStop("stillL");
      setNew("algen_problem","algen");
      startFadeDown(curTrack,30);
      S_track.onSoundComplete = function()
      {
         startFadeUp(S_bg_track1);
         algen.gotoAndStop("walkR");
         algen.tween("_x",700,2,"linear",0);
      };
   }
   );
}
map._visible = false;
map.gotoAndStop(game.invStar2 + 1);
sten._visible = 1 - game.invStar2;
startFadeUp(S_bg_track1);
safeX = 500;
safeY = 325;
