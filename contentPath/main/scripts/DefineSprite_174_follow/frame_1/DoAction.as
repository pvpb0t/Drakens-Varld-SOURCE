stop();
obj.gotoAndPlay(random(obj._totalframes));
tar.onEnterFrame = function()
{
   objCurFrame = obj._currentframe;
   if(_X - oldX < -1)
   {
      gotoAndStop(4);
   }
   else if(oldX - _X < -1)
   {
      gotoAndStop(5);
   }
   else if(_Y < oldY)
   {
      gotoAndStop(3);
   }
   else
   {
      gotoAndStop(2);
   }
   obj.gotoAndPlay(objCurFrame);
   oldX = _X;
   oldY = _Y;
};
