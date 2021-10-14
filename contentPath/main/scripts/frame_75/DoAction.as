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
train.setMask(mask);
mask._visible = false;
oak.gotoAndStop(game.invStar1 + 1);
map.gotoAndStop(game.invStar1 + 1);
startFadeUp(S_bg_track1);
train.noSmoke = true;
train.train.tween("_x",1000,12,"linear",random(10));
safeX = 460;
safeY = 250;
