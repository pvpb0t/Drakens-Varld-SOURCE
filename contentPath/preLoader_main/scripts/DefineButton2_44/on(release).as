on(release){
   if(torsoType < 6)
   {
      torsoType++;
   }
   else
   {
      torsoType = 1;
   }
   setTorso(torsoType);
}
