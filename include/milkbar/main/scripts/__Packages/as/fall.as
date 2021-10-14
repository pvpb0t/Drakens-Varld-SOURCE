class as.fall extends MovieClip
{
   var fallTime = 0.7;
   var rot = random(20) - 10;
   function fall()
   {
      super();
      var _loc3_ = new mx.transitions.Tween(this,"_y",mx.transitions.easing.Regular.easeIn,- random(200) - 20,200,this.fallTime,true);
      _loc3_.onMotionFinished = function()
      {
      };
   }
   function onEnterFrame()
   {
      this._rotation = this._rotation + this.rot;
      if(this._y > 190)
      {
         §§push(this.removeMovieClip());
      }
   }
}
