i = this.getNextHighestDepth();
attachMovie("wave","wave" + i,i);
this["wave" + i]._x = random(200) - 10;
this["wave" + i]._y = random(200) - 10;
scale = random(60) + 80;
this["wave" + i]._xscale = random(60) + 80;
this["wave" + i]._yscale = random(60) + 80;
