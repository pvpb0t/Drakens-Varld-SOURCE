albo.gotoAndStop("intro");
setNew_albo("albo_outro" + (random(3) + 1));
menu_play_again.btn_yes.onRelease = function()
{
   timer.min2.text = 0;
   timer.min1.text = 0;
   timer.sec2.text = 0;
   timer.sec1.text = 0;
   i = 1;
   while(i < 6)
   {
      goal["hole" + i].play();
      i++;
   }
   menu_play_again.btn_yes.tween("_y",200,1,"easeoutback");
   menu_play_again.btn_no.tween("_y",200,1,"easeoutback",0.5,function()
   {
      gotoAndStop("restart");
      play();
   }
   );
};
albo_track.onSoundComplete = function()
{
   menu_play_again.btn_yes.tween("_y",menu_play_again.btn_yes_Y,1,"easeoutback");
   menu_play_again.btn_no.tween("_y",menu_play_again.btn_no_Y,1,"easeoutback",0.5);
};
stop();
