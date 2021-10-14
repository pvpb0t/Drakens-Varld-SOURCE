speed = _parent.curLetter / 3;
if(speed < 1)
{
   speed = 1;
}
this.onEnterFrame = function()
{
   _Y = _Y + 1;
   if(_Y > 320)
   {
      _parent.removeBad(this);
   }
};
var _x_tween = new mx.transitions.Tween(char,"_x",mx.transitions.easing.Regular.easeInOut,0,random(30) + 40,random(2) + 1,true);
_x_tween.onMotionFinished = function()
{
   _x_tween.yoyo();
};
