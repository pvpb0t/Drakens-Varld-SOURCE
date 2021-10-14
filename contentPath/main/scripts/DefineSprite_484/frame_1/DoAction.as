i = 0;
la = 0;
this.onEnterFrame = function()
{
   if(la == 0)
   {
      _parent.attachMovie("miniStar_trail","miniStar_trail" + i,i);
      _parent["miniStar_trail" + i]._x = _X + 20 + random(20) - 10;
      _parent["miniStar_trail" + i]._y = _Y;
      _parent["miniStar_trail" + i].tween(["_y","_alpha"],[_Y + 100,0],1.5,"easeinsine",undefined,function()
      {
         removeMovieClip(this._parent);
      }
      );
      i++;
      la = 1;
   }
   else
   {
      la = 0;
   }
};
