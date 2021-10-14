trace(_parent.game.cameFromX + " XXXXXX");
trace(_parent.game.cameFromY + " YYYYYY");
if(_parent.game.cameFromX == 1)
{
   _parent.man._x = 15;
}
else if(_parent.game.cameFromX == -1)
{
   _parent.man._x = 580;
}
else if(_parent.game.cameFromY == 1)
{
   _parent.man._y = 35;
}
else if(_parent.game.cameFromY == -1)
{
   _parent.man._y = 375;
}
else
{
   _parent.man._x = _parent.manX;
   _parent.man._y = _parent.manY;
   _parent.man.gotoAndStop(4);
}
_parent.game.deleteDeadObj(_parent.game.cameFromX,_parent.game.cameFromY);
_parent.S_track.stop();
_parent.stream_s.stop();
