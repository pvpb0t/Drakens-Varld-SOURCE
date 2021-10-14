S_hammer = new Sound(this);
S_hammer.attachSound("hammer");
this.onEnterFrame = function()
{
   temPx = _parent.man._x + _X;
   temPy = _parent.man._y + _Y;
   distance = Math.sqrt(temPx * temPx + temPy * temPy);
   S_hammer.setVolume(distance / 800 * 100 - 100);
};
