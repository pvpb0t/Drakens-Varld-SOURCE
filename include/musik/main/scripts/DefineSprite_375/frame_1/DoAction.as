function attachTone(tone)
{
   a = this.getNextHighestDepth();
   attachMovie("ton" + tone,"ton" + tone + "_" + a,a);
   curTone = "ton" + tone + "_" + a;
   this[curTone]._x = _xmouse;
   this[curTone]._y = _ymouse;
   startDrag(curTone,1);
}
function getChannel(obj)
{
   if(this[obj].musicType == "beat")
   {
      channel = 0;
   }
   else if(this[obj].musicType == "amb")
   {
      channel = 1;
   }
   else if(this[obj].musicType == "bass")
   {
      channel = 2;
   }
   else if(this[obj].musicType == "lead")
   {
      channel = 3;
   }
   return channel;
}
function makeDrop(obj, drop)
{
   this[obj].tween(["_x","_y"],[this[drop]._x,this[drop]._y],0.5,"easeoutexpo");
   this[drop].busy = true;
   this[obj].musicType = drop.split("_")[1];
   this[obj].tileType = drop.split("_")[2];
   channel = getChannel(obj);
   _parent["SoundArr" + this[obj].tileType][channel] = [this[obj].toneType];
   this[actTone].active = false;
   this[actTone].shine._visible = false;
   actTone = obj;
   this[actTone].active = true;
   this[actTone].shine._visible = true;
}
function fadeBtns()
{
   if(actTone.length > 0)
   {
      btn_play.alphaTo(100,0.2);
      btn_trash.alphaTo(100,0.2,undefined,function()
      {
         btn_dis1._visible = false;
         btn_dis2._visible = false;
      }
      );
      btn_play.enabled = true;
      btn_trash.enabled = true;
   }
   else
   {
      btn_play.alphaTo(0,0.5);
      btn_trash.alphaTo(0,0.5);
      btn_dis1._visible = true;
      btn_dis2._visible = true;
      btn_play.enabled = false;
      btn_trash.enabled = false;
   }
}
function checkNotesSum()
{
   totNotes = 0;
   i = 1;
   while(i < 13)
   {
      a = 0;
      while(a < 4)
      {
         if(_parent["SoundArr" + i][a] != 0)
         {
            totNotes++;
         }
         a++;
      }
      i++;
   }
   if(totNotes > 0)
   {
      btn_playAll.enabled = true;
      btn_playAll.knapp.play();
   }
   else
   {
      btn_playAll.enabled = false;
      btn_playAll.knapp.stop();
   }
}
ton1StartX = ton1._x;
ton1StartY = ton1._y;
ton2StartX = ton2._x;
ton2StartY = ton2._y;
ton3StartX = ton3._x;
ton3StartY = ton3._y;
ton4StartX = ton4._x;
ton4StartY = ton4._y;
var totNotes = 0;
var dropZone;
i = 0;
ton1.onPress = function()
{
   attachTone(1);
};
ton2.onPress = function()
{
   attachTone(2);
};
ton3.onPress = function()
{
   attachTone(3);
};
ton4.onPress = function()
{
   attachTone(4);
};
this.onMouseUp = function()
{
   if(curTone.length > 0)
   {
      this.stopDrag();
      dropZone = this[curTone]._droptarget;
      dropSplit = dropZone.split("/");
      dropTar = dropSplit[dropSplit.length - 1];
      tileNum = dropTar.substr(-1,1);
      if(dropTar == "drop_beat_" + tileNum or dropTar == "drop_lead_" + tileNum or dropTar == "drop_bass_" + tileNum or dropTar == "drop_amb_" + tileNum && !dropTar.busy)
      {
         makeDrop(curTone,dropTar);
      }
      else
      {
         removeMovieClip(curTone);
      }
      curTone = "";
   }
   fadeBtns();
   checkNotesSum();
};
btn_play.onRelease = function()
{
   _parent.playTrack("S_" + eval(actTone).musicType + "_" + eval(actTone).toneType);
};
btn_playAll.onRelease = function()
{
   this._parent.tween("_y",282,1,"easeoutquad",undefined,function()
   {
      _parent.play();
   }
   );
};
btn_trash.onRelease = function()
{
   _parent["SoundArr" + eval(actTone).tileType][getChannel(eval(actTone).musicType)] = 0;
   removeMovieClip(actTone);
   actTone = "";
   fadeBtns();
   checkNotesSum();
};
btn_play._alpha = 0;
btn_trash._alpha = 0;
btn_play.enabled = false;
btn_trash.enabled = false;
