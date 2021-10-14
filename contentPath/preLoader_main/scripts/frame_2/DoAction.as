byt = _parent.getBytesLoaded();
tot = _parent.getBytesTotal();
if(byt < tot)
{
   gotoAndPlay(_currentframe - 1);
}
pro = Math.round(byt / tot * 140);
drakeGoto = pro;
drake.gotoAndStop(drakeGoto);
