class mx.transitions.Tween
{
   static var __initBeacon = mx.transitions.OnEnterFrameBeacon.init();
   static var __initBroadcaster = mx.transitions.BroadcasterMX.initialize(mx.transitions.Tween.prototype,true);
   function Tween(obj, prop, func, begin, finish, duration, useSeconds)
   {
      mx.transitions.OnEnterFrameBeacon.init();
      if(!arguments.length)
      {
         return undefined;
      }
      this.obj = obj;
      this.prop = prop;
      this.begin = begin;
      this.__set__position(begin);
      this.__set__duration(duration);
      this.useSeconds = useSeconds;
      if(func)
      {
         this.func = func;
      }
      this.__set__finish(finish);
      this._listeners = [];
      this.addListener(this);
      this.start();
   }
   function __set__time(t)
   {
      this.prevTime = this._time;
      if(t > this.__get__duration())
      {
         if(this.looping)
         {
            this.rewind(t - this._duration);
            this.update();
            this.broadcastMessage("onMotionLooped",this);
         }
         else
         {
            if(this.useSeconds)
            {
               this._time = this._duration;
               this.update();
            }
            this.stop();
            this.broadcastMessage("onMotionFinished",this);
         }
      }
      else if(t < 0)
      {
         this.rewind();
         this.update();
      }
      else
      {
         this._time = t;
         this.update();
      }
      return this.__get__time();
   }
   function __get__time()
   {
      return this._time;
   }
   function __set__duration(d)
   {
      this._duration = !(d == null || d <= 0)?d:_global.Infinity;
      return this.__get__duration();
   }
   function __get__duration()
   {
      return this._duration;
   }
   function __set__FPS(fps)
   {
      var _loc2_ = this.isPlaying;
      this.stopEnterFrame();
      this._fps = fps;
      if(_loc2_)
      {
         this.startEnterFrame();
      }
      return this.__get__FPS();
   }
   function __get__FPS()
   {
      return this._fps;
   }
   function __set__position(p)
   {
      this.setPosition(p);
      return this.__get__position();
   }
   function setPosition(p)
   {
      this.prevPos = this._pos;
      this.obj[this.prop] = this._pos = p;
      this.broadcastMessage("onMotionChanged",this,this._pos);
      updateAfterEvent();
   }
   function __get__position()
   {
      return this.getPosition();
   }
   function getPosition(t)
   {
      if(t == undefined)
      {
         t = this._time;
      }
      return this.func(t,this.begin,this.change,this._duration);
   }
   function __set__finish(f)
   {
      this.change = f - this.begin;
      return this.__get__finish();
   }
   function __get__finish()
   {
      return this.begin + this.change;
   }
   function continueTo(finish, duration)
   {
      this.begin = this.position;
      this.__set__finish(finish);
      if(duration != undefined)
      {
         this.__set__duration(duration);
      }
      this.start();
   }
   function yoyo()
   {
      this.continueTo(this.begin,this.__get__time());
   }
   function startEnterFrame()
   {
      if(this._fps == undefined)
      {
         _global.MovieClip.addListener(this);
      }
      else
      {
         this._intervalID = setInterval(this,"onEnterFrame",1000 / this._fps);
      }
      this.isPlaying = true;
   }
   function stopEnterFrame()
   {
      if(this._fps == undefined)
      {
         _global.MovieClip.removeListener(this);
      }
      else
      {
         clearInterval(this._intervalID);
      }
      this.isPlaying = false;
   }
   function start()
   {
      this.rewind();
      this.startEnterFrame();
      this.broadcastMessage("onMotionStarted",this);
   }
   function stop()
   {
      this.stopEnterFrame();
      this.broadcastMessage("onMotionStopped",this);
   }
   function resume()
   {
      this.fixTime();
      this.startEnterFrame();
      this.broadcastMessage("onMotionResumed",this);
   }
   function rewind(t)
   {
      this._time = t != undefined?t:0;
      this.fixTime();
      this.update();
   }
   function fforward()
   {
      this.__set__time(this._duration);
      this.fixTime();
   }
   function nextFrame()
   {
      if(this.useSeconds)
      {
         this.__set__time((getTimer() - this._startTime) / 1000);
      }
      else
      {
         this.__set__time(this._time + 1);
      }
   }
   function onEnterFrame()
   {
      this.nextFrame();
   }
   function prevFrame()
   {
      if(!this.useSeconds)
      {
         this.__set__time(this._time - 1);
      }
   }
   function toString()
   {
      return "[Tween]";
   }
   function fixTime()
   {
      if(this.useSeconds)
      {
         this._startTime = getTimer() - this._time * 1000;
      }
   }
   function update()
   {
      this.__set__position(this.getPosition(this._time));
   }
   function func(t, b, c, d)
   {
      return c * t / d + b;
   }
}
