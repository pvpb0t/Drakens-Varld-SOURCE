function makeMove()
{
   ranW = startX + random(150);
   ranH = startY + random(150);
   this.slideTo(ranW,ranH,4,"linear",0,function()
   {
      makeMove();
   }
   );
}
function initMove()
{
   ranW = random(_parent._width);
   ranH = random(_parent._height);
   this.slideTo(startX + random(150),startY + random(150),4,"linear",1 / random(10) + 0.1,function()
   {
      makeMove();
   }
   );
   gotoAndPlay(random(_totalframes) + 1);
}
startY = _Y;
startX = _X;
initMove();
this.onEnterFrame = function()
{
   temPx = _parent._x + _X - _parent._parent.man._x;
   temPy = _parent._y + _Y - _parent._parent.man._y;
   distance = Math.sqrt(temPx * temPx + temPy * temPy);
   if(distance < 30)
   {
      this.stopTween("_x");
      this.stopTween("_y");
      startY = random(400) - _parent._y;
      startX = random(600) - _parent._x;
      this.slideTo(startX,startY,4,"linear",0,function()
      {
         makeMove();
      }
      );
   }
};
xs = random(2);
gotoAndStop(random(4) + 2);
