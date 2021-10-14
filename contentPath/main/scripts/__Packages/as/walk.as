class as.walk extends MovieClip
{
   var speed = 3;
   var ticker = 0;
   function walk()
   {
      super();
      this.setCharacter();
   }
   function setCharacter()
   {
      this.char.armR.gotoAndStop(this._parent.torsoType);
      this.char.armL.gotoAndStop(this._parent.torsoType);
      this.char.torso.gotoAndStop(this._parent.torsoType);
      this.char.legR.gotoAndStop(this._parent.legType);
      this.char.legL.gotoAndStop(this._parent.legType);
      this.char.head.gotoAndStop(this._parent.headType);
   }
   function goLeft()
   {
      this._x = this._x - this.speed;
      if(this._x < -10 && this._parent.fader._currentframe)
      {
         this._parent.game.cameFromX = -1;
         this._parent.fader.play();
         this.dontWalk = true;
      }
      this.char.play();
      this.checkHit("l");
   }
   function goRight()
   {
      this._x = this._x + this.speed;
      if(this._x > 610)
      {
         this._parent.game.cameFromX = 1;
         this._parent.fader.play();
         this.dontWalk = true;
      }
      this.char.play();
      this.checkHit("r");
   }
   function goUp()
   {
      this._y = this._y - this.speed;
      if(this._y <= 5)
      {
         this._parent.game.cameFromY = -1;
         this._parent.fader.play();
         this.dontWalk = true;
      }
      this.char.play();
      this.checkHit("u");
   }
   function goDown()
   {
      this._y = this._y + this.speed;
      if(this._y > 410)
      {
         this._parent.game.cameFromY = 1;
         this._parent.fader.play();
         this.dontWalk = true;
      }
      this.char.play();
      this.checkHit("d");
   }
   function checkHit(typ)
   {
      if(!this._parent.map.hitTest(this._x,this._y,true))
      {
         this.startTimer = true;
         if(typ == "l")
         {
            return this._x = this._x + this.speed;
         }
         if(typ == "r")
         {
            return this._x = this._x - this.speed;
         }
         if(typ == "u")
         {
            return this._y = this._y + this.speed;
         }
         if(typ == "d")
         {
            return this._y = this._y - this.speed;
         }
      }
      else
      {
         this.startTimer = false;
      }
   }
   function onEnterFrame()
   {
      if(this._parent.map.hitTest(this._x,this._y,true))
      {
         this.ticker = 0;
         this.lastY = this._y;
         this.lastX = this._x;
         if(Key.isDown(37) && !this.dontWalk)
         {
            this.goLeft();
            this.setCharacter();
         }
         else if(Key.isDown(39) && !this.dontWalk)
         {
            this.goRight();
            this.setCharacter();
         }
         else if(Key.isDown(38) && !this.dontWalk)
         {
            this.goUp();
            this.setCharacter();
         }
         else if(Key.isDown(40) && !this.dontWalk)
         {
            this.goDown();
            this.setCharacter();
         }
         else if(!Key.isDown(32))
         {
            this.char.gotoAndStop(1);
            this.setCharacter();
         }
         this.swapDepths(this._y);
      }
      else
      {
         this.ticker = this.ticker + 1;
         trace("gubben har fastnat");
         if(this.ticker >= 180)
         {
            this._parent.moveOnMan();
            this.ticker = 0;
         }
      }
   }
}
