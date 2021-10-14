class as.hotspot extends MovieClip
{
   var stopCheck = true;
   function hotspot()
   {
      super();
      this.S_hot = new Sound(this);
      this.S_hot.attachSound("S_hotspot");
   }
   function onEnterFrame()
   {
      if(Key.isDown(37) or Key.isDown(39) or Key.isDown(38) or Key.isDown(40))
      {
         this.keyIsDown = true;
      }
      else
      {
         this.keyIsDown = false;
      }
      if(this.keyIsDown)
      {
         if(!this.stopCheck)
         {
            if(this._parent.shine.tar.hitTest(this._parent._parent.man._x,this._parent._parent.man._y,true))
            {
               trace("launch game " + this._parent.gameId);
               this._parent._parent.gameLoadId = this._parent.gameId;
               this._parent._parent.svartPlatta.play();
               this.S_hot.start();
               this._parent._parent.man.dontWalk = true;
               this._parent._parent.manX = this._parent._parent.man._x;
               this._parent._parent.manY = this._parent._parent.man._y + 20;
               this.stopCheck = true;
            }
         }
      }
      else
      {
         this.stopCheck = false;
      }
   }
}
