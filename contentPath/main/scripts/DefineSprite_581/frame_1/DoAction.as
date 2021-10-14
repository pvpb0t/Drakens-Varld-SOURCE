i = 0;
this.onEnterFrame = function()
{
   _parent.attachMovie("miniStar_trail","miniStar_trail" + i,i);
   _parent["miniStar_trail" + i]._x = _X + random(20) - 10;
   _parent["miniStar_trail" + i]._y = _Y;
   _parent["miniStar_trail" + i].tween(["_y","_alpha"],[_Y + 100,0],1.5,"easeinsine",undefined,function()
   {
      removeMovieClip(this._parent);
   }
   );
   i++;
};
