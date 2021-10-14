goX = albo._x;
albo._x = 800;
albo.tween("_x",goX,1.5,"linear",1,function()
{
   play();
}
);
stop();
