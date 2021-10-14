i = 1;
while(i < 7)
{
   this["obj" + i + "StartY"] = this["obj" + i]._y;
   this["obj" + i]._y = -300;
   this["obj" + i].tween("_y",this["obj" + i + "StartY"],1,"easeOutbounce",1 / i);
   i++;
}
