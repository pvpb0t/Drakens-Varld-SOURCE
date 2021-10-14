map._visible = false;
startFadeUp(S_bg_track1);
if(turnLandGood)
{
   for(apa in _root)
   {
      if(apa.toString().substr(0,8) == "instance")
      {
         var my_color = new Color(this[apa]);
         var myColorTransform = {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0,aa:100,ab:0};
         my_color.setTransform(myColorTransform);
      }
   }
   tree1.gotoAndStop(2);
   tree2.gotoAndStop(2);
   tree3.gotoAndStop(2);
   i = 1;
   while(i < 9)
   {
      this["tuva" + i].gotoAndStop(2);
      var my_color = new Color(this["tuva" + i]);
      var myColorTransform = {ra:100,rb:0,ga:100,gb:0,ba:100,bb:0,aa:100,ab:0};
      i++;
   }
   my_color = new Color("road");
   my_color.setRGB(13090647);
}
safeX = 320;
safeY = 230;
