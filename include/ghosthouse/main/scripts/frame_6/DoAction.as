stop();
black.alphaTo(0,2,"easeoutquart");
if(!_parent._parent.turnLandGood)
{
   bg_light.setMask(mask);
   mask._x = _root._xmouse;
   mask._y = _root._ymouse;
   shine._x = _root._xmouse;
   shine._y = _root._ymouse;
   this.onMouseMove = function()
   {
      mask._x = _root._xmouse;
      mask._y = _root._ymouse;
      shine._x = _root._xmouse;
      shine._y = _root._ymouse;
      updateAfterEvent();
   };
}
S_wolves.setVolume(40);
S_bg.setVolume(60);
