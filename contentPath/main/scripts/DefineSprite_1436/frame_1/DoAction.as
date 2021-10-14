ram._visible = false;
i = 0;
while(i < 6)
{
   attachMovie("butterfly","fly" + i,i);
   this["fly" + i]._x = random(150);
   this["fly" + i]._y = random(150);
   i++;
}
