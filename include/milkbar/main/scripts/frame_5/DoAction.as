function restart()
{
}
function nextClient()
{
   pastChar = this[clientArr[curClient]];
   eval(pastChar).gotoAndStop("walk2");
   pastChar.tween("_x",-300,3,"linear",undefined,function()
   {
      pastChar._x = -200;
      pastChar._y = eval(pastChar + "_startY") - 50;
      pastChar._xscale = pastChar._xscale - 60;
      pastChar._yscale = pastChar._yscale - 60;
      pastChar.swapDepths(1);
      pastChar.gotoAndStop("walk");
      pastChar.tween("_x",eval(pastChar + "_startX") - random(50) - 25,2,"linear",1,function()
      {
         pastChar.gotoAndStop(1);
      }
      );
   }
   );
   clientArr.splice(0,1);
   clientArr.push(pastChar._name);
   this[clientArr[0]].tween(["_xscale","_yscale","_y","_x"],[this[clientArr[0] + "_startS"],this[clientArr[0] + "_startS"],this[clientArr[0] + "_startY"],this[clientArr[0] + "_startX"]],1,"linear",2,function()
   {
      this._parent.swapDepths(4);
      ranDrink();
   }
   );
   this[clientArr[1]].tween(["_xscale","_yscale","_y"],[this[clientArr[1] + "_startS"] - 30,this[clientArr[1] + "_startS"] - 30,this[clientArr[1] + "_startY"] - 25],1,"linear",2.2,function()
   {
      this._parent.swapDepths(3);
   }
   );
}
function ranDrink()
{
   drinkType = random(6) + 2;
   bubble.drink.gotoAndStop(drinkType);
   bubble.tween(["_xscale","_yscale","_alpha"],[100,100,100],2,"easeoutelastic",undefined,undefined,100,1000);
   this[clientArr[0]].gotoAndPlay("drink");
   this["setNew_" + clientArr[curClient]](clientArr[curClient] + "_drink" + (random(3) + 1));
}
function setColor()
{
   if(yel && !red && !blue)
   {
      type = "yellow";
   }
   else if(blue && !red && !yel)
   {
      type = "blue";
   }
   else if(red && !yel && !blue)
   {
      type = "red";
   }
   else if(yel && blue && !red)
   {
      type = "green";
   }
   else if(yel && !blue && red)
   {
      type = "orange";
   }
   else if(!yel && blue && red)
   {
      type = "lila";
   }
   else if(yel && blue && red)
   {
      type = "brown";
   }
   else if(!red && !blue && !yel)
   {
      type = "white";
   }
   arm.drink.gotoAndStop(type);
}
function setNew_albo(ljud)
{
   curAlboSync = ljud + "_sync";
   albo_lipFrame = 0;
   curAlboTalk = ljud;
   albo_track = new Sound(this);
   albo_track.attachSound(curAlboTalk);
   if(ljud.split("_")[1] == "idle1" or ljud.split("_")[1] == "idle2")
   {
      albo_track.setVolume(50);
   }
   albo_track.start();
   albo.albo_head.gotoAndStop(2);
}
function setNew_algen(ljud)
{
   curAlgenSync = ljud + "_sync";
   algen_lipFrame = 0;
   curAlgenTalk = ljud;
   algen_track = new Sound(this);
   algen_track.attachSound(curAlgenTalk);
   if(ljud.split("_")[1] == "idle1" or ljud.split("_")[1] == "idle2")
   {
      algen_track.setVolume(50);
   }
   algen_track.start();
   algen.head.gotoAndStop(2);
}
function setNew_draken(ljud)
{
   curDrakenSync = ljud + "_sync";
   draken_lipFrame = 0;
   curDrakenTalk = ljud;
   draken_track = new Sound(this);
   draken_track.attachSound(curDrakenTalk);
   if(ljud.split("_")[1] == "idle1" or ljud.split("_")[1] == "idle2")
   {
      draken_track.setVolume(50);
   }
   draken_track.start();
   draken.head.gotoAndStop(2);
}
curRight = 0;
curFault = 0;
gameOver = false;
S_lever = new Sound(this);
S_lever.attachSound("lever");
S_maskin = new Sound(this);
S_maskin.attachSound("maskin");
S_arm = new Sound(this);
S_arm.attachSound("arm_s");
S_slut = new Sound(this);
S_slut.attachSound("slut_s");
var red = false;
var yel = false;
var blue = false;
arm_mask._visible = false;
var armGoX = arm._x;
curClient = 0;
clientArr = new Array("draken","algen","albo");
i = 0;
while(i < clientArr.length)
{
   this[clientArr[i] + "_startY"] = this[clientArr[i]]._y;
   this[clientArr[i] + "_startX"] = this[clientArr[i]]._x;
   this[clientArr[i] + "_startS"] = this[clientArr[i]]._xscale;
   i++;
}
this[clientArr[0]].swapDepths(4);
this[clientArr[1]].swapDepths(3);
this[clientArr[2]].swapDepths(1);
clock.swapDepths(2);
albo._xscale = albo._xscale - 60;
albo._yscale = albo._yscale - 60;
albo._y = albo._y - 50;
albo._x = albo._x - (random(50) - 25);
algen._xscale = algen._xscale - 30;
algen._yscale = algen._yscale - 30;
algen._y = algen._y - 25;
algen._x = algen._x - (random(50) - 25);
bord.swapDepths(5);
pipe1.swapDepths(6);
maskin.swapDepths(7);
arm.swapDepths(8);
pipe2.swapDepths(9);
menu.swapDepths(10);
bubble._xscale = 0;
bubble._yscale = 0;
bubble._alpha = 0;
arm._x = arm._x + 224;
maskin.lever.onRelease = function()
{
   S_lever.start();
   clearInterval(slowId);
   menu.menu_1.enabled = false;
   menu.menu_2.enabled = false;
   menu.menu_3.enabled = false;
   arm.drink._visible = true;
   maskin.lever.enabled = false;
   if(blue)
   {
      i = 0;
      while(i < 5)
      {
         berryHolder.attachMovie("berry_blue","berry" + i,i);
         berryHolder["berry" + i]._x = 500 + (random(100) - 50);
         i++;
      }
   }
   if(red)
   {
      i = 5;
      while(i < 10)
      {
         berryHolder.attachMovie("berry_red","berry" + i,i);
         berryHolder["berry" + i]._x = 500 + (random(100) - 50);
         i++;
      }
   }
   if(yel)
   {
      i = 10;
      while(i < 15)
      {
         berryHolder.attachMovie("berry_yel","berry" + i,i);
         berryHolder["berry" + i]._x = 500 + (random(100) - 50);
         i++;
      }
   }
   this.rotateTo(80,1,"easeoutelastic",0,function()
   {
      maskin.lever.rotateTo(0,5,"easeoutexpo",3);
   }
   ,10,200);
   arm.tween("_x",armGoX,1,"easeoutelastic",3,function()
   {
      arm.tween("_x",armGoX + 224,2,"easeoutexpo",3,function()
      {
         maskin.lever.enabled = true;
         menu.menuFun(1,"red",true);
         menu.menuFun(2,"yel",true);
         menu.menuFun(3,"blue",true);
         menu.menu_1.enabled = true;
         menu.menu_2.enabled = true;
         menu.menu_3.enabled = true;
      }
      );
   }
   ,50,200);
   var armId = setInterval(function()
   {
      arm.play();
      S_arm.start();
      clearInterval(armId);
   }
   ,3000);
   var checkDrink = setInterval(function(namn)
   {
      if(bubble.drink._currentframe == arm.drink._currentframe)
      {
         bubble.tween(["_xscale","_yscale","_alpha"],[0,0,0],0.3,"easeoutquint");
         namn._parent._parent[clientArr[curClient]].gotoAndPlay("dricka");
         drinkGoto = "ratt";
         var playDrinkSound = setInterval(function()
         {
            namn._parent._parent["setNew_" + clientArr[curClient]](clientArr[curClient] + "_ratt" + (random(3) + 1));
            clearInterval(playDrinkSound);
         }
         ,1500);
         curRight++;
      }
      else
      {
         namn._parent._parent[clientArr[curClient]].gotoAndPlay("dricka");
         drinkGoto = "fel";
         var playDrinkSound = setInterval(function()
         {
            namn._parent._parent["setNew_" + clientArr[curClient]](clientArr[curClient] + "_fel" + (random(3) + 1));
            clearInterval(playDrinkSound);
         }
         ,1500);
         curFault++;
      }
      clearInterval(checkDrink);
   }
   ,3500,this);
   var pipesId = setInterval(function()
   {
      pipe1.gotoAndPlay(4);
      pipe2.play();
      S_maskin.start(0,20);
      maskin.play();
      clearInterval(pipesId);
   }
   ,1400);
   var pipesId2 = setInterval(function()
   {
      pipe1.gotoAndStop(1);
      pipe2.gotoAndStop(1);
      maskin.gotoAndStop(1);
      S_maskin.stop();
      clearInterval(pipesId2);
   }
   ,2800);
};
this.createEmptyMovieClip("berryHolder",11);
berryHolder.setMask(mask);
arm.setMask(arm_mask);
albo_idle1_sync = [0,0,0,0,1,1,1,1,2,2,2,1,0,0,2,4,3,2,1,0,0,1,1,1,3,5,5,4,3,2,2,2,3,6,8,8,5,3,2,1,0,0,0,0,0,1,3,5,5,5,4,3,2,1,1,1,1,2,3,4,5,5,5,4,3,3,4,5,4,2,1,0,0,0,0,0];
albo_idle2_sync = [0,0,0,0,1,2,3,4,4,2,1,2,2,1,0,0,0,1,2,3,3,2,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,1,2,2,1,1,1,1,1,1,1,1,2,2,1,0,0,2,3,4,4,3,2,2,1,1,2,3,3,3,2,1,0,0,3,6,7,5,3,2,1,0,0,0,0,0,0,0,0,0,0,0,1,4,7,9,9,7,4,2,1,1,1,2,2,1,1,0,0,1,2,4,5,4,2,1,0,0,0,1,1,1,1,2,4,4,2,1,1,0,0,0,0,0,1,2,1,0,0,0,0,0,0];
albo_fel1_sync = [0,0,0,0,0,0,1,2,3,5,5,4,2,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,4,6,6,4,2,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,4,3,2,2,2,2,2,2,4,6,8,9,8,7,6,5,4,2,1,0,0];
albo_fel2_sync = [0,0,0,0,0,0,1,2,2,4,7,9,9,8,6,3,1,0,0,0,0,0,0,0,0,0,1,2,3,3,2,2,2,1,1,1,2,2,2,2,4,5,4,3,1,0,1,3,6,7,5,3,2,1,2,4,5,5,4,2,1,0,0,1,3,3,3,3,3,2,2,1,0,0,0,0,0,1,1,2,2,2,2,1,1,1,1,3,4,4,3,2,1,0,0,0,2,5,6,4,3,2,2,1,0,0,2,3,2,1,0,0,0,1,1,1,1,0,0,0,0,0,0,0];
albo_fel3_sync = [0,0,0,0,0,2,6,8,8,7,6,6,5,4,2,1,0,1,3,6,8,9,8,6,4,2,1,1,2,3,5,5,5,5,4,3,2,1,1,1,2,4,6,6,5,4,3,3,4,4,3,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0];
albo_ratt1_sync = [0,0,1,1,4,8,9,8,6,4,2,1,1,1,1,1,1,1,1,1,1,2,5,7,8,7,5,3,1,0,0,0,0,0,0,0,0,0,0,1,3,4,4,3,2,1,1,1,2,2,2,2,1,0,0,0,0];
albo_ratt2_sync = [0,0,0,0,0,1,2,3,6,8,8,6,3,2,1,0,0,0,1,1,1,0,1,2,2,2,2,2,2,2,4,5,7,8,8,7,7,6,4,3,2,2,2,2,4,6,7,8,9,9,8,7,5,4,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0];
albo_ratt3_sync = [0,0,0,0,1,2,3,4,5,6,5,4,3,3,4,5,5,5,4,3,2,2,1,0,0,0,0,0,0,0,2,3,4,5,6,6,5,4,3,2,1,0,0,0,0,0,1,2,3,3,3,3,2,3,6,7,6,8,8,5,2,1,0,0,0,0,0,0];
albo_drink1_sync = [0,0,0,0,0,1,3,4,4,5,6,5,4,2,1,1,1,3,7,9,8,6,5,4,3,1,0,0,0,0,0,0,0,0,0,0,1,3,5,7,7,6,5,6,6,6,7,6,5,5,5,4,3,3,2,2,1,1,1,1,2,4,5,6,7,9,9,7,4,3,2,1,1,1,0,0,0,0];
albo_drink2_sync = [0,0,0,1,4,7,8,8,7,5,3,1,1,1,1,3,5,6,4,3,4,5,6,5,4,3,2,1,2,4,5,5,4,2,1,0,1,1,0,0,0,0,1,5,7,6,4,2,1,1,1,0,0];
albo_drink3_sync = [0,0,0,0,3,7,8,5,3,3,3,3,2,4,5,4,3,3,3,3,2,1,1,4,6,5,3,2,2,2,3,5,6,7,7,5,3,2,1,1,2,5,6,5,4,2,1,1,1,0];
algen_idle1_sync = [0,0,0,0,0,1,1,1,2,3,4,4,4,5,6,8,9,9,8,6,4,3,1,1,2,4,6,7,7,5,4,3,3,3,3,2,1,3,4,5,5,6,6,5,4,4,3,2,2,3,3,4,5,5,4,4,3,2,3,6,9,9,8,6,5,5,6,7,7,7,6,4,2,2,4,5,7,9,9,7,4,2,1,1,1,2,5,6,6,6,6,6,5,4,3,2,1,0,0,0,0];
algen_idle2_sync = [0,0,1,2,4,5,5,7,8,7,6,5,5,5,5,5,6,7,7,7,7,7,7,7,7,7,7,6,4,2,1,1,2,4,5,5,3,3,5,6,5,3,2,2,4,6,7,7,7,7,6,5,5,5,6,7,7,6,4,2,2,3,4,4,2,2,4,5,6,6,6,6,7,7,7,7,6,4,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,6,8,7,6,6,6,6,7,8,8,8,7,6,4,3,4,5,5,5,5,5,5,5,4,3,2,1,1,2,4,6,7,7,7,7,6,5,5,4,4,3,2,1,0];
algen_fel1_sync = [0,0,0,1,3,4,4,5,6,4,2,4,7,8,9,9,9,7,5,4,3,2,1,3,6,7,7,7,7,7,7,7,8,8,6,4,5,6,6,5,5,6,6,5,5,5,4,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,6,8,8,7,6,5,4,3,3,3,5,6,7,7,7,5,2,4,7,8,7,7,6,6,7,8,9,9,9,8,5,2,1,1,1,2,3,5,6,5,4,3,2,3,5,7,7,5,5,6,7,7,6,6,5,4,3,3,3,3,2,1,0,0,0];
algen_fel2_sync = [0,1,3,5,6,7,7,6,5,5,6,7,7,7,6,5,6,7,6,5,3,1,2,5,7,6,6,5,2,1,0,0,1,4,5,5,5,3,1,1,1,1,1,2,3,3,3,2,2,3,2,1,2,4,5,4,4,4,3,2,3,5,5,5,5,4,4,3,2,2,2,2,1,1,0,0,0];
algen_fel3_sync = [0,0,0,0,0,2,5,7,8,7,7,7,7,6,6,5,4,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,6,7,7,7,6,4,6,8,7,6,6,6,5,4,3,3,3,2,2,2,1,1,1,1,3,6,7,7,7,7,6,5,5,4,3,4,5,5,5,4,3,2,2,3,4,5,5,5,4,3,3,4,5,4,3,2,1,1,3,4,5,6,6,7,6,4,1,0,0,0,1,2,3,3,3,3,3,3,4,5,5,5,5,4,4,5,5,5,4,3,3,4,5,6,6,6,6,6,6,6,5,4,4,4,4,3,2,2,2,2,2,2,1,1,1,0,0,0,0,0,0];
algen_ratt1_sync = [0,0,1,3,4,5,5,6,6,6,6,5,4,3,3,3,2,2,5,8,9,9,9,9,10,8,6,6,6,6,6,5,3,4,7,7,6,6,6,5,4,3,2,1,1,1,1,1,4,8,9,9,6,3,1,0,0,0,2,3,4,5,6,7,7,6,3,1,2,4,4,3,2,3,5,7,8,7,6,5,4,5,6,7,6,5,4,2,1,2,4,6,6,6,5,3,1,1,1,3,5,6,6,5,4,4,3,4,5,6,6,6,4,2,1,1,1,1,2,4,5,6,5,5,4,5,7,7,7,6,4,3,4,5,6,6,6,6,5,4,4,3,3,3,3,2,1,1,0];
algen_ratt2_sync = [0,0,0,3,6,7,7,7,6,3,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,5,6,6,5,4,3,4,7,9,9,8,7,6,5,4,5,5,4,4,4,3,2,3,5,5,5,4,3,3,3,3,2,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,2,4,5,4,3,4,5,5,3,1,3,5,5,5,4,4,4,5,6,6,6,6,6,6,6,4,2,2,2,4,6,6,6,6,6,5,4,5,6,6,6,6,6,5,4,3,3,2,2,1,0,0,0,0];
algen_ratt3_sync = [0,0,0,0,2,4,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,5,5,5,5,5,4,4,3,2,2,1,1,1,0,0,1,1,0,0,0,2,2,1,0,0,0,0,0,1,2,3,5,6,6,7,7,8,8,7,6,6,5,4,3,3,5,5,5,6,7,8,9,9,8,6,4,2,1,1,4,8,9,9,8,8,7,4,2,2,4,7,8,7,5,2,1,1,1,4,8,8,7,7,6,4,2,4,6,7,8,8,8,7,7,6,5,3,1,0,0,0,0,0,0];
algen_drink1_sync = [0,0,0,0,0,1,3,4,5,5,5,5,4,3,4,7,8,9,9,9,9,8,8,8,8,6,5,6,6,6,6,6,7,7,7,5,4,5,5,5,5,5,6,6,4,2,1,3,6,7,6,5,4,5,5,5,6,6,6,5,5,5,4,3,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0,2,5,7,8,8,8,7,6,6,5,6,6,6,6,6,5,3,2,1,2,4,5,6,7,7,7,7,6,4,3,3,5,7,7,7,7,6,7,7,7,6,6,7,7,7,7,5,5,7,7,7,6,4,2,1,1,1,2,2,2,1,0];
algen_drink2_sync = [0,0,0,0,2,6,8,8,7,5,4,3,3,2,3,4,5,5,4,4,3,4,5,5,5,5,5,5,5,4,3,2,2,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,4,6,6,6,5,5,5,5,5,4,2,2,2,2,3,3,3,3,2,1,1,0,1,2,3,4,4,3,2,1,1,2,3,3,3,2,1,1,2,3,4,4,4,4,4,3,3,2,1,0,0,0,0,0,0,0];
algen_drink3_sync = [0,0,2,4,5,6,7,8,7,6,6,6,6,6,6,6,6,4,3,2,1,1,1,0,1,4,6,6,6,6,5,4,4,6,8,8,7,7,7,7,7,7,7,6,4,2,2,4,6,6,6,6,6,6,6,5,3,2,3,5,6,6,5,3,1,1,3,5,6,7,8,7,6,6,6,7,7,7,6,5,6,6,6,5,5,5,4,5,7,8,8,7,4,5,8,8,8,7,5,3,1,1,1,1,1,0,0,0,0,0,0];
draken_idle1_sync = [0,0,0,1,2,3,5,7,8,8,8,7,7,7,6,5,4,2,1,1,2,2,2,3,5,6,7,6,6,5,3,1,2,3,4,3,2,4,6,6,4,2,1,1,4,7,7,7,6,4,3,2,2,1,0,0,0,0,2,4,5,5,4,3,2,1,1,1,1,1,1,0,0,0,0,0];
draken_idle2_sync = [0,0,0,0,0,0,1,3,6,7,7,7,7,6,5,4,3,3,3,3,3,2,2,2,1,1,2,4,6,6,6,6,5,4,3,3,3,3,3,2,2,4,5,5,5,4,5,6,7,7,7,5,2,2,3,6,8,7,6,5,4,3,2,2,2,1,1,1,1,2,3,3,2,1,1,1,1,3,4,4,3,3,3,3,2,1,1,1,1,1,1,1,1,0,0];
draken_fel1_sync = [0,0,0,0,0,0,1,1,1,2,3,3,3,2,2,2,1,1,2,3,4,4,4,3,2,1,0,0,1,2,3,3,3,2,2,2,2,2,2,2,2,1,1,1,3,6,6,5,4,4,4,3,2,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,5,7,7,7,7,6,5,4,3,3,4,4,4,4,5,6,8,8,8,7,5,3,3,3,3,2,2,1,0,1,4,7,7,7,8,8,7,7,6,4,3,4,5,6,7,7,6,5,4,4,4,5,6,5,3,3,4,5,6,7,7,7,6,6,5,5,4,4,4,4,3,4,6,6,5,5,5,4,3,2,2,3,3,3,2,2,2,2,2,2,1,1,1,2,5,6,6,5,4,3,3,3,3,3,2,1,0,0,0,2,3,3,3,2,1,1,1,2,2,2,2,3,4,4,4,3,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0];
draken_fel2_sync = [0,0,0,0,1,3,5,7,7,6,6,7,7,7,6,5,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,4,5,5,5,4,3,4,5,4,5,5,4,3,3,5,8,8,8,7,6,5,4,4,4,4,3,2,2,4,6,6,6,5,4,3,2,2,3,3,3,3,3,4,4,2,1,1,3,4,2,1,1,3,4,5,5,4,4,3,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,2,4,5,5,4,3,2,2,1,1,1,1,3,5,6,8,9,9,8,7,7,7,8,8,8,8,5,2,1,1,1,1,1,1,0];
draken_fel3_sync = [0,0,0,0,1,4,6,7,7,8,9,9,9,8,7,5,2,1,1,2,3,3,4,5,5,6,6,6,5,4,4,3,2,1,0,0,0,0,0,0,0,0,0,0,0,1,1,2,3,3,2,2,3,3,4,4,4,4,4,3,2,2,2,2,2,1,1,2,4,5,5,3,1,0,0,1,1,0,0,0,0,1,2,3,3,2,1,0,0,1,1,1,1,1,1,2,2,2,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0];
draken_ratt1_sync = [0,0,0,1,3,6,8,9,9,9,9,9,9,9,9,8,7,6,6,6,6,6,5,5,4,3,2,1,1,1,2,2,3,4,5,5,5,5,4,3,3,2,1,0,0,0,0,0,1,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,3,5,5,4,3,3,3,3,2,2,2,2,1,1,1,2,2,1,0,0,1,1,1,1,1,2,3,3,2,2,1,1,1,1,1,0,0,0,0,0];
draken_ratt2_sync = [0,0,0,1,2,5,8,9,9,8,8,8,8,8,8,8,7,7,6,5,5,4,3,2,1,1,3,4,5,5,6,7,7,7,6,4,2,1,1,3,4,4,4,4,3,3,3,3,2,1,0,0,0,0,0,2,5,6,6,5,4,3,3,3,2,2,2,1,0,0,0,0,0,0,0,0,0,3,7,7,6,4,2,1,0,0,0,1,2,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,1,3,5,5,5,4,2,1,1,1,0,0,0,0,1,1,1,1,0,0,0];
draken_ratt3_sync = [0,0,0,0,1,3,5,5,5,5,5,4,2,2,3,4,4,4,4,4,4,4,4,3,3,5,7,8,9,10,7,3,1,0,0,0,0,1,3,3,2,2,2,3,6,7,6,6,6,6,6,5,5,4,3,2,2,2,2,2,1,1,1,1,1,1,0,0,0,0,0,1,3,5,5,5,5,5,5,5,5,5,4,2,1,0,0,0,0,0,0,0,0,2,5,7,7,7,6,6,5,5,4,4,3,3,2,2,2,2,2,1,0,0,2,4,5,6,6,6,5,4,3,3,3,3,3,3,2,1,1,1,1,2,2,2,2,2,2,1,1,1,1,1,0,1,1,1,0,0,2,3,3,2,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
draken_drink1_sync = [0,0,0,0,0,0,1,1,1,1,1,3,4,5,5,5,4,3,3,3,2,1,2,3,4,4,4,3,2,1,1,3,4,5,6,6,6,6,6,6,5,5,4,4,4,3,3,4,5,5,5,5,4,4,3,3,3,2,2,2,1,0,0,1,2,4,5,5,5,5,6,5,3,3,3,3,3,3,3,2,1,1,1,2,4,4,3,3,4,4,4,4,4,3,3,3,3,2,1,0,0,2,4,5,4,3,2,3,4,5,7,8,7,7,6,5,4,4,4,3,3,3,3,3,3,3,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,6,8,9,9,8,7,6,6,6,5,5,4,4,4,4,5,7,7,7,6,6,5,4,4,3,2,2,2,3,5,5,5,4,4,4,4,3,3,2,2,1,1,1,1,1,2,3,4,4,3,3,3,4,4,3,2,3,3,3,3,3,5,7,8,7,5,3,2,2,2,2,2,2,2,2,2,3,3,3,3,3,2,1,1,1,1,2,3,3,2,1,1,1,0,0,1,2,2,1,1,1,2,1,0,0,0,0,0,0,0,0,0,0,2,4,5,5,6,6,6,5,3,4,6,6,6,6,6,6,5,5,5,5,5,5,5,4,4,4,4,3,3,3,3,2,2,4,5,4,3,3,3,3,3,2,1,0,0,0,2,3,3,3,2,2,1,1,0,0,0,0,0];
draken_drink2_sync = [0,0,0,0,0,2,4,5,5,5,5,5,5,5,4,3,2,2,3,4,4,4,4,3,3,4,4,4,4,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,3,2,1,1,1,1,0,0,0,1,2,2,2,2,3,3,3,2,2,2,2,1,1,1,0,0,1,2,3,3,3,2,2,4,4,4,3,3,3,3,3,4,5,6,6,5,4,4,3,2,2,2,1,1,1,3,6,6,6,5,5,5,5,5,5,4,4,4,4,4,4,3,3,2,2,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,2,3,3,3,2,2,2,2,2,3,5,7,9,10,9,7,5,4,5,6,5,4,3,3,3,3,3,2,2,2,2,2,1,0,0,1,4,7,7,6,5,4,4,5,5,3,1,0,0,0,2,4,4,4,3,3,3,2,3,4,4,3,2,1,0,0,0,0,1,2,3,3,3,2,2,2,2,1,0,0,0,0];
draken_drink3_sync = [0,0,0,0,0,1,3,3,2,2,1,1,2,3,4,4,4,4,4,3,3,3,3,3,3,3,3,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,4,7,8,7,6,4,3,3,3,3,2,2,1,2,3,3,3,4,4,4,6,8,9,9,9,8,6,5,4,3,1,0,0,0,2,3,3,3,3,2,1,0,2,6,8,7,5,3,2,1,1,2,2,2,2,2,2,3,3,2,2,2,2,2,3,6,7,6,6,7,7,6,4,3,2,2,3,3,2,2,3,3,2,1,0,0,0,0,1,3,5,6,6,4,2,1,1,0,0,0,0,0,0,0,0,1,2,2,2,1,1,1,0,0,0];
albo.stop();
draken.stop();
algen.stop();
algen._x = algen._x - 400;
draken._x = draken._x - 400;
albo._x = albo._x - 400;
albo.gotoAndStop("walk");
algen.gotoAndStop("walk");
draken.gotoAndStop("walk");
maskin.lever.enabled = false;
albo.tween("_x",albo_startX,2,"linear",1.6,function()
{
   gameOver = true;
   ranDrink();
   albo.gotoAndStop(1);
   maskin.lever.enabled = true;
}
);
algen.tween("_x",algen_startX,2,"linear",0.8,function()
{
   algen.gotoAndStop(1);
}
);
draken.tween("_x",draken_startX,2,"linear",0,function()
{
   draken.gotoAndStop(1);
}
);
clock.visare.rotateTo(365,180,"linear",undefined,function()
{
   arm.tween("_x",armGoX + 224,2,"easeoutexpo",undefined,function()
   {
      removeMovieClip(arm);
   }
   );
   draken_track.stop();
   albo_track.stop();
   algen_track.stop();
   S_slut.start();
   maskin.lever.enabled = false;
   bubble.tween(["_xscale","_yscale","_alpha"],[0,0,0],0.3,"easeoutquint");
   var draken_walk = setInterval(function()
   {
      draken.gotoAndStop("walk2");
      clearInterval(draken_walk);
   }
   ,1000);
   var albo_walk = setInterval(function()
   {
      albo.gotoAndStop("walk2");
      clearInterval(albo_walk);
   }
   ,1500);
   var algen_walk = setInterval(function()
   {
      algen.gotoAndStop("walk2");
      clearInterval(algen_walk);
   }
   ,2000);
   draken.tween("_x",-300,2,"linear",1,function()
   {
      draken.removeMovieClip(draken);
   }
   );
   albo.tween("_x",-300,2,"linear",1.5,function()
   {
      albo.removeMovieClip();
   }
   );
   algen.tween("_x",-300,2,"linear",2,function()
   {
      algen.removeMovieClip();
      gotoAndStop("end");
   }
   );
}
);
this.onEnterFrame = function()
{
   if(random(1080) == 0 && !idleBusy && !gameOver)
   {
      ran = random(2) + 1;
      "setNew_" + [clientArr[ran]]([clientArr[ran]] + "_idle" + ran);
      eval(clientArr[ran]).gotoAndPlay("idle");
   }
};
stop();
