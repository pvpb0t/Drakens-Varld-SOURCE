this.onEnterFrame = function()
{
   ampFrame = _parent._parent["amb" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][1] + "_sync"][Math.round(_parent._parent["S_amb_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][1]].position / 1000 * 36) - 1];
   if(_parent._parent["S_amb_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][1]].position >= _parent._parent["S_amb_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][1]].duration or _parent._parent["S_amb_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][1]] == 0)
   {
      gotoAndStop(1);
      _visible = false;
   }
   else
   {
      gotoAndStop(ampFrame + 1);
      _visible = true;
   }
};
