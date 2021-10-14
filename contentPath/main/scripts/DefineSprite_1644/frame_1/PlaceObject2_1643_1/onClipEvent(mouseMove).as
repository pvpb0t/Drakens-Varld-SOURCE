onClipEvent(mouseMove){
   if(this.hitTest(_root._xmouse,_root._ymouse,true))
   {
      active = true;
      play();
   }
   else
   {
      active = false;
   }
}
