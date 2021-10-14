function createTrail(sc)
{
   attachMovie("smoke","smoke" + i,this.getNextHighestDepth());
   this["smoke" + i]._x = _parent[boat]._x;
   this["smoke" + i]._y = _parent[boat]._y;
   this["smoke" + i]._rotation = _parent[boat]._rotation;
   scale = random(20) + 60;
   this["smoke" + i]._alpha = _parent[boat].actual_speed * 20;
   this["smoke" + i]._yscale = sc;
   i++;
}
i = 0;
ticker = 0;
this.onEnterFrame = function()
{
   createTrail(100);
   createTrail(-100);
   ticker = 0;
   ticker++;
};
