this.onEnterFrame = function()
{
   ampFrame = _parent._parent["bass" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][2] + "_sync"][Math.round(_parent._parent["S_bass_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][2]].position / 1000 * 36) - 1];
   if(_parent._parent["S_bass_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][2]].position >= _parent._parent["S_bass_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][2]].duration or _parent._parent["S_bass_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][2]] == 0)
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
