stop();
introClip.gotoAndStop("end");
setNew(S_order[4],S_char_order[4]);
menu_play_again.btn_yes.onRelease = function()
{
   introClip.algen.removeMovieClip();
   introClip.gotoAndStop(1);
   introClip.draken._visible = false;
   introClip.algen.gotoAndStop("walk2");
   introClip.algen.tween("_x",-200,3,"linear",0,function()
   {
      totScore = 0;
      introClip.algen._xscale = 45;
      introClip.algen._yscale = 45;
      introClip.algen._y = 250;
      introClip.algen.gotoAndStop("walk");
      introClip.algen.tween("_x",150,3,"linear",0,function()
      {
         gotoAndStop(3);
      }
      );
   }
   );
   menu_play_again.btn_yes.tween("_y",200,1,"easeoutback");
   menu_play_again.btn_no.tween("_y",200,1,"easeoutback",0.5);
};
S_track.onSoundComplete = function()
{
   menu_play_again.btn_yes.tween("_y",menu_play_again.btn_yes_Y,1,"easeoutback");
   menu_play_again.btn_no.tween("_y",menu_play_again.btn_no_Y,1,"easeoutback",0.5);
};
