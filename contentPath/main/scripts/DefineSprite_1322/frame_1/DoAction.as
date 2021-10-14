drop1 = new Sound(this);
drop2 = new Sound(this);
drop1.attachSound("droppe");
drop2.attachSound("droppe2");
this.onEnterFrame = function()
{
   if(random(50) == 0)
   {
      trace("dripp dropp");
      this["drop" + (random(2) + 1)].start();
   }
};
