function restart()
{
   slingshot.tween("_x",0,4,"easeinoutquad");
   bg.tween("_x",0,4,"easeinoutquad");
   bg2.tween("_x",0,4,"easeinoutquad");
   para3.tween("_x",0,4,"easeinoutquad");
   bg3.tween("_x",0,4,"easeinoutquad");
   para2.tween("_x",0,4,"easeinoutquad");
   para1.tween("_x",0,4,"easeinoutquad");
   trad.tween("_x",tunnaStartX,4,"easeinoutquad",undefined,function()
   {
      landed = false;
   }
   );
   slingshot.slingshot.gotoAndStop(1);
   slingshot.slingshot._x = slingshotX;
   slingshot.slingshot._y = slingshotY;
   flying = false;
}
slingshot.createEmptyMovieClip("line1",5);
slingshot.createEmptyMovieClip("line2",2);
slingshot.s_bak.swapDepths(1);
slingshot.s_fram.swapDepths(4);
slingshot.slingshot.swapDepths(3);
slingshotX = slingshot.slingshot._x;
slingshotY = slingshot.slingshot._y;
flying = false;
trad._x = random(2000) + 1000;
tunnaStartX = trad._x;
slingshot.slingshot.onMouseDown = function()
{
   if(this.hitTest(_root._xmouse,_root._ymouse))
   {
      drag = true;
      this.stopTween(["_x","_y"]);
      startDrag(this,0,2,0,400,240);
   }
};
slingshot.slingshot.onMouseMove = function()
{
   if(drag)
   {
      this._rotation = Math.floor(180 * Math.atan2(this._y - 23,this._x - 455) / 3.141592653589793) + 220;
      this.head._rotation = this._rotation - 70;
      updateAfterEvent();
      temPx = this._x - 455;
      temPy = this._y - 23;
      speed = 450 - this._x;
   }
};
slingshot.slingshot.onMouseUp = function()
{
   if(drag)
   {
      drag = false;
      stopDrag();
      shotAngle = this._y;
      this.tween(["_x","_y"],[455,43],1,"easeoutelastic",0,undefined,0,0);
   }
};
slingshot.slingshot.onEnterFrame = function()
{
   slingshot.sh._x = this._x;
   slingshot.sh._xscale = this._y / 2;
   slingshot.sh._yscale = this._y / 2;
   slingshot.sh._alpha = this._y / 3 + 25;
   slingshot.line1.clear();
   if(this._x >= 455)
   {
      if(!flying)
      {
         this.play();
         attachMovie("alg","alg",9);
         attachMovie("skugga","skugga",8);
         alg._x = 455 + speed / 10;
         alg._y = this._y - this._height / 5;
         skugga._y = 300;
         skugga._x = alg._x;
         flying = true;
         _parent.playSound("boing");
      }
   }
   with(slingshot.line1)
   {
      lineStyle(5,0,100)
      moveTo(slingshot.slingshot._x,slingshot.slingshot._y)
      lineTo(502,63)
      
   };
   slingshot.line2.clear();
   with(slingshot.line2)
   {
      lineStyle(5,0,100)
      moveTo(slingshot.slingshot._x,slingshot.slingshot._y)
      lineTo(399,56)
      
   };
};
slingshot.tween("_x",- trad._x + 200,4,"easeinoutquad");
bg.tween("_x",- trad._x + 200,4,"easeinoutquad");
bg2.tween("_x",- trad._x / 2,4,"easeinoutquad");
para3.tween("_x",- trad._x / 2,4,"easeinoutquad");
bg3.tween("_x",- trad._x / 3,4,"easeinoutquad");
para2.tween("_x",- trad._x / 3,4,"easeinoutquad");
para1.tween("_x",- trad._x / 6,4,"easeinoutquad");
trad.tween("_x",200,4,"easeinoutquad",undefined,function()
{
   slingshot.tween("_x",0,4,"easeinoutquad");
   bg.tween("_x",0,4,"easeinoutquad");
   bg2.tween("_x",0,4,"easeinoutquad");
   para3.tween("_x",0,4,"easeinoutquad");
   bg3.tween("_x",0,4,"easeinoutquad");
   para2.tween("_x",0,4,"easeinoutquad");
   para1.tween("_x",0,4,"easeinoutquad");
   trad.tween("_x",tunnaStartX,4,"easeinoutquad");
}
);
stop();
