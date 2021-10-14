function newDrop(id)
{
   this["drop" + id]._x = random(120);
   this["drop" + id]._y = -20;
   this["drop" + i].i = id;
}
maxDrops = 30;
i = 0;
while(i < maxDrops)
{
   attachMovie("waterFall_drop1","drop" + i,i);
   this["drop" + i]._x = random(120);
   this["drop" + i]._y = random(130);
   scale = random(40) + 60;
   this["drop" + i]._xscale = scale;
   this["drop" + i]._yscale = scale;
   this["drop" + i].i = i;
   i++;
}
