onClipEvent(enterFrame){
   _rotation = _rotation + (oldX - _X) * 10;
   oldX = _X;
}
