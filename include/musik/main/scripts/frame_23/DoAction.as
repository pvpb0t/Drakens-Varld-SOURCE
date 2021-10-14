function randomizeDancers()
{
   ran1 = random(4);
   dancer1 = charArr.splice(ran1,1);
   ran2 = random(3);
   dancer2 = charArr.splice(ran2,1);
   dancers.attachMovie(dancer1,"dancer1",1);
   dancers.dancer1._y = 236;
   dancers.dancer1._x = 200;
   if(dancer1 == "kossan")
   {
      dancers.dancer1._xscale = 69.5;
      dancers.dancer1._yscale = 69.5;
   }
   else
   {
      dancers.dancer1._xscale = 78.5;
      dancers.dancer1._yscale = 78.5;
   }
   dancers.attachMovie(dancer2,"dancer2",2);
   dancers.dancer2._y = 236;
   dancers.dancer2._x = 400;
   if(dancer2 == "kossan")
   {
      dancers.dancer2._xscale = 69.5;
      dancers.dancer2._yscale = 69.5;
   }
   else
   {
      dancers.dancer2._xscale = 78.5;
      dancers.dancer2._yscale = 78.5;
   }
}
charArr = new Array("kossan","draken","algen","albo");
randomizeDancers();
