class as.glow extends MovieClip
{
   function glow()
   {
      super();
      this._parent.laby.setMask(this);
      this.moveLamp();
   }
   function moveLamp()
   {
      this._x = this._parent.man._x;
      this._y = this._parent.man._y - this._parent.man._height / 2;
      this._parent.lampGlow._x = this._x;
      this._parent.lampGlow._y = this._y;
      this._parent.lampGlow2._x = this._x;
      this._parent.lampGlow2._y = this._y;
      this._parent.lampGlow2._alpha = random(20) + 80;
   }
   function onEnterFrame()
   {
      this.moveLamp();
   }
}
