S_track.stop();
stream_s.stop();
trace(gameLoadId + " asss");
this["been_played_" + gameLoadId] = true;
gameLoader.loader.loadMovie(_root[gameLoadId + "Path"] + "/main.swf");
function closeGame()
{
   svartPlatta.gotoAndPlay(svartPlatta._currentframe + 2);
   arrow_back.tween(["_alpha","_y"],[0,400],0.4,"linear",0,function()
   {
      removeMovieClip(arrow_back);
      removeMovieClip(arrow_forward);
   }
   );
}
if(curTrack.getVolume() > 0)
{
   startFadeDown(curTrack,0);
}
arrow_back.swapDepths(100006);
arrow_forward.swapDepths(100007);
arrow_back.onRelease = function()
{
   closeGame();
};
arr1Y = arrow_back._y;
arrow_back._y = 450;
arrow_back._alpha = 0;
arrow_back.tween(["_alpha","_y"],[100,arr1Y],1,"easeoutback",1);
arr2Y = arrow_forward._y;
arrow_forward._y = 450;
arrow_forward._alpha = 0;
