class as.deadThings extends MovieClip
{
   function deadThings()
   {
      super();
      this.swapDepths(Math.round(this._y));
      this._parent.game.deadObjArr.push(this);
   }
}
