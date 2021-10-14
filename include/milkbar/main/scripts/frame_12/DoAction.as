this.onEnterFrame = null;
kossan_startY = kossan._y;
kossan_startX = kossan._x;
kossan._y = 650;
kossan._x = 0;
kossan.swapDepths(11);
menu_play_again.swapDepths(110);
kossan.tween(["_x","_y"],[kossan_startX,kossan_startY],2,"easeoutexpo",0,function()
{
   setNew_kossan("kossan_outro");
   kossan_track.onSoundComplete = function()
   {
      menu_play_again.btn_yes.tween("_y",menu_play_again.btn_yes_Y,1,"easeoutback");
      menu_play_again.btn_no.tween("_y",menu_play_again.btn_no_Y,1,"easeoutback",0.5);
   };
}
);
menu_play_again.btn_yes.onRelease = function()
{
   menu_play_again.btn_yes.tween("_y",200,1,"easeoutback");
   menu_play_again.btn_no.tween("_y",200,1,"easeoutback",0.5);
   kossan.tween(["_x","_y"],[0,650],2,"easeoutexpo",0,function()
   {
      removeMovieClip(kossan);
      removeMovieClip(bord);
      removeMovieClip(pipe1);
      removeMovieClip(maskin);
      removeMovieClip(arm);
      removeMovieClip(pipe2);
      removeMovieClip(menu);
      removeMovieClip(clock);
      removeMovieClip(menu_play_again);
      gotoAndStop("game");
      play();
   }
   );
};
