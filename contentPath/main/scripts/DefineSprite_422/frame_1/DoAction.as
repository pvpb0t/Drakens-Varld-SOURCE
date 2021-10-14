function scaleOut()
{
   star.scaleTo(100,2,"easeoutelastic",3,scaleIn,0,0);
}
function scaleIn()
{
   star.scaleTo(0,1,"easeoutexpo",10,scaleOut);
}
function scaleInit()
{
   star.scaleTo(100,2,"easeoutelastic",20 / random(10),scaleIn,0,0);
}
_rotation = random(360);
speed = 5 / random(3) + 2;
this.onEnterFrame = function()
{
   _rotation = _rotation + 2;
};
star._xscale = 0;
star._yscale = 0;
scaleInit();
