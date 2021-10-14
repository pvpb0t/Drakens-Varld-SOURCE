function rot1(who)
{
   this[who].rotateTo(5,1,"easeinoutquad",0,function()
   {
      rot2(who);
   }
   );
}
function rot2(who)
{
   this[who].rotateTo(-5,1,"easeinoutquad",0,function()
   {
      rot1(who);
   }
   );
}
function rot1_init(who)
{
   this["obj" + who].rotateTo(5,1 / who,"easeinoutquad",0,function()
   {
      rot2("obj" + who);
   }
   );
}
i = 1;
while(i < 7)
{
   rot1_init(i);
   i++;
}
