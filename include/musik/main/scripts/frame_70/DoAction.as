draperi.play();
i = 1;
while(i < 5)
{
   this["S_beat_" + i].stop();
   this["S_amb_" + i].stop();
   this["S_bass_" + i].stop();
   this["S_lead_" + i].stop();
   i++;
}
