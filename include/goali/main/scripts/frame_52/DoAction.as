function shootBall()
{
   goto = "throw" + (random(5) + 1);
   albo.gotoAndStop(goto);
   ball.tween(["_y","_x","_xscale","_yscale"],[cross._y,cross._x,40,40],0.3,"easeoutsine",0,function()
   {
      hit = 0;
      i = 1;
      while(i < 6)
      {
         if(eval("tar" + i).hitTest(ball._x,ball._y + YreConstruktor,true) && eval("tar" + i)._visible && !albo.albo.tar.hitTest(ball._x,ball._y + YreConstruktor,true))
         {
            this._parent._parent["tar" + i]._visible = false;
            goal["hole" + i].play();
            ball.gotoAndStop(1);
            S_goal2.start();
            goalStat = "hit";
            score++;
            if(score == 5)
            {
               stopClock();
            }
            restart();
            break;
         }
         if(albo.albo.tar.hitTest(ball._x,ball._y + YreConstruktor,true))
         {
            playTake = true;
         }
         hit++;
         goalStat = "miss";
         i++;
      }
      if(hit == 5)
      {
         ballGoX = ball._x - ballX;
         if(playTake)
         {
            S_take.start(0.04);
         }
         else
         {
            S_studs.start(0.16);
         }
         playTake = false;
         ball.tween(["_y","_x","_xscale","_yscale"],[ball._y * (pil2._y / 80) - 200,ball._x + ballGoX * 2,100,100],0.2,"linear",0,function()
         {
            ball.gotoAndStop(1);
            restart();
         }
         );
      }
   }
   );
}
function pil1Fun_a()
{
   pil1.tween("_x",490,2,"easeinoutback",undefined,pil1Fun_b,false);
}
function pil1Fun_b()
{
   pil1.tween("_x",240,2,"easeinoutback",undefined,pil1Fun_a,false);
}
function pil2Fun_a()
{
   pil2.tween("_y",220,1.5,"easeinoutback",undefined,pil2Fun_b,false);
}
function pil2Fun_b()
{
   pil2.tween("_y",110,1.5,"easeinoutback",undefined,pil2Fun_a,false);
}
function restart(obj)
{
   ball.stopTween();
   ball._x = ballX;
   ball._y = ballY;
   ball._xscale = 100;
   ball._yscale = 100;
   pil2.tween("_y",pil2Y,0.6,"easeinoutback");
   pil1.tween("_x",pil1X,1,"easeinoutback",undefined,function()
   {
      if(score < 5)
      {
         pil1Fun_a();
         ball.noPress = false;
      }
   }
   );
   ball.play();
}
function checkHit()
{
   var albo_talk = setInterval(function()
   {
      if(goalStat == "hit")
      {
         if(curRatt == 3)
         {
            curRatt = 0;
         }
         curRatt++;
         setNew_albo("albo_ratt" + curRatt);
      }
      else
      {
         if(curFel == 5)
         {
            curFel = 0;
         }
         curFel++;
         setNew_albo("albo_fel" + curFel);
      }
      goalStat = "";
      clearInterval(albo_talk);
   }
   ,5);
}
function startClock()
{
   intSeconds = 0;
   intMinutes = 0;
   strSeconds = 0;
   strMinutes = 0;
   var clockInt = setInterval(function()
   {
      intSeconds++;
      if(intSeconds == 60)
      {
         intMinutes++;
         intSeconds = 0;
      }
      if(intSeconds <= 9)
      {
         strSeconds = "0" + intSeconds;
      }
      else
      {
         strSeconds = intSeconds;
      }
      if(intMinutes <= 9)
      {
         strMinutes = "0" + intMinutes;
      }
      else
      {
         strMinutes = intMinutes;
      }
      if(stopClockVar)
      {
         clearInterval(clockInt);
         stopClockVar = false;
      }
      timer.min2.text = strMinutes.toString().substr(0,1);
      timer.min1.text = strMinutes.toString().substr(1,2);
      timer.sec2.text = strSeconds.toString().substr(0,1);
      timer.sec1.text = strSeconds.toString().substr(1,2);
   }
   ,1000);
}
function stopClock()
{
   stopClockVar = true;
}
ballX = ball._x;
ballY = ball._y;
pil1X = pil1._x;
pil2Y = pil2._y;
curRatt = 0;
curFel = 0;
S_shot = new Sound(this);
S_studs = new Sound(this);
S_take = new Sound(this);
S_goal1 = new Sound(this);
S_goal2 = new Sound(this);
S_shot.attachSound("sound_shot");
S_studs.attachSound("sound_studs");
S_take.attachSound("sound_take");
S_goal2.attachSound("goal2");
score = 0;
ballLeft = 10;
this.onMouseDown = function()
{
};
this.onEnterFrame = function()
{
   cross._x = pil1._x;
   cross._y = pil2._y;
};
this.onMouseDown = function()
{
};
startClock();
restart();
stop();
