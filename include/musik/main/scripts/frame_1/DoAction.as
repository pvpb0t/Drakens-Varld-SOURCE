function createSoundObjects(typ)
{
   i = 1;
   while(i < 5)
   {
      this.createEmptyMovieClip("mc_" + typ + i,this.getNextHighestDepth());
      this["S_" + typ + "_" + i] = new Sound(this["mc_" + typ + i]);
      this["S_" + typ + "_" + i].attachSound(typ + i);
      i++;
   }
}
function playTrack(Sobj)
{
   eval(Sobj).start();
}
function playAll()
{
   i = 1;
   while(i < 5)
   {
      this["S_beat_" + i].start(0,8);
      this["S_amb_" + i].start(0,8);
      this["S_bass_" + i].start(0,8);
      this["S_lead_" + i].start(0,8);
      i++;
   }
}
function playNextTile(tileToPlay)
{
   if(this["SoundArr" + tileToPlay][0] == 0 && this["SoundArr" + tileToPlay][1] == 0 && this["SoundArr" + tileToPlay][2] == 0 && this["SoundArr" + tileToPlay][3] == 0)
   {
      clearInterval(playMusic);
      endSound();
      panel.dioder.gotoAndStop(1);
      play();
   }
   else
   {
      if(this["SoundArr" + tileToPlay][0] >= 1)
      {
         this["S_beat_" + this["SoundArr" + tileToPlay][0]].start();
      }
      if(this["SoundArr" + tileToPlay][1] >= 1)
      {
         this["S_amb_" + this["SoundArr" + tileToPlay][1]].start();
      }
      if(this["SoundArr" + tileToPlay][2] >= 1)
      {
         this["S_bass_" + this["SoundArr" + tileToPlay][2]].start();
      }
      if(this["SoundArr" + tileToPlay][3] >= 1)
      {
         this["S_lead_" + this["SoundArr" + tileToPlay][3]].start();
      }
      bg.gotoAndStop(2);
   }
}
function endSound()
{
   i = 1;
   while(i < 5)
   {
      this["S_beat_" + i].stop();
      this["S_amb_" + i].stop();
      this["S_bass_" + i].stop();
      this["S_lead_" + i].stop();
      i++;
   }
}
function setNew_draken(ljud)
{
   curDrakenSync = ljud + "_sync";
   draken_lipFrame = 0;
   curDrakenTalk = ljud;
   draken_track = new Sound(this);
   draken_track.attachSound(curDrakenTalk);
   draken_track.start();
}
MovieClip.prototype.brightnessTo = function(bright, timeSeconds, animType, delay, callback, extra1, extra2)
{
   var _loc3_ = 100 - Math.abs(bright);
   var _loc2_ = 0;
   if(bright > 0)
   {
      _loc2_ = 256 * (bright / 100);
   }
   this.colorTransformTo(_loc3_,_loc2_,_loc3_,_loc2_,_loc3_,_loc2_,undefined,undefined,timeSeconds,animType,delay,callback,extra1,extra2);
};
ASSetPropFlags(MovieClip.prototype,"brightnessTo",1,0);
MovieClip.prototype.tween = function(prop, propDest, timeSeconds, animType, delay, callback, extra1, extra2)
{
   if(timeSeconds < 0.01)
   {
      timeSeconds = 2;
   }
   if(animType == undefined || animType == "")
   {
      animType = "easeOutExpo";
   }
   if(delay == undefined)
   {
      delay = 0;
   }
   if(this.$_tweenPropList == undefined)
   {
      this.$_tweenPropList = new Array();
   }
   if(this.$_tweenIndex == undefined)
   {
      this.$_tweenIndex = 19929;
   }
   var properties = new Array();
   var oldProperties = new Array();
   var newProperties = new Array();
   if(typeof prop == "string")
   {
      properties.unshift(prop);
      oldProperties.unshift(this[prop]);
      newProperties.unshift(propDest);
   }
   else
   {
      for(var i in prop)
      {
         oldProperties.unshift(this[prop[i]]);
      }
      for(var i in prop)
      {
         properties.unshift(prop[i]);
      }
      for(var i in propDest)
      {
         newProperties.unshift(propDest[i]);
      }
   }
   var $_callback_assigned = false;
   if(this.__tweenController__ == undefined)
   {
      var tweenHolder = this.createEmptyMovieClip("__tweenController__",123432);
      tweenHolder.onEnterFrame = function()
      {
         var i = 0;
         while(i < this._parent.$_tweenPropList.length)
         {
            var objProp = this["prop_" + this._parent.$_tweenPropList[i]];
            if(objProp._timeStart + objProp._delay * 1000 <= getTimer())
            {
               if(objProp._timeDest + objProp._delay * 1000 <= getTimer())
               {
                  if(!objProp.ended)
                  {
                     this._parent[objProp._prop] = objProp._propDest;
                     if(objProp._callback != undefined)
                     {
                        this.$_callback = objProp._callback;
                        with(this._parent)
                        {
                           this.$_callback()
                           
                        };
                     }
                     objProp.ended = true;
                  }
                  else
                  {
                     for(var pti in this._parent.$_tweenPropList)
                     {
                        if(this._parent.$_tweenPropList[pti] == objProp._prop)
                        {
                           this._parent.$_tweenPropList.splice(pti,1);
                        }
                     }
                     delete this["prop_" + objProp._prop];
                     if(this._parent.$_tweenPropList.length == 0)
                     {
                        this.removeMovieClip();
                     }
                  }
               }
               else
               {
                  objProp.ended = false;
                  this._parent[objProp._prop] = findTweenValue(objProp._propStart,objProp._propDest,objProp._timeStart,getTimer() - objProp._delay * 1000,objProp._timeDest,objProp._animType,objProp._extra1,objProp._extra2);
               }
            }
            i++;
         }
      };
   }
   else
   {
      var tweenHolder = this.__tweenController__;
   }
   var i = 0;
   while(i < oldProperties.length)
   {
      if(newProperties[i] != undefined)
      {
         if(tweenHolder["prop_" + properties[i]] != undefined)
         {
            delete tweenHolder["prop_" + properties[i]];
         }
         var propTweenExists = false;
         for(var pti in this.$_tweenPropList)
         {
            if(this.$_tweenPropList[pti] == properties[i])
            {
               propTweenExists = true;
            }
         }
         if(!propTweenExists)
         {
            this.$_tweenPropList.push(properties[i]);
         }
         tweenHolder["prop_" + properties[i]] = new Object();
         var objProp = tweenHolder["prop_" + properties[i]];
         objProp._prop = properties[i];
         objProp._propStart = oldProperties[i];
         objProp._propDest = newProperties[i];
         objProp._timeStart = getTimer();
         objProp._timeDest = getTimer() + timeSeconds * 1000;
         objProp._animType = animType;
         objProp._extra1 = extra1;
         objProp._extra2 = extra2;
         objProp._delay = delay;
         objProp._callback = !$_callback_assigned?callback:undefined;
         $_callback_assigned = true;
      }
      i++;
   }
   ASSetPropFlags(this,"$_tweenIndex",1,0);
   ASSetPropFlags(this,"$_tweenPropList",1,0);
};
ASSetPropFlags(MovieClip.prototype,"tween",1,0);
MovieClip.prototype.getTweens = function()
{
   return this.$_tweenPropList.length != undefined?this.$_tweenPropList.length:0;
};
ASSetPropFlags(MovieClip.prototype,"getTweens",1,0);
MovieClip.prototype.isTweening = function()
{
   return this.$_tweenPropList.length <= 0?false:true;
};
ASSetPropFlags(MovieClip.prototype,"isTweening",1,0);
MovieClip.prototype.stopTween = function(props)
{
   switch(typeof props)
   {
      case "string":
         props = [props];
      case "object":
         for(var _loc4_ in props)
         {
            delete this.__tweenController__["prop_" + props[_loc4_]];
            for(var _loc3_ in this.$_tweenPropList)
            {
               if(this.$_tweenPropList[_loc3_] == props[_loc4_])
               {
                  this.$_tweenPropList.splice(_loc3_,1);
               }
            }
         }
         if(this.$_tweenPropList.lenght == 0)
         {
            this.$_tweenPropList = undefined;
            this.__tweenController__.removeMovieClip();
            this.__tweenController_ADVhelper__.removeMovieClip();
         }
         break;
      default:
         for(var _loc4_ in this.$_tweenPropList)
         {
            this.__tweenController_ADVhelper__.removeMovieClip();
            this.__tweenController__.removeMovieClip();
         }
         this.$_tweenPropList = undefined;
         delete this.$_tweenPropList;
   }
};
ASSetPropFlags(MovieClip.prototype,"stopTween",1,0);
MovieClip.prototype.alphaTo = function(propDest_a, timeSeconds, animType, delay, callback, extra1, extra2)
{
   this.tween("_alpha",propDest_a,timeSeconds,animType,delay,callback,extra1,extra2);
};
ASSetPropFlags(MovieClip.prototype,"alphaTo",1,0);
MovieClip.prototype.rotateTo = function(propDest_rotation, timeSeconds, animType, delay, callback, extra1, extra2)
{
   this.tween("_rotation",propDest_rotation,timeSeconds,animType,delay,callback,extra1,extra2);
};
ASSetPropFlags(MovieClip.prototype,"rotateTo",1,0);
MovieClip.prototype.scaleTo = function(propDest_scale, timeSeconds, animType, delay, callback, extra1, extra2)
{
   this.tween(["_xscale","_yscale"],[propDest_scale,propDest_scale],timeSeconds,animType,delay,callback,extra1,extra2);
};
ASSetPropFlags(MovieClip.prototype,"scaleTo",1,0);
MovieClip.prototype.slideTo = function(propDest_x, propDest_y, timeSeconds, animType, delay, callback, extra1, extra2)
{
   this.tween(["_x","_y"],[propDest_x,propDest_y],timeSeconds,animType,delay,callback,extra1,extra2);
};
ASSetPropFlags(MovieClip.prototype,"slideTo",1,0);
MovieClip.prototype.colorTo = function(propDest_color, timeSeconds, animType, delay, callback, extra1, extra2)
{
   var _loc5_ = new Color(this);
   var _loc2_ = _loc5_.getTransform();
   var _loc8_ = _loc2_.aa;
   var _loc6_ = _loc2_.ab;
   var _loc3_ = propDest_color >> 16;
   var _loc9_ = (propDest_color & 65280) >> 8;
   var _loc4_ = propDest_color & 255;
   this.colorTransformTo(0,_loc3_,0,_loc9_,0,_loc4_,_loc8_,_loc6_,timeSeconds,animType,delay,callback,extra1,extra2);
};
ASSetPropFlags(MovieClip.prototype,"colorTo",1,0);
MovieClip.prototype.colorTransformTo = function(propDest_ra, propDest_rb, propDest_ga, propDest_gb, propDest_ba, propDest_bb, propDest_aa, propDest_ab, timeSeconds, animType, delay, callback, extra1, extra2)
{
   var _loc5_ = new Color(this);
   var _loc2_ = _loc5_.getTransform();
   this.$_ADVsetter_ra = _loc2_.ra;
   this.$_ADVsetter_rb = _loc2_.rb;
   this.$_ADVsetter_ga = _loc2_.ga;
   this.$_ADVsetter_gb = _loc2_.gb;
   this.$_ADVsetter_ba = _loc2_.ba;
   this.$_ADVsetter_bb = _loc2_.bb;
   this.$_ADVsetter_aa = _loc2_.aa;
   this.$_ADVsetter_ab = _loc2_.ab;
   this.$_new_ra = propDest_ra;
   this.$_new_rb = propDest_rb;
   this.$_new_ga = propDest_ga;
   this.$_new_gb = propDest_gb;
   this.$_new_ba = propDest_ba;
   this.$_new_bb = propDest_bb;
   this.$_new_aa = propDest_aa;
   this.$_new_ab = propDest_ab;
   this.tween(["$_ADVsetter_ra","$_ADVsetter_rb","$_ADVsetter_ga","$_ADVsetter_gb","$_ADVsetter_ba","$_ADVsetter_bb","$_ADVsetter_aa","$_ADVsetter_ab"],[this.$_new_ra,this.$_new_rb,this.$_new_ga,this.$_new_gb,this.$_new_ba,this.$_new_bb,this.$_new_aa,this.$_new_ab],timeSeconds,animType,delay,callback,extra1,extra2);
   this.__tweenController_ADVhelper__.removeMovieClip();
   this.createEmptyMovieClip("__tweenController_ADVhelper__",123434);
   this.__tweenController_ADVhelper__.onEnterFrame = function()
   {
      var _loc2_ = new Color(this._parent);
      var _loc3_ = {ra:this._parent.$_ADVsetter_ra,rb:this._parent.$_ADVsetter_rb,ga:this._parent.$_ADVsetter_ga,gb:this._parent.$_ADVsetter_gb,ba:this._parent.$_ADVsetter_ba,bb:this._parent.$_ADVsetter_bb,aa:this._parent.$_ADVsetter_aa,ab:this._parent.$_ADVsetter_ab};
      _loc2_.setTransform(_loc3_);
      if(this.$_toDelete)
      {
         delete this._parent.$_ADVsetter_ra;
         delete this._parent.$_ADVsetter_rb;
         delete this._parent.$_ADVsetter_ga;
         delete this._parent.$_ADVsetter_gb;
         delete this._parent.$_ADVsetter_ba;
         delete this._parent.$_ADVsetter_bb;
         delete this._parent.$_ADVsetter_aa;
         delete this._parent.$_ADVsetter_ab;
         delete this._parent.$_new_ra;
         delete this._parent.$_new_rb;
         delete this._parent.$_new_ga;
         delete this._parent.$_new_gb;
         delete this._parent.$_new_ba;
         delete this._parent.$_new_bb;
         delete this._parent.$_new_aa;
         delete this._parent.$_new_ab;
         this.removeMovieClip();
      }
      if((this._parent.$_ADVsetter_ra == this._parent.$_new_ra || this._parent.$_new_ra == undefined) && (this._parent.$_ADVsetter_rb == this._parent.$_new_rb || this._parent.$_new_rb == undefined) && (this._parent.$_ADVsetter_ga == this._parent.$_new_ga || this._parent.$_new_ga == undefined) && (this._parent.$_ADVsetter_gb == this._parent.$_new_gb || this._parent.$_new_gb == undefined) && (this._parent.$_ADVsetter_ba == this._parent.$_new_ba || this._parent.$_new_ba == undefined) && (this._parent.$_ADVsetter_bb == this._parent.$_new_bb || this._parent.$_new_bb == undefined) && (this._parent.$_ADVsetter_aa == this._parent.$_new_aa || this._parent.$_new_aa == undefined) && (this._parent.$_ADVsetter_ab == this._parent.$_new_ab || this._parent.$_new_ab == undefined))
      {
         this.$_toDelete = true;
      }
   };
};
ASSetPropFlags(MovieClip.prototype,"colorTransformTo",1,0);
_global.findTweenValue = function(_propStart, _propDest, _timeStart, _timeNow, _timeDest, _animType, _extra1, _extra2)
{
   var _loc1_ = _timeNow - _timeStart;
   var _loc3_ = _propStart;
   var _loc2_ = _propDest - _propStart;
   var _loc4_ = _timeDest - _timeStart;
   var _loc7_ = _extra1;
   var _loc6_ = _extra2;
   var _loc5_ = _extra1;
   switch(_animType.toLowerCase())
   {
      case "linear":
         return _loc2_ * _loc1_ / _loc4_ + _loc3_;
      case "easeinquad":
         return _loc2_ * (_loc1_ = _loc1_ / _loc4_) * _loc1_ + _loc3_;
      case "easeoutquad":
         return (- _loc2_) * (_loc1_ = _loc1_ / _loc4_) * (_loc1_ - 2) + _loc3_;
      case "easeinoutquad":
         if((_loc1_ = _loc1_ / (_loc4_ / 2)) < 1)
         {
            return _loc2_ / 2 * _loc1_ * _loc1_ + _loc3_;
         }
         return (- _loc2_) / 2 * ((_loc1_ = _loc1_ - 1) * (_loc1_ - 2) - 1) + _loc3_;
      case "easeincubic":
         return _loc2_ * (_loc1_ = _loc1_ / _loc4_) * _loc1_ * _loc1_ + _loc3_;
      case "easeoutcubic":
         return _loc2_ * ((_loc1_ = _loc1_ / _loc4_ - 1) * _loc1_ * _loc1_ + 1) + _loc3_;
      case "easeinoutcubic":
         if((_loc1_ = _loc1_ / (_loc4_ / 2)) < 1)
         {
            return _loc2_ / 2 * _loc1_ * _loc1_ * _loc1_ + _loc3_;
         }
         return _loc2_ / 2 * ((_loc1_ = _loc1_ - 2) * _loc1_ * _loc1_ + 2) + _loc3_;
      case "easeinquart":
         return _loc2_ * (_loc1_ = _loc1_ / _loc4_) * _loc1_ * _loc1_ * _loc1_ + _loc3_;
      case "easeoutquart":
         return (- _loc2_) * ((_loc1_ = _loc1_ / _loc4_ - 1) * _loc1_ * _loc1_ * _loc1_ - 1) + _loc3_;
      case "easeinoutquart":
         if((_loc1_ = _loc1_ / (_loc4_ / 2)) < 1)
         {
            return _loc2_ / 2 * _loc1_ * _loc1_ * _loc1_ * _loc1_ + _loc3_;
         }
         return (- _loc2_) / 2 * ((_loc1_ = _loc1_ - 2) * _loc1_ * _loc1_ * _loc1_ - 2) + _loc3_;
      case "easeinquint":
         return _loc2_ * (_loc1_ = _loc1_ / _loc4_) * _loc1_ * _loc1_ * _loc1_ * _loc1_ + _loc3_;
      case "easeoutquint":
         return _loc2_ * ((_loc1_ = _loc1_ / _loc4_ - 1) * _loc1_ * _loc1_ * _loc1_ * _loc1_ + 1) + _loc3_;
      case "easeinoutquint":
         if((_loc1_ = _loc1_ / (_loc4_ / 2)) < 1)
         {
            return _loc2_ / 2 * _loc1_ * _loc1_ * _loc1_ * _loc1_ * _loc1_ + _loc3_;
         }
         return _loc2_ / 2 * ((_loc1_ = _loc1_ - 2) * _loc1_ * _loc1_ * _loc1_ * _loc1_ + 2) + _loc3_;
      case "easeinsine":
         return (- _loc2_) * Math.cos(_loc1_ / _loc4_ * 1.5707963267948966) + _loc2_ + _loc3_;
      case "easeoutsine":
         return _loc2_ * Math.sin(_loc1_ / _loc4_ * 1.5707963267948966) + _loc3_;
      case "easeinoutsine":
         return (- _loc2_) / 2 * (Math.cos(3.141592653589793 * _loc1_ / _loc4_) - 1) + _loc3_;
      case "easeinexpo":
         return _loc1_ != 0?_loc2_ * Math.pow(2,10 * (_loc1_ / _loc4_ - 1)) + _loc3_:_loc3_;
      case "easeoutexpo":
         return _loc1_ != _loc4_?_loc2_ * (- Math.pow(2,-10 * _loc1_ / _loc4_) + 1) + _loc3_:_loc3_ + _loc2_;
      case "easeinoutexpo":
         if(_loc1_ == 0)
         {
            return _loc3_;
         }
         if(_loc1_ == _loc4_)
         {
            return _loc3_ + _loc2_;
         }
         if((_loc1_ = _loc1_ / (_loc4_ / 2)) < 1)
         {
            return _loc2_ / 2 * Math.pow(2,10 * (_loc1_ - 1)) + _loc3_;
         }
         return _loc2_ / 2 * (- Math.pow(2,-10 * (_loc1_ = _loc1_ - 1)) + 2) + _loc3_;
      case "easeincirc":
         return (- _loc2_) * (Math.sqrt(1 - (_loc1_ = _loc1_ / _loc4_) * _loc1_) - 1) + _loc3_;
      case "easeoutcirc":
         return _loc2_ * Math.sqrt(1 - (_loc1_ = _loc1_ / _loc4_ - 1) * _loc1_) + _loc3_;
      case "easeinoutcirc":
         if((_loc1_ = _loc1_ / (_loc4_ / 2)) < 1)
         {
            return (- _loc2_) / 2 * (Math.sqrt(1 - _loc1_ * _loc1_) - 1) + _loc3_;
         }
         return _loc2_ / 2 * (Math.sqrt(1 - (_loc1_ = _loc1_ - 2) * _loc1_) + 1) + _loc3_;
      case "easeinelastic":
         if(_loc1_ == 0)
         {
            return _loc3_;
         }
         if((_loc1_ = _loc1_ / _loc4_) == 1)
         {
            return _loc3_ + _loc2_;
         }
         if(!_loc6_)
         {
            _loc6_ = _loc4_ * 0.3;
         }
         if(_loc7_ < Math.abs(_loc2_))
         {
            _loc7_ = _loc2_;
            _loc5_ = _loc6_ / 4;
         }
         else
         {
            _loc5_ = _loc6_ / 6.283185307179586 * Math.asin(_loc2_ / _loc7_);
         }
         return - _loc7_ * Math.pow(2,10 * (_loc1_ = _loc1_ - 1)) * Math.sin((_loc1_ * _loc4_ - _loc5_) * 6.283185307179586 / _loc6_) + _loc3_;
      case "easeoutelastic":
         if(_loc1_ == 0)
         {
            return _loc3_;
         }
         if((_loc1_ = _loc1_ / _loc4_) == 1)
         {
            return _loc3_ + _loc2_;
         }
         if(!_loc6_)
         {
            _loc6_ = _loc4_ * 0.3;
         }
         if(_loc7_ < Math.abs(_loc2_))
         {
            _loc7_ = _loc2_;
            _loc5_ = _loc6_ / 4;
         }
         else
         {
            _loc5_ = _loc6_ / 6.283185307179586 * Math.asin(_loc2_ / _loc7_);
         }
         return _loc7_ * Math.pow(2,-10 * _loc1_) * Math.sin((_loc1_ * _loc4_ - _loc5_) * 6.283185307179586 / _loc6_) + _loc2_ + _loc3_;
      case "easeinoutelastic":
         if(_loc1_ == 0)
         {
            return _loc3_;
         }
         if((_loc1_ = _loc1_ / (_loc4_ / 2)) == 2)
         {
            return _loc3_ + _loc2_;
         }
         if(!_loc6_)
         {
            _loc6_ = _loc4_ * 0.44999999999999996;
         }
         if(_loc7_ < Math.abs(_loc2_))
         {
            _loc7_ = _loc2_;
            _loc5_ = _loc6_ / 4;
         }
         else
         {
            _loc5_ = _loc6_ / 6.283185307179586 * Math.asin(_loc2_ / _loc7_);
         }
         if(_loc1_ < 1)
         {
            return -0.5 * (_loc7_ * Math.pow(2,10 * (_loc1_ = _loc1_ - 1)) * Math.sin((_loc1_ * _loc4_ - _loc5_) * 6.283185307179586 / _loc6_)) + _loc3_;
         }
         return _loc7_ * Math.pow(2,-10 * (_loc1_ = _loc1_ - 1)) * Math.sin((_loc1_ * _loc4_ - _loc5_) * 6.283185307179586 / _loc6_) * 0.5 + _loc2_ + _loc3_;
      case "easeinback":
         if(_loc5_ == undefined)
         {
            _loc5_ = 1.70158;
         }
         return _loc2_ * (_loc1_ = _loc1_ / _loc4_) * _loc1_ * ((_loc5_ + 1) * _loc1_ - _loc5_) + _loc3_;
      case "easeoutback":
         if(_loc5_ == undefined)
         {
            _loc5_ = 1.70158;
         }
         return _loc2_ * ((_loc1_ = _loc1_ / _loc4_ - 1) * _loc1_ * ((_loc5_ + 1) * _loc1_ + _loc5_) + 1) + _loc3_;
      case "easeinoutback":
         if(_loc5_ == undefined)
         {
            _loc5_ = 1.70158;
         }
         if((_loc1_ = _loc1_ / (_loc4_ / 2)) < 1)
         {
            return _loc2_ / 2 * (_loc1_ * _loc1_ * (((_loc5_ = _loc5_ * 1.525) + 1) * _loc1_ - _loc5_)) + _loc3_;
         }
         return _loc2_ / 2 * ((_loc1_ = _loc1_ - 2) * _loc1_ * (((_loc5_ = _loc5_ * 1.525) + 1) * _loc1_ + _loc5_) + 2) + _loc3_;
      case "easeinbounce":
         return _loc2_ - findTweenValue(0,_loc2_,0,_loc4_ - _loc1_,_loc4_,"easeOutBounce") + _loc3_;
      case "easeoutbounce":
         if((_loc1_ = _loc1_ / _loc4_) < 0.36363636363636365)
         {
            return _loc2_ * (7.5625 * _loc1_ * _loc1_) + _loc3_;
         }
         if(_loc1_ < 0.7272727272727273)
         {
            return _loc2_ * (7.5625 * (_loc1_ = _loc1_ - 0.5454545454545454) * _loc1_ + 0.75) + _loc3_;
         }
         if(_loc1_ < 0.9090909090909091)
         {
            return _loc2_ * (7.5625 * (_loc1_ = _loc1_ - 0.8181818181818182) * _loc1_ + 0.9375) + _loc3_;
         }
         return _loc2_ * (7.5625 * (_loc1_ = _loc1_ - 0.9545454545454546) * _loc1_ + 0.984375) + _loc3_;
      case "easeinoutbounce":
         if(_loc1_ < _loc4_ / 2)
         {
            return findTweenValue(0,_loc2_,0,_loc1_ * 2,_loc4_,"easeInBounce") * 0.5 + _loc3_;
         }
         return findTweenValue(0,_loc2_,0,_loc1_ * 2 - _loc4_,_loc4_,"easeOutBounce") * 0.5 + _loc2_ * 0.5 + _loc3_;
      default:
   }
};
ASSetPropFlags(_global,"findTweenValue",1,0);
var mp = MovieClip.prototype;
mp.setXskew = function(value)
{
   var _loc7_ = value;
   var _loc8_ = this._yskew;
   if(!this.inner_mc)
   {
      for(var _loc2_ in this)
      {
         if(typeof this[_loc2_] == "movieclip")
         {
            this.inner_mc = this[_loc2_];
            break;
         }
      }
      if(!this.inner_mc)
      {
         return undefined;
      }
      this.inner_mc._rotation = -45;
   }
   var _loc4_ = 0.017453292519943295;
   var _loc6_ = _loc7_ * _loc4_;
   var _loc5_ = _loc8_ * _loc4_;
   var _loc10_ = Math.cos(_loc6_);
   var _loc9_ = Math.cos(_loc5_);
   this._rotation = 45 + (_loc7_ + _loc8_) / 2;
   var _loc3_ = Math.sin(this._rotation * _loc4_) * 0.707106781186547;
   if(!_loc3_)
   {
      _loc3_ = 1.0e-7;
   }
   this._xscale = 100 * (Math.sin(_loc5_) + _loc10_) / _loc3_;
   this._yscale = 100 * (Math.sin(_loc6_) + _loc9_) / _loc3_;
   this.inner_mc._yscale = this.inner_mc._xscale = 50 / _loc9_;
};
ASSetPropFlags(mp,"setXskew",1,0);
mp.getXskew = function()
{
   return this._xskew;
};
ASSetPropFlags(mp,"getXskew",1,0);
mp.setYskew = function(value)
{
   var _loc8_ = this._xskew;
   var _loc9_ = value;
   if(!this.inner_mc)
   {
      for(var _loc2_ in this)
      {
         if(typeof this[_loc2_] == "movieclip")
         {
            this.inner_mc = this[_loc2_];
            break;
         }
      }
      if(!this.inner_mc)
      {
         return undefined;
      }
      this.inner_mc._rotation = -45;
   }
   var _loc4_ = 0.017453292519943295;
   var _loc7_ = _loc8_ * _loc4_;
   var _loc6_ = _loc9_ * _loc4_;
   var _loc5_ = Math.cos(_loc7_);
   var _loc10_ = Math.cos(_loc6_);
   this._rotation = 45 + (_loc8_ + _loc9_) / 2;
   var _loc3_ = Math.sin(this._rotation * _loc4_) * 0.707106781186547;
   if(!_loc3_)
   {
      _loc3_ = 1.0e-7;
   }
   this._xscale = 100 * (Math.sin(_loc6_) + _loc5_) / _loc3_;
   this._yscale = 100 * (Math.sin(_loc7_) + _loc10_) / _loc3_;
   this.inner_mc._yscale = this.inner_mc._xscale = 50 / _loc5_;
};
ASSetPropFlags(mp,"setYskew",1,0);
mp.getYskew = function()
{
   return this._yskew;
};
ASSetPropFlags(mp,"getYskew",1,0);
mp.addProperty("_xskew",mp.getXskew,mp.setXskew);
ASSetPropFlags(mp,"_xskew",1,0);
mp.addProperty("_yskew",mp.getYskew,mp.setYskew);
ASSetPropFlags(mp,"_yskew",1,0);
delete mp;
i = 1;
while(i < 13)
{
   this["SoundArr" + i] = new Array(0,0,0,0);
   i++;
}
createSoundObjects("bass");
createSoundObjects("beat");
createSoundObjects("lead");
createSoundObjects("amb");
beat1_sync = [0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0];
beat2_sync = [0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0];
beat3_sync = [0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
beat4_sync = [0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
draken_info_sync = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,2,2,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3,3,3,2,2,2,3,4,5,5,5,6,6,6,5,5,5,6,6,5,3,2,1,1,3,5,5,5,4,4,4,4,4,3,1,0,1,3,4,5,5,4,4,4,3,3,3,2,1,0,0,0,0,0,2,4,5,5,5,6,6,6,6,6,6,6,6,6,5,3,2,1,2,3,4,5,5,5,5,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,4,3,3,4,5,5,5,4,3,3,3,4,4,4,4,4,4,4,4,4,4,4,3,3,3,2,1,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,2,2,2,3,4,4,4,4,3,3,3,3,3,2,1,1,2,2,3,4,4,4,3,2,2,2,1,0,0,0,1,3,3,3,2,2,3,4,5,5,4,3,3,3,4,4,4,4,3,3,3,3,4,4,4,3,2,2,1,1,1,1,0,0,1,1,1,1,2,2,2,1,1,1,1,0,0,0,0,0,0,0,0,0,1,2,3,4,4,3,2,3,3,3,3,3,4,5,6,7,9,8,5,2,1,0,0,0,0,0,0,0,2,4,4,4,3,2,2,2,3,3,3,3,2,2,4,5,5,4,3,2,1,0,0,0,1,3,4,4,4,4,4,4,4,4,4,3,2,2,2,1,1,1,0,0,1,2,3,3,3,3,2,2,1,1,1,2,3,3,3,3,3,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,2,3,3,3,3,3,2,1,0,0,0,0,1,2,3,4,4,3,1,0,0,1,2,3,2,2,3,3,2,2,2,2,2,2,2,2,2,3,4,4,4,4,3,2,1,2,2,2,2,3,4,5,5,5,5,5,4,4,4,3,3,2,2,2,2,2,2,2,2,1,0,0,1,1,2,3,3,4,4,4,3,2,1,0,0,0,0,0,1,2,2,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,4,5,5,3,1,0,1,2,3,3,3,3,3,3,2,1,1,1,1,1,1,2,3,3,4,4,3,2,1,1,1,1,2,2,3,3,3,2,2,2,3,3,3,3,3,4,4,3,2,2,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,5,8,8,8,7,4,3,3,4,4,3,3,4,4,3,2,2,2,2,2,2,2,1,1,2,3,4,5,4,4,4,5,6,6,6,6,6,6,3,1,0,0,0,0,0,0,0,1,2,3,4,4,4,4,4,4,3,3,3,3,3,3,2,1,1,1,2,2,2,2,2,2,3,4,4,3,2,2,2,2,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,4,5,5,4,2,1,0,0,0,1,3,4,4,4,3,2,2,2,2,1,0,0,1,1,2,3,3,2,2,3,3,2,2,1,1,1,1,1,2,2,2,1,0,0,0,0,0,0,0,0,0,1,3,5,5,5,5,4,3,3,3,3,2,2,2,2,2,2,2,2,2,2,1,1,1,2,3,4,4,3,3,2,1,1,0,0,0,1,1,1,1,2,3,3,3,2,2,2,3,5,5,4,2,1,0,0,0,0,0,0,0,0,0,0,1,2,4,4,4,3,2,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0];
draperi.play();
panel._y = 282;
panel.tween("_y",146,1,"easeoutexpo");
panel.ton1.enabled = false;
panel.ton2.enabled = false;
panel.ton3.enabled = false;
panel.ton4.enabled = false;
panel.btn_playAll.enabled = false;
stop();
