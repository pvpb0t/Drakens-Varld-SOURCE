onClipEvent(keyDown){
   K = Key.getCode();
   if(K == 32 && !noPress)
   {
      if(pressId == 0)
      {
         _parent.pil1.stopTween("_x");
         _parent.pil2Fun_a();
         pressId = 1;
      }
      else
      {
         _parent.pil2.stopTween("_y");
         pressId = 0;
         _parent.shootBall();
         _parent.S_shot.start();
         noPress = true;
      }
   }
}
