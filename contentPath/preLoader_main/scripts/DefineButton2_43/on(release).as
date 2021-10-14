on(release){
   if(headType < 6)
   {
      headType++;
   }
   else
   {
      headType = 1;
   }
   setHead(headType);
}
