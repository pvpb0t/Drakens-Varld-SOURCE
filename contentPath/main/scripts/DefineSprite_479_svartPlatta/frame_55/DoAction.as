byt = _parent.gameLoader.loader.getBytesLoaded();
tot = _parent.gameLoader.loader.getBytesTotal();
preLoader.bar._width = byt / tot * 58;
preLoader.kant._x = preLoader.bar._x + preLoader.bar._width;
if(byt < tot)
{
   gotoAndPlay(_currentframe - 1);
}
else
{
   gotoAndStop("loaded");
   play();
}
