this.onEnterFrame = function()
{
   ampFrame = _parent._parent["lead" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][3] + "_sync"][Math.round(_parent._parent["S_lead_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][3]].position / 1000 * 36) - 1];
   if(_parent._parent["S_lead_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][3]].position >= _parent._parent["S_lead_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][3]].duration or _parent._parent["S_lead_" + _parent._parent["SoundArr" + (_parent._parent.curTile - 1)][3]] == 0)
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
