i = 1;
function removeMe()
{
   clearInterval(trainInt);
   removeMovieClip(this);
}
function moveTrain(s)
{
   if(train._x < 450)
   {
      s.attachMovie("train_smoke","train_smoke" + i,s.getNextHighestDepth());
      s["train_smoke" + i]._y = -54;
      s["train_smoke" + i]._x = train._x + 85;
      scale = random(20) + 60;
      s["train_smoke" + i]._xscale = scale;
      s["train_smoke" + i]._yscale = scale;
      s["train_smoke" + i]._rotation = s["train_smoke" + i]._rotation + (random(20) - 10);
      i++;
   }
   trace("train smoke inteval is on");
   if(train._x > -100 and train._x < -80)
   {
      _parent.bom1.play();
      _parent.bom2.play();
      _parent.map.gotoAndStop(2);
   }
   if(train._x > 480 and train._x < 500)
   {
      _parent.map.gotoAndStop(1);
      _parent.bom1.play();
      _parent.bom2.play();
   }
}
if(!noSmoke)
{
   trainInt = setInterval(moveTrain,100,this);
}
this.onUnload = function()
{
   removeMe();
};
