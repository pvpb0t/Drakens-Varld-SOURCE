function startFadeDown(trD, vol)
{
   var SoundFadeInt = setInterval(function()
   {
      if(trD.getVolume() > vol)
      {
         trD.setVolume(trD.getVolume() - 10);
      }
      trace("fadeDown InterVal is On");
      trace(trD.getVolume());
      if(trD.getVolume() == undefined)
      {
         clearInterval(SoundFadeInt);
      }
      if(trD.getVolume() == vol)
      {
         clearInterval(SoundFadeInt);
         if(trD.getVolume() == 0)
         {
            curTrack = undefined;
            trD.stop();
         }
      }
   }
   ,10);
}
function startFadeUp(trU)
{
   noMusicTrack = trU;
   if(trU != curTrack && !noMusic)
   {
      if(curTrack != undefined)
      {
         startFadeDown(curTrack,0);
      }
      if(trU != S_bg_track3)
      {
         trU.start(curTrack.position / 1000);
         trU.onSoundComplete = function()
         {
            trU.start(0,9999);
         };
      }
      else
      {
         trU.start(0,9999);
      }
      trU.setVolume(0);
      var SoundFadeUpInt = setInterval(function()
      {
         trU.setVolume(trU.getVolume() + 10);
         trace("fadeUp InterVal is On");
         if(trU.getVolume() > 100)
         {
            trU.setVolume(100);
            clearInterval(SoundFadeUpInt);
         }
         trace(trU.getVolume());
         if(trU.getVolume() == 100)
         {
            clearInterval(SoundFadeUpInt);
            curTrack = trU;
         }
      }
      ,10);
   }
   else if(trU.getVolume() < 100)
   {
      var SoundFadeUpInt = setInterval(function()
      {
         trU.setVolume(trU.getVolume() + 10);
         trace("fadeUp 2 InterVal is On");
         trace(trU.getVolume());
         if(trU.getVolume() == 100)
         {
            clearInterval(SoundFadeUpInt);
            curTrack = trU;
         }
      }
      ,10);
   }
}
function setNew(ljud, who)
{
   curSync = ljud + "_sync";
   this[who + "_lipFrame"] = 0;
   curTalk = ljud;
   S_track = new Sound(this);
   S_track.attachSound(curTalk);
   S_track.start();
   trace(S_track);
   this[who][who].head.gotoAndStop(2);
}
function streamSound(file, who, sync)
{
   stream_s = new Sound(streamClip);
   stream_s.loadSound(_root.stream_soundPath + "/" + file,true);
   if(who != undefined)
   {
      curSync = sync + "_sync";
      this[who].head.gotoAndStop(2);
   }
}
function streamSound_blockiez(file, sync)
{
   stream_s = new Sound(streamClip);
   stream_s.loadSound(_root.stream_soundPath + "/" + file,true);
   curSync = sync + "_sync";
}
function startFadeStar()
{
   S_star.start(0,9999);
   S_star.setVolume(0);
   var StarFadeUpInt = setInterval(function()
   {
      S_star.setVolume(S_star.getVolume() + 5);
      trace("fadeUp Star InterVal is On");
      trace(S_star.getVolume());
      if(S_star.getVolume() == 30)
      {
         clearInterval(StarFadeUpInt);
      }
   }
   ,100);
}
function startFadeStar_down()
{
   var StarFadeDownInt = setInterval(function()
   {
      S_star.setVolume(S_star.getVolume() - 10);
      trace("fadeDown Star InterVal is On");
      trace(S_star.getVolume());
      if(S_star.getVolume() == 0)
      {
         clearInterval(StarFadeDownInt);
      }
   }
   ,100);
}
function moveOnMan()
{
   man.alphaTo(0,0.5,"easeoutquad",0,function()
   {
      man._x = safeX;
      man._y = safeY;
      man.alphaTo(100,0.5,"easeoutquad",0.3);
   }
   );
}
game = new as.game(this);
manX = 257;
manY = 240;
pusselType = 0;
noMusic = false;
SHold.createEmptyMovieClip("bgSound1",SHold.getNextHighestDepth());
SHold.createEmptyMovieClip("bgSound2",SHold.getNextHighestDepth());
SHold.createEmptyMovieClip("bgSound3",SHold.getNextHighestDepth());
SHold.createEmptyMovieClip("bgSound4",SHold.getNextHighestDepth());
S_bg_track1 = new Sound(SHold.bgSound1);
S_bg_track1.attachSound("S_bg1");
S_bg_track2 = new Sound(SHold.bgSound2);
S_bg_track2.attachSound("S_bg2");
S_bg_track3 = new Sound(SHold.bgSound3);
S_bg_track3.attachSound("S_blockiez");
S_bg_track4 = new Sound(SHold.bgSound4);
S_bg_track4.attachSound("S_bg3");
albo_problem_sync = [0,0,0,0,0,0,1,2,4,6,7,7,6,5,5,5,5,4,3,2,1,1,2,3,5,5,4,3,2,2,2,3,4,4,4,3,2,2,3,2,2,2,2,3,3,3,3,2,2,2,2,2,2,2,1,0,0,0,0,0,0,1,1,2,3,3,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,2,2,2,1,1,1,1,1,2,3,3,3,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,2,4,5,5,4,2,1,1,1,1,1,2,3,3,2,1,0,0,0,0,0,0,0,0,0,1,1,1,2,2,2,2,3,3,2,2,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,4,8,8,5,3,3,2,2,2,1,2,2,2,3,5,6,6,4,2,1,1,3,5,5,4,4,4,3,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,3,4,3,2,2,2,1,1,1,1,1,1,1,1,1,1,2,3,3,2,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,1,2,2,3,3,2,1,0,0,0];
draken_problem_sync = [0,0,0,0,0,1,3,3,2,2,1,1,1,1,1,1,1,0,0,1,3,5,6,6,6,5,3,1,1,1,2,3,5,5,4,2,1,1,0,1,3,4,4,4,4,4,3,3,2,2,1,1,1,3,5,6,6,6,6,5,4,3,3,3,3,3,2,1,0,0,0,0,0,1,2,3,3,4,5,4,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,4,4,4,4,4,4,3,3,3,2,2,2,2,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,4,6,7,6,4,2,1,0,0,0,0,2,6,9,9,7,5,3,1,0,0,0,1,2,2,2,2,2,2,2,2,1,0,0,0,1,2,3,3,3,2,2,1,0,0,0,0,0,0,1,3,5,7,8,8,8,7,6,5,5,4,3,2,2,2,2,2,2,2,3,5,6,6,5,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,1,2,2,3,4,4,4,3,3,3,2,2,2,2,2,1,1,1,3,4,4,3,1,0,0,1,2,3,4,4,3,2,1,0,0,0,0,0,0,1,1,1,2,2,2,2,2,2,2,2,2,2,2,1,1,1,0,0,0,0,1,2,3,3,3,3,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,1,1,1,1,0,0,0,0,0,2,4,4,5,5,4,3,2,2,2,2,2,1,1,2,2,2,2,2,2,3,3,2,1,1,1,1,1,1,1,1,0,0,0];
draken_intro_2_sync = [0,0,3,7,9,9,9,9,7,5,4,4,4,4,3,2,1,2,4,5,6,6,5,4,4,4,3,2,1,1,0,1,2,3,5,7,7,6,5,5,5,6,6,5,2,2,3,3,5,8,8,7,5,4,4,4,4,4,5,6,6,5,4,3,3,2,1,0,1,5,7,8,8,8,8,6,3,2,2,4,4,4,6,6,5,2,1,2,4,5,4,3,1,0,0,2,4,5,6,6,6,6,6,6,6,6,5,5,5,7,7,7,5,3,3,3,3,3,3,3,3,2,1,1,1,2,3,3,2,2,4,4,4,3,3,3,2,2,2,3,3,2,1,0,0,0];
kossan_problem_sync = [0,0,0,1,2,3,4,5,6,6,5,4,4,3,2,1,1,1,0,2,5,7,6,5,3,1,0,0,0,0,1,2,3,5,5,5,4,3,2,1,1,2,2,3,3,3,2,1,1,0,0,0,0,1,1,2,3,4,5,5,4,3,3,3,4,3,2,1,1,3,5,6,6,4,3,2,2,2,2,3,4,5,6,5,3,2,1,0,0,0,0,1,2,1,1,1,2,5,6,4,3,2,2,3,4,4,2,3,7,9,8,6,3,1,0,0,1,2,2,2,1,0,0,0,0];
algen_problem_sync = [0,0,0,1,1,3,6,7,7,5,2,3,6,7,5,6,8,8,6,5,5,4,3,4,6,7,7,7,7,7,5,5,7,8,8,6,4,6,8,7,6,5,5,6,6,5,5,4,3,3,2,1,0,0,0,0,1,1,3,5,5,5,4,4,5,6,6,7,7,7,4,2,1,1,2,4,4,2,2,3,4,4,5,4,4,5,6,5,4,2,2,3,4,4,3,4,4,4,3,2,2,2,2,3,3,2,1,1,1,3,5,5,4,3,2,1,1,2,3,3,3,4,5,5,5,5,6,5,4,3,3,2,1,1,0,0,0,0,0,0,0,0,0,2,4,5,5,4,4,5,4,3,4,6,6,5,5,5,5,6,6,6,6,5,5,4,3,2,4,6,6,4,2,1,0,0,0,1,3,5,6,6,4,2,2,3,4,5,5,3,2,3,4,4,3,4,5,5,5,5,5,5,4,4,3,3,3,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,1,3,6,7,8,7,5,2,2,5,8,8,7,6,6,6,5,4,4,5,6,7,6,5,3,1,1,3,7,9,8,6,6,7,6,4,3,4,6,6,6,7,8,8,7,5,6,8,8,7,7,7,6,5,3,2,2,1,1,0,0,0];
albo_idle_sync = [0,0,0,1,3,5,6,4,1,0,0,0,0,2,4,6,5,2,1,1,1,2,2,2,3,3,2,1,0,0,0,1,2,2,2,1,0,1,1,1,1,1,1,0,0,1,3,3,1,0,0,1,1,1,2,2,2,2,1,1,0,0,0,1,2,2,1,1,1,1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1,0,0,1,3,4,3,1,0,0,0,0,0,0,0,0,0,0,0,1,3,5,4,2,1,0,0,1,2,3,5,5,5,5,4,2,1,1,1,0,0,0,0,1,2,2,2,1,1,1,1,2,4,5,4,3,2,1,0,0,0,0,0,0,0,0,1,3,6,8,6,3,1,0,0,0,0,0,0,0,1,3,5,5,3,2,1,1,2,3,3,2,1,0,0,0,0,1,2,3,2,3,4,4,3,3,2,1,0,0,0,1,2,2,2,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,2,4,3,1,0,0,0,0,1,1,1,2,3,4,4,3,2,1,1,0,0,0,0,0,1,3,4,3,2,2,1,1,1,3,6,8,8,7,4,2,1,0,0,0,0,0,0,0,0,0,0,1,2,3,3,2,1,0,0,0,0,0,1,3,5,6,6,5,4,3,2,1,1,0,0,0,1,1,1,1,1,2,5,8,7,6,6,5,3,2,1,1,2,1,0,0,0,0,1,2,3,4,5,6,6,6,5,5,4,4,4,3,2,1,0,0,0,0,0,0,2,4,4,3,2,2,1,0,0,1,2,1,0,1,2,2,2,2,1,2,3,4,4,3,1,0,1,2,3,3,2,1,1,1,1,1,1,1,3,6,7,7,5,3,1,0,0,0,0,0,0,0];
blockiez_s_sync = [0,1,2,3,5,7,7,6,5,4,4,3,4,5,7,7,6,5,4,2,2,3,4,6,7,7,6,4,2,1,1,3,4,4,5,5,4,3,2,2,3,6,7,7,7,5,3,2,3,5,6,5,3,1,0,0,2,5,7,7,6,5,3,2,3,3,3,3,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,2,3,4,4,3,2,2,2,2,3,4,5,5,5,4,3,2,1,1,2,3,3,3,2,1,0,1,3,5,5,5,5,4,2,1,2,3,4,4,4,4,3,3,4,5,5,5,4,3,2,1,2,4,6,7,6,5,3,2,2,3,4,4,4,3,2,1,0,0];
blockiez_man_sync = [0,0,0,1,3,5,5,3,2,1,1,1,1,1,2,3,4,5,5,5,4,5,6,4,2,1,1,1,2,3,3,3,4,4,5,4,2,2,1,0,0,0,0,0,1,1,1,1,1,1,2,2,3,4,5,4,3,2,2,3,4,3,1,1,1,2,4,4,3,2,1,0,1,3,3,2,1,0,0,0,0,0,0,1,4,5,6,5,3,1,1,2,3,4,4,3,1,0,0,0,0,1,3,4,4,4,5,7,8,8,5,3,1,0,0,1,2,3,5,6,7,7,6,5,5,5,4,3,3,3,2,1,0,0];
blockiez_vakter_sync = [0,0,0,0,0,1,2,3,4,4,5,5,4,4,3,2,2,2,2,3,2,2,4,4,3,3,2,1,2,3,2,1,1,0,1,3,4,3,2,1,1,1,2,5,6,6,4,2,1,1,3,4,4,3,1,1,4,7,8,5,2,1,1,3,5,6,5,2,3,5,4,3,2,1,0,0,0,0,1,3,5,6,5,2,1,1,3,4,4,3,2,2,3,4,4,3,2,1,0,0,0,0,0];
blockiez_flicka_sync = [0,1,2,3,5,5,6,6,5,4,3,2,1,1,2,4,5,5,4,2,1,2,4,6,5,4,3,2,1,2,3,4,5,5,5,4,2,1,1,3,5,6,5,4,3,3,4,6,6,5,4,4,3,2,1,2,5,6,6,5,3,1,1,2,4,4,4,2,1,3,6,9,9,7,4,4,6,8,9,8,7,4,2,1,0];
algen_laugh_sync = [0,0,0,0,0,0,1,1,0,0,0,1,2,2,2,3,3,3,2,1,2,3,4,5,4,2,2,3,3,2,1,1,2,4,5,5,4,2,1,1,1,1,1,2,3,4,4,5,4,2,1,1,1,1,1,1,2,3,4,5,4,2,1,1,0,0,1,2,2,3,2,1,0,0,0,0,0,1,2,3,2,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,3,4,3,2,1,1,1,1,1,1,1,1,1,1,0,0,0,1,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,2,2,2,4,7,9,8,5,4,4,4,3,3,4,5,5,3,1,0,0,1,3,5,7,6,3,2,1,1,1,2,4,6,7,5,3,2,1,1,1,2,3,4,4,3,2,1,1,1,1,2,3,4,4,2,1,1,1,1,1,2,4,3,2,1,0,0,0,1,2,2,1,0,0,0,0,1,2,3,2,1,0,0,0,0,1,2,2,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,2,5,7,7,5,2,1,0,0,0,1,2,3,3,3,2,1,1,1,0,0,0,1,2,2,2,3,3,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
S_star = new Sound(startSoundClip);
S_star.attachSound("starSound");
svartPlatta.soundCheck.onRelease = function()
{
   if(!noMusic)
   {
      noMusic = true;
      startFadeDown(curTrack,0);
      this.gotoAndStop(2);
   }
   else
   {
      noMusic = false;
      startFadeUp(noMusicTrack);
      this.gotoAndStop(1);
   }
};
