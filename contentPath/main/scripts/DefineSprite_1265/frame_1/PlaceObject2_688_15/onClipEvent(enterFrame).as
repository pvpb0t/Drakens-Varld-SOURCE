onClipEvent(enterFrame){
   if(this.hitTest(_parent._parent.man._x,_parent._parent.man._y,true) && Key.isDown(39))
   {
      _parent._parent.man._y = _parent._parent.man._y + 1;
   }
   else if(this.hitTest(_parent._parent.man._x,_parent._parent.man._y,true) && Key.isDown(37))
   {
      _parent._parent.man._y = _parent._parent.man._y - 1;
   }
}
