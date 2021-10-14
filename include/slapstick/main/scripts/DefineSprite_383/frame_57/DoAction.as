times++;
if(times == 2)
{
   _parent.play();
   stop();
}
else
{
   gotoAndStop("loop");
   play();
}
