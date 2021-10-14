onClipEvent(enterFrame){
   _rotation = Math.floor(180 * Math.atan2(_parent._parent._parent.man._y - _parent._parent._y,_parent._parent._parent.man._x - _parent._parent._x) / 3.141592653589793) + 90;
}
