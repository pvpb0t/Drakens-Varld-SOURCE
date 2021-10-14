map._visible = false;
startFadeUp(S_bg_track2);
if(!been_played_musik or taken_pusselbit1)
{
   pusselbit1._x = 1000;
}
safeX = 110;
safeY = 215;
obj.onEnterFrame = function()
{
   this.swapDepths(Math.round(this._y));
   this.tween(["_x","_y"],[man._x + 50,man._y + 20],1,"linear");
};
obj2.onEnterFrame = function()
{
   this.swapDepths(Math.round(this._y));
   this.tween(["_x","_y"],[obj._x + 20,obj._y - 10],0.5,"linear");
};
obj3.onEnterFrame = function()
{
   this.swapDepths(Math.round(this._y));
   this.tween(["_x","_y"],[obj2._x - 20,obj2._y - 10],0.5,"linear");
};
obj4.onEnterFrame = function()
{
   this.swapDepths(Math.round(this._y));
   this.tween(["_x","_y"],[obj3._x - 20,obj3._y - 10],2,"linear");
};
obj5.onEnterFrame = function()
{
   this.swapDepths(Math.round(this._y));
   this.tween(["_x","_y"],[obj4._x + 20,obj4._y - 10],2,"linear");
};
