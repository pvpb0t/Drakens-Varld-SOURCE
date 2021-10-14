class as.star extends MovieClip
{
   function star()
   {
      super();
      this.swapDepths(Math.round(this._y));
      this.S_star = new Sound(this);
      this.S_star.attachSound("S_stjarna");
      this._parent.game.deadObjArr.push(this);
   }
   function onEnterFrame()
   {
      if(this.sh._xscale > 0)
      {
         this.sh._xscale = 140 + this.starClip._y;
         this.sh._yscale = this.sh._xscale;
      }
      if(this.sh.hitTest(this._parent.man._x,this._parent.man._y,true) && !this.taken)
      {
         var _loc2_ = new mx.transitions.Tween(this.starClip,"_y",mx.transitions.easing.Regular.easeInOut,this.starClip._y,this.starClip._y - 500,3,true);
         this.starClip.nextFrame();
         this.taken = true;
         this.S_star.start();
         this._parent.startFadeStar();
         this._parent.man.dontWalk = true;
      }
      if(this.starClip._y < -490)
      {
         this._parent.showStar = true;
         this._parent.starType = this.starType;
         this._parent.svartPlatta2.play();
         §§push(this.removeMovieClip());
      }
   }
}
