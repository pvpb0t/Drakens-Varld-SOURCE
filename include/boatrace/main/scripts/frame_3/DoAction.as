function resetLaps()
{
   laps = 0;
   enemy1Laps = 0;
   enemy2Laps = 0;
   enemy3Laps = 0;
}
function addLap(who)
{
   this[who] = this[who] + 1;
   if(laps == totLaps)
   {
      stopGame = true;
      curLevel++;
      S_goalSound.start();
      if(curLevel == 4)
      {
         goto = "end";
      }
      else
      {
         goto = "track" + curLevel;
      }
      speaker_soundClip.goto = "player";
      speaker_soundClip.play();
      S_ljubel.start();
   }
   else if(enemy1Laps == totLaps or enemy2Laps == totLaps)
   {
      stopGame = true;
      goto = "track" + curLevel;
      if(enemy1Laps == totLaps)
      {
         speaker_soundClip.goto = "enemy1";
      }
      else
      {
         speaker_soundClip.goto = "enemy2";
      }
      S_ljubel.start();
      speaker_soundClip.play();
   }
   if(who == "laps" and laps < totLaps)
   {
      this["S_speaker_idle" + laps].start();
   }
}
S_bgSound.setVolume(40);
S_orgel.setVolume(40);
boat.angle = 0;
enemy1.angle = 0;
enemy2.angle = 0;
resetLaps();
totLaps = 3;
curLevel = 1;
stop();
boatsArr = new Array("boat","enemy1","enemy2");
stopGame = true;
i = 0;
while(i < 12)
{
   this["steer_" + i]._visible = 0;
   i++;
}
