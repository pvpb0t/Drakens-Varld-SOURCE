this.onEnterFrame = function()
{
   if(tar.hitTest(_parent.man._x,_parent.man._y,true))
   {
      _parent.game.cameFromX = goX;
      _parent.game.cameFromY = goY;
      _parent.fader.play();
      _parent.man.dontWalk = true;
      _parent.manX = manX;
      _parent.manY = manY;
   }
};
tar._visible = false;
