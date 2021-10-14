star.swapDepths(1000);
S_pussel = new Sound(this);
S_pussel.attachSound("S_pusselbit");
star.tween("_y",-15,6,"easeoutback",undefined,function()
{
   S_pussel.start();
   eval("pusselbit" + _parent._parent.pusselType).alphaTo(100,2,"easeoutexpo",0,function()
   {
      play();
      trace("klar!");
   }
   );
}
);
stop();
trace(_parent._parent.pusselType);
i = _parent._parent.pusselType;
while(i < 9)
{
   this["pusselbit" + i]._alpha = 0;
   i++;
}
if(_parent._parent.pusselType == 8)
{
   stream_s = new Sound();
   stream_s.loadSound(_root.stream_soundPath + "/draken_outro.mp3");
}
