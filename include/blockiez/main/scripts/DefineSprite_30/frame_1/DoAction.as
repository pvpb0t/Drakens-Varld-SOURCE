i = 1;
var smokeInt = setInterval(function()
{
   i++;
   attachMovie("blockiez_smokeClip","smoke" + i,i);
   eval("smoke" + i)._x = random(40) - 20;
   eval("smoke" + i)._alpha = 30;
   ran = random(2);
   if(ran == 1)
   {
      eval("smoke" + i)._xscale = -100;
   }
}
,500);
this.onUnload = function()
{
   clearInterval(smokeInt);
};
