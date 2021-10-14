function nextFish()
{
   this["fish" + random(4)].gotoAndPlay(2);
}
i = 0;
while(i < 5)
{
   this["fish" + i].gotoAndStop("pause");
   i++;
}
nextFish();
