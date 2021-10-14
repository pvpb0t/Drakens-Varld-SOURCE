function nextFish()
{
   this["fish" + random(3)].gotoAndPlay(2);
}
i = 0;
while(i < 4)
{
   this["fish" + i].gotoAndStop("pause");
   i++;
}
nextFish();
