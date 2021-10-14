i = 0;
curCol = 1;
setColor1 = "0099FF";
setColor2 = "cccccc";
this.onEnterFrame = function()
{
   ampFrame = _parent._parent["beat" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][0] + "_sync"][Math.round(_parent._parent["S_beat_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][0]].position / 1000 * 36) - 1];
   if(ampFrame == 1)
   {
      i++;
      attachMovie("circle","circle" + i,i);
      var my_color = new Color(eval("circle" + i));
      this["circle" + i]._xscale = 0;
      this["circle" + i].gotoAndPlay(this["circle" + (i - 1)]._currentframe);
      this["circle" + i]._yscale = 0;
      if(curCol == 1)
      {
         my_color.setRGB(39423);
         curCol = 2;
      }
      else
      {
         my_color.setRGB(52479);
         curCol = 1;
      }
      this["circle" + i].scaleTo(350,1,"linear",undefined,function()
      {
         var deleteClip = setInterval(function(obj)
         {
            removeMovieClip(obj);
            clearInterval(deleteClip);
         }
         ,500,this._parent);
      }
      );
   }
};
