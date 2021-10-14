stop();
draken.gotoAndStop("stillL");
setNew("draken_intro_2","draken");
S_track.onSoundComplete = function()
{
   startFadeUp(S_bg_track2);
   draken.gotoAndStop("walkL");
   draken.tween("_x",-60,3,"linear",0);
};
game.currentSquareX = 3;
game.currentSquareY = 3;
bubble2._xscale = 0;
bubble2._yscale = 0;
bubble2.scaleTo(100,1,"easeoutback",0,function()
{
   bubble2.scaleTo(0,0.5,"easeoutquart",3);
}
);
man.gotoAndStop(3);
safeX = 200;
safeY = 255;
