curTile = 1;
var playMusic2 = setInterval(function()
{
   playNextTile(curTile);
   curTile++;
   panel.dioder.gotoAndStop(curTile);
   clearInterval(playMusic2);
}
,100);
var playMusic = setInterval(function()
{
   playNextTile(curTile);
   panel.dioder.gotoAndStop(curTile + 1);
   curTile++;
   if(curTile == 10)
   {
      clearInterval(playMusic);
      endSound();
      bg.gotoAndStop(1);
      panel.dioder.gotoAndStop(1);
      play();
   }
}
,3999);
dancers.dancer1.play();
dancers.dancer2.play();
stop();
