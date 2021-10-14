function makeLine(s1, s2)
{
   i++;
   if(i <= starArr.length)
   {
      attachMovie("line","line" + i,i);
      s1.alphaTo(100,0.3,"linear",0,function()
      {
         s1.colorTo(16776960,0.5,"easeoutexpo");
      }
      );
      s2.alphaTo(100,0.3,"linear",0,function()
      {
         s2.colorTo(16776960,0.5,"easeoutexpo");
      }
      );
      eval("line" + i)._x = s1._x;
      eval("line" + i)._y = s1._y;
      eval("line" + i)._yscale = 0;
      temPx = s1._x - s2._x;
      temPy = s1._y - s2._y;
      distance = Math.sqrt(temPx * temPx + temPy * temPy);
      eval("line" + i)._rotation = Math.floor(180 * Math.atan2(s2._y - eval("line" + i)._y,s2._x - eval("line" + i)._x) / 3.141592653589793) + 90;
      eval("line" + i).tween("_yscale",distance,0.2,"easeoutexpo",0,function()
      {
         makeLine(starArr[i][0],starArr[i][1]);
      }
      );
   }
   else
   {
      _parent._parent.pullUpHands();
   }
}
i = 0;
stop();
