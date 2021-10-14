stop();
goX = albo._x;
albo._x = 700;
albo.tween("_x",goX,2.5,"linear",undefined,function()
{
   play();
}
);
