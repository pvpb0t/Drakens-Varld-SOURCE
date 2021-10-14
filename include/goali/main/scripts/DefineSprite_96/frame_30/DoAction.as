if(_parent._parent.score < 5)
{
   _parent._parent.checkHit();
   _parent.gotoAndStop("idle");
}
else
{
   _parent._parent.play();
}
