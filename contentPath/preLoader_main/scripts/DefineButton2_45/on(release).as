on(release){
   if(torsoType > 1)
   {
      torsoType--;
   }
   else
   {
      torsoType = 6;
   }
   setTorso(torsoType);
}
